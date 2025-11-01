import db from '../config/database.js';

export const ShipModel = {
  // Create or find ship by IMO number
  async findOrCreate(shipData) {
    return new Promise((resolve, reject) => {
      // First try to find existing ship
      db.get(
        'SELECT * FROM ships WHERE imo_number = ?',
        [shipData.imoNumber],
        (err, row) => {
          if (err) {
            reject(err);
            return;
          }
          
          if (row) {
            // Update existing ship
            db.run(
              `UPDATE ships SET 
                ship_name = ?, gross_tonnage = ?, owner_operator = ?,
                distinctive_number = ?, flag_state = ?, ship_type = ?,
                updated_at = CURRENT_TIMESTAMP
               WHERE imo_number = ?`,
              [
                shipData.shipName,
                shipData.grossTonnage,
                shipData.ownerOperator,
                shipData.distinctiveNumber,
                shipData.flagState,
                shipData.shipType,
                shipData.imoNumber
              ],
              function(err) {
                if (err) {
                  reject(err);
                } else {
                  resolve({ id: row.id, ...shipData, isNew: false });
                }
              }
            );
          } else {
            // Create new ship
            db.run(
              `INSERT INTO ships (
                ship_name, imo_number, gross_tonnage, owner_operator,
                distinctive_number, flag_state, ship_type
              ) VALUES (?, ?, ?, ?, ?, ?, ?)`,
              [
                shipData.shipName,
                shipData.imoNumber,
                shipData.grossTonnage,
                shipData.ownerOperator,
                shipData.distinctiveNumber,
                shipData.flagState,
                shipData.shipType
              ],
              function(err) {
                if (err) {
                  reject(err);
                } else {
                  resolve({ id: this.lastID, ...shipData, isNew: true });
                }
              }
            );
          }
        }
      );
    });
  },

  // Get all ships
  async getAll() {
    return new Promise((resolve, reject) => {
      db.all('SELECT * FROM ships ORDER BY created_at DESC', (err, rows) => {
        if (err) reject(err);
        else resolve(rows);
      });
    });
  },

  // Get ship by IMO number
  async getByImo(imoNumber) {
    return new Promise((resolve, reject) => {
      db.get('SELECT * FROM ships WHERE imo_number = ?', [imoNumber], (err, row) => {
        if (err) reject(err);
        else resolve(row);
      });
    });
  }
};
