import db from '../config/database.js';

export const FormModel = {
  // Create a complete form submission
  async createFormSubmission(formData) {
    return new Promise(async (resolve, reject) => {
      try {
        const {
          shipName, imoNumber, grossTonnage, ownerOperator, distinctiveNumber,
          flagState, shipType, otherShipType, locationTerminal, arrivalDateTime,
          departureDateTime, lastPortCountry, nextPortCountry, lastWasteDischargePort,
          lastDischargeDate, nextDischargePort, submittingPerson, deliverAllWaste,
          wasteAnnexI, wasteAnnexII, wasteAnnexIV, wasteAnnexV, wasteAnnexVI,
          retainedAnnexI, retainedAnnexII, retainedAnnexIV, retainedAnnexV,
          remarks, captainSignature, captainAgreed, agentSignature, emaSignature
        } = formData;

        // Start transaction
        db.run('BEGIN TRANSACTION');

        // 1. Create or update ship
        const shipId = await new Promise((resolve, reject) => {
          db.run(
            `INSERT OR REPLACE INTO ships (
              ship_name, imo_number, gross_tonnage, owner_operator,
              distinctive_number, flag_state, ship_type
            ) VALUES (?, ?, ?, ?, ?, ?, ?)`,
            [
              shipName,
              imoNumber,
              grossTonnage,
              ownerOperator,
              distinctiveNumber,
              flagState,
              otherShipType || shipType
            ],
            function(err) {
              if (err) reject(err);
              else resolve(this.lastID || imoNumber);
            }
          );
        });

        // 2. Create port visit
        const portVisitId = await new Promise((resolve, reject) => {
          db.run(
            `INSERT INTO port_visits (
              ship_id, location_terminal, arrival_datetime, departure_datetime,
              last_port_country, next_port_country, last_waste_discharge_port,
              last_discharge_date, next_discharge_port, submitting_person
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
              shipId,
              locationTerminal,
              arrivalDateTime,
              departureDateTime,
              lastPortCountry,
              nextPortCountry,
              lastWasteDischargePort,
              lastDischargeDate,
              nextDischargePort,
              submittingPerson
            ],
            function(err) {
              if (err) reject(err);
              else resolve(this.lastID);
            }
          );
        });

        // 3. Save waste discharges for all annexes
        const saveWasteDischarges = async (annexData, annexName) => {
          if (!annexData) return;
          
          for (const [wasteType, data] of Object.entries(annexData)) {
            if (data && data.quantity) {
              await new Promise((resolve, reject) => {
                db.run(
                  `INSERT INTO waste_discharges (
                    port_visit_id, marpol_annex, waste_type, quantity, substance_name
                  ) VALUES (?, ?, ?, ?, ?)`,
                  [
                    portVisitId,
                    annexName,
                    wasteType,
                    parseFloat(data.quantity),
                    data.substanceName || null
                  ],
                  function(err) {
                    if (err) reject(err);
                    else resolve();
                  }
                );
              });
            }
          }
        };

        await saveWasteDischarges(wasteAnnexI, 'AnnexI');
        await saveWasteDischarges(wasteAnnexII, 'AnnexII');
        await saveWasteDischarges(wasteAnnexIV, 'AnnexIV');
        await saveWasteDischarges(wasteAnnexV, 'AnnexV');
        await saveWasteDischarges(wasteAnnexVI, 'AnnexVI');

        // 4. Save waste retained for all annexes
        const saveWasteRetained = async (retainedData, annexName) => {
          if (!retainedData) return;
          
          for (const [wasteType, data] of Object.entries(retainedData)) {
            if (data && (data.amountRetained || data.maxCapacity)) {
              await new Promise((resolve, reject) => {
                db.run(
                  `INSERT INTO waste_retained (
                    port_visit_id, marpol_annex, waste_type, max_capacity,
                    amount_retained, next_delivery_port, volume_before_next_port
                  ) VALUES (?, ?, ?, ?, ?, ?, ?)`,
                  [
                    portVisitId,
                    annexName,
                    wasteType,
                    parseFloat(data.maxCapacity || 0),
                    parseFloat(data.amountRetained || 0),
                    data.nextDeliveryPort || null,
                    parseFloat(data.volumeBeforeNextPort || 0)
                  ],
                  function(err) {
                    if (err) reject(err);
                    else resolve();
                  }
                );
              });
            }
          }
        };

        await saveWasteRetained(retainedAnnexI, 'AnnexI');
        await saveWasteRetained(retainedAnnexII, 'AnnexII');
        await saveWasteRetained(retainedAnnexIV, 'AnnexIV');
        await saveWasteRetained(retainedAnnexV, 'AnnexV');

        // 5. Create form submission record
        const submissionId = await new Promise((resolve, reject) => {
          db.run(
            `INSERT INTO form_submissions (
              ship_id, port_visit_id, deliver_all_waste, remarks,
              captain_signature, captain_agreed, agent_signature,
              ema_signature
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
            [
              shipId,
              portVisitId,
              deliverAllWaste ? 1 : 0,
              remarks,
              captainSignature,
              captainAgreed ? 1 : 0,
              agentSignature,
              emaSignature
            ],
            function(err) {
              if (err) reject(err);
              else resolve(this.lastID);
            }
          );
        });

        // Commit transaction
        db.run('COMMIT');
        resolve({ 
          success: true, 
          submissionId, 
          shipId, 
          portVisitId,
          message: 'MARPOL form submitted successfully to ENA Waste Management' 
        });

      } catch (error) {
        db.run('ROLLBACK');
        reject(error);
      }
    });
  },

  // Get all form submissions
  async getAllSubmissions() {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT 
          fs.*,
          s.ship_name,
          s.imo_number,
          s.flag_state,
          pv.location_terminal,
          pv.arrival_datetime
        FROM form_submissions fs
        JOIN ships s ON fs.ship_id = s.id
        JOIN port_visits pv ON fs.port_visit_id = pv.id
        ORDER BY fs.submitted_at DESC
      `;
      
      db.all(query, (err, rows) => {
        if (err) reject(err);
        else resolve(rows);
      });
    });
  }
};
