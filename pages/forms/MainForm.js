import React, { useState } from 'react';
import { generateMARPOLPDF } from '../../services/pdf/pdfGenerator';
import { wasteApi } from '../../services/api/wasteApi';

const MainForm = () => {
  const [currentStep, setCurrentStep] = useState(1);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [formData, setFormData] = useState({
    // Ship Particulars
    shipName: '',
    imoNumber: '',
    grossTonnage: '',
    ownerOperator: '',
    distinctiveNumber: '',
    flagState: '',
    shipType: '',
    otherShipType: '',
    
    // Port & Voyage
    locationTerminal: '',
    arrivalDateTime: '',
    departureDateTime: '',
    lastPortCountry: '',
    nextPortCountry: '',
    lastWasteDischargePort: '',
    lastDischargeDate: '',
    nextDischargePort: '',
    submittingPerson: '',
    
    // Waste Discharge
    deliverAllWaste: false,
    wasteAnnexI: {},
    wasteAnnexII: {},
    wasteAnnexIV: {},
    wasteAnnexV: {},
    wasteAnnexVI: {},
    
    // Waste Retained
    retainedAnnexI: {},
    retainedAnnexII: {},
    retainedAnnexIV: {},
    retainedAnnexV: {},
    
    // Remarks & Signatures
    remarks: '',
    captainSignature: '',
    captainAgreed: false,
    agentSignature: '',
    emaSignature: ''
  });

  const nextStep = () => setCurrentStep(prev => Math.min(prev + 1, 5));
  const prevStep = () => setCurrentStep(prev => Math.max(prev - 1, 1));

  const steps = [
    { number: 1, title: 'Ship Particulars' },
    { number: 2, title: 'Port & Voyage' },
    { number: 3, title: 'Waste Discharge' },
    { number: 4, title: 'Waste Retained' },
    { number: 5, title: 'Remarks & Signature' }
  ];

  const handleInputChange = (field, value) => {
    setFormData(prev => ({ ...prev, [field]: value }));
  };

  const handleNestedChange = (section, field, value) => {
    setFormData(prev => ({
      ...prev,
      [section]: {
        ...prev[section],
        [field]: value
      }
    }));
  };

  const renderStepContent = () => {
    switch(currentStep) {
      case 1:
        return <ShipParticularsForm formData={formData} onChange={handleInputChange} />;
      case 2:
        return <PortVoyageForm formData={formData} onChange={handleInputChange} />;
      case 3:
        return <WasteDischargeForm formData={formData} onChange={handleInputChange} onNestedChange={handleNestedChange} />;
      case 4:
        return <WasteRetainedForm formData={formData} onChange={handleInputChange} onNestedChange={handleNestedChange} />;
      case 5:
        return <RemarksSignatureForm formData={formData} onChange={handleInputChange} onSubmit={handleSubmit} isSubmitting={isSubmitting} />;
      default:
        return <div>Invalid step</div>;
    }
  };

  const handleSubmit = async () => {
    // Basic validation
    if (!formData.captainSignature || !formData.emaSignature) {
      alert('Please provide required signatures before submitting.');
      return;
    }
    
    if (!formData.captainAgreed) {
      alert('Please certify that the information is accurate and complete.');
      return;
    }

    setIsSubmitting(true);

    try {
      // Generate PDF first
      generateMARPOLPDF(formData);
      
      // Submit to backend
      const result = await wasteApi.submitForm(formData);
      
      console.log('Form submitted to backend:', result);
      alert('MARPOL Form Submitted Successfully! Data saved to database and PDF generated.');
      
      // Reset form
      setFormData({
        shipName: '', imoNumber: '', grossTonnage: '', ownerOperator: '', 
        distinctiveNumber: '', flagState: '', shipType: '', otherShipType: '',
        locationTerminal: '', arrivalDateTime: '', departureDateTime: '', 
        lastPortCountry: '', nextPortCountry: '', lastWasteDischargePort: '',
        lastDischargeDate: '', nextDischargePort: '', submittingPerson: '',
        deliverAllWaste: false, wasteAnnexI: {}, wasteAnnexII: {}, 
        wasteAnnexIV: {}, wasteAnnexV: {}, wasteAnnexVI: {},
        retainedAnnexI: {}, retainedAnnexII: {}, retainedAnnexIV: {}, retainedAnnexV: {},
        remarks: '', captainSignature: '', captainAgreed: false, agentSignature: '', emaSignature: ''
      });
      setCurrentStep(1);
      
    } catch (error) {
      console.error('Form submission failed:', error);
      alert('Failed to submit form to database. Please check your connection and try again.');
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="container">
      <div className="card">
        {/* Progress Bar */}
        <div style={{ marginBottom: '32px' }}>
          <div style={{ 
            display: 'flex', 
            justifyContent: 'space-between',
            marginBottom: '16px'
          }}>
            {steps.map(step => (
              <div key={step.number} style={{ textAlign: 'center', flex: 1 }}>
                <div style={{
                  width: '40px',
                  height: '40px',
                  borderRadius: '50%',
                  backgroundColor: currentStep >= step.number ? 'var(--primary-color)' : 'var(--border-color)',
                  color: currentStep >= step.number ? 'white' : 'var(--text-secondary)',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  margin: '0 auto 8px',
                  fontWeight: 'bold'
                }}>
                  {step.number}
                </div>
                <span style={{ 
                  fontSize: '12px',
                  color: currentStep >= step.number ? 'var(--primary-color)' : 'var(--text-secondary)'
                }}>
                  {step.title}
                </span>
              </div>
            ))}
          </div>
        </div>

        {/* Current Form Section */}
        {renderStepContent()}

        {/* Navigation Buttons */}
        <div style={{ 
          display: 'flex', 
          justifyContent: 'space-between',
          marginTop: '32px',
          paddingTop: '16px',
          borderTop: '1px solid var(--border-color)'
        }}>
          <button 
            onClick={prevStep}
            disabled={currentStep === 1 || isSubmitting}
            className="btn btn-secondary"
            style={{ opacity: currentStep === 1 ? 0.5 : 1 }}
          >
            Previous
          </button>
          
          {currentStep < steps.length ? (
            <button onClick={nextStep} className="btn btn-primary" disabled={isSubmitting}>
              Next
            </button>
          ) : (
            <button 
              onClick={handleSubmit} 
              className="btn btn-success"
              disabled={isSubmitting}
            >
              {isSubmitting ? 'Submitting...' : 'Submit Form & Save to Database'}
            </button>
          )}
        </div>
      </div>
    </div>
  );
};

// Ship Particulars Form Component
const ShipParticularsForm = ({ formData, onChange }) => {
  const shipTypes = [
    'Oil Tanker',
    'Commercial Tanker', 
    'Bulk Tanker',
    'Container',
    'Other cargo ship',
    'Passenger ship',
    'Ro-Ro',
    'Other (specify)'
  ];

  return (
    <div>
      <h3 style={{ color: 'var(--primary-color)', marginBottom: '24px', paddingBottom: '8px', borderBottom: '2px solid var(--border-color)' }}>
        I. SHIP PARTICULARS
      </h3>
      
      <div className="form-grid">
        <div className="form-group">
          <label className="required">Name of Ship</label>
          <input
            type="text"
            value={formData.shipName}
            onChange={(e) => onChange('shipName', e.target.value)}
            placeholder="Enter ship name"
            required
          />
        </div>

        <div className="form-group">
          <label className="required">IMO Number</label>
          <input
            type="text"
            value={formData.imoNumber}
            onChange={(e) => onChange('imoNumber', e.target.value)}
            placeholder="Enter IMO number"
            required
          />
        </div>

        <div className="form-group">
          <label className="required">Gross Tonnage</label>
          <input
            type="number"
            value={formData.grossTonnage}
            onChange={(e) => onChange('grossTonnage', e.target.value)}
            placeholder="Enter gross tonnage"
            required
          />
        </div>

        <div className="form-group">
          <label className="required">Owner or Operator</label>
          <input
            type="text"
            value={formData.ownerOperator}
            onChange={(e) => onChange('ownerOperator', e.target.value)}
            placeholder="Enter owner/operator name"
            required
          />
        </div>

        <div className="form-group">
          <label>Distinctive Number or Letter</label>
          <input
            type="text"
            value={formData.distinctiveNumber}
            onChange={(e) => onChange('distinctiveNumber', e.target.value)}
            placeholder="Enter distinctive number/letter"
          />
        </div>

        <div className="form-group">
          <label className="required">Flag State</label>
          <input
            type="text"
            value={formData.flagState}
            onChange={(e) => onChange('flagState', e.target.value)}
            placeholder="Enter flag state"
            required
          />
        </div>
      </div>

      <div className="form-group">
        <label className="required">Type of Ship</label>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '12px', marginBottom: '16px' }}>
          {shipTypes.map(type => (
            <label key={type} style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
              <input
                type="radio"
                name="shipType"
                value={type}
                checked={formData.shipType === type}
                onChange={(e) => onChange('shipType', e.target.value)}
                required
              />
              {type}
            </label>
          ))}
        </div>
        {formData.shipType === 'Other (specify)' && (
          <input
            type="text"
            placeholder="Please specify ship type"
            value={formData.otherShipType || ''}
            onChange={(e) => onChange('otherShipType', e.target.value)}
            style={{ width: '100%', padding: '12px', border: '1px solid var(--border-color)', borderRadius: '6px' }}
          />
        )}
      </div>
    </div>
  );
};

// Port & Voyage Form Component
const PortVoyageForm = ({ formData, onChange }) => {
  return (
    <div>
      <h3 style={{ color: 'var(--primary-color)', marginBottom: '24px', paddingBottom: '8px', borderBottom: '2px solid var(--border-color)' }}>
        II. PORT AND VOYAGE PARTICULARS
      </h3>
      
      <div className="form-grid">
        <div className="form-group">
          <label className="required">Location/Terminal Name and POC</label>
          <input
            type="text"
            value={formData.locationTerminal}
            onChange={(e) => onChange('locationTerminal', e.target.value)}
            placeholder="Enter location/terminal and point of contact"
            required
          />
        </div>

        <div className="form-group">
          <label className="required">Arrival Date and Time</label>
          <input
            type="datetime-local"
            value={formData.arrivalDateTime}
            onChange={(e) => onChange('arrivalDateTime', e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <label className="required">Departure Date and Time</label>
          <input
            type="datetime-local"
            value={formData.departureDateTime}
            onChange={(e) => onChange('departureDateTime', e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <label className="required">Last Port and Country</label>
          <input
            type="text"
            value={formData.lastPortCountry}
            onChange={(e) => onChange('lastPortCountry', e.target.value)}
            placeholder="Enter last port and country"
            required
          />
        </div>

        <div className="form-group">
          <label>Next Port and Country</label>
          <input
            type="text"
            value={formData.nextPortCountry}
            onChange={(e) => onChange('nextPortCountry', e.target.value)}
            placeholder="Enter next port and country (if known)"
          />
        </div>

        <div className="form-group">
          <label>Last Port where waste was discharged</label>
          <input
            type="text"
            value={formData.lastWasteDischargePort}
            onChange={(e) => onChange('lastWasteDischargePort', e.target.value)}
            placeholder="Enter last waste discharge port"
          />
        </div>

        <div className="form-group">
          <label>Date of Last Discharge</label>
          <input
            type="date"
            value={formData.lastDischargeDate}
            onChange={(e) => onChange('lastDischargeDate', e.target.value)}
          />
        </div>

        <div className="form-group">
          <label>Next Port of discharge</label>
          <input
            type="text"
            value={formData.nextDischargePort}
            onChange={(e) => onChange('nextDischargePort', e.target.value)}
            placeholder="Enter next discharge port (if known)"
          />
        </div>

        <div className="form-group">
          <label>Person submitting this form (if other than Master)</label>
          <input
            type="text"
            value={formData.submittingPerson}
            onChange={(e) => onChange('submittingPerson', e.target.value)}
            placeholder="Enter name if not Master"
          />
        </div>
      </div>
    </div>
  );
};

// Waste Discharge Form Component
const WasteDischargeForm = ({ formData, onChange, onNestedChange }) => {
  const wasteTypes = {
    annexI: [
      { id: 'oilyBilgeWater', label: 'Oily Bilge Water' },
      { id: 'oilyResidues', label: 'Oily Residues (Sludge)' },
      { id: 'oilyTankWashing', label: 'Oily Tank Washing' },
      { id: 'dirtyBallastWater', label: 'Dirty Ballast Water' },
      { id: 'scaleSludge', label: 'Scale and Sludge from Tank Cleaning' },
      { id: 'otherAnnexI', label: 'Other (please specify)' }
    ],
    annexII: [
      { id: 'categoryX', label: 'Category X Substance', requiresName: true },
      { id: 'categoryY', label: 'Category Y Substance', requiresName: true },
      { id: 'categoryZ', label: 'Category Z Substance', requiresName: true },
      { id: 'osSubstances', label: 'OS - Other Substances', requiresName: true }
    ],
    annexIV: [
      { id: 'sewage', label: 'Sewage' }
    ],
    annexV: [
      { id: 'plastics', label: 'A. Plastics' },
      { id: 'foodWaste', label: 'B. Food Waste' },
      { id: 'domesticWaste', label: 'C. Domestic Waste' },
      { id: 'cookingOil', label: 'D. Cooking Oil' },
      { id: 'incineratorAsh', label: 'E. Incinerator Ash' },
      { id: 'operationalWaste', label: 'F. Operational Wastes' },
      { id: 'cargoResidues', label: 'G. Cargo Residues' },
      { id: 'animalCarcasses', label: 'H. Animal Carcass(es)' },
      { id: 'eWaste', label: 'I. E-Waste' }
    ],
    annexVI: [
      { id: 'ozoneDepleting', label: 'Ozone-depleting Substances' },
      { id: 'exhaustResidues', label: 'Exhaust Gas Cleaning Residues' }
    ]
  };

  const handleWasteChange = (annex, wasteId, quantity, substanceName = '') => {
    const currentData = formData[`waste${annex}`] || {};
    onNestedChange(`waste${annex}`, wasteId, { quantity, substanceName });
  };

  const renderWasteTable = (annex, wastes, title) => (
    <div style={{ marginBottom: '32px' }}>
      <h4 style={{ color: 'var(--secondary-color)', marginBottom: '16px' }}>{title}</h4>
      <table className="table">
        <thead>
          <tr>
            <th>Waste Type</th>
            <th>Quantity (m³/MT)</th>
            {wastes.some(w => w.requiresName) && <th>Substance Name</th>}
          </tr>
        </thead>
        <tbody>
          {wastes.map(waste => {
            const wasteData = formData[`waste${annex}`]?.[waste.id] || {};
            return (
              <tr key={waste.id}>
                <td>{waste.label}</td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.quantity || ''}
                    onChange={(e) => handleWasteChange(annex, waste.id, e.target.value, wasteData.substanceName)}
                    style={{ width: '100%', padding: '8px', border: '1px solid var(--border-color)', borderRadius: '4px' }}
                  />
                </td>
                {waste.requiresName && (
                  <td>
                    <input
                      type="text"
                      placeholder="Enter substance name"
                      value={wasteData.substanceName || ''}
                      onChange={(e) => handleWasteChange(annex, waste.id, wasteData.quantity, e.target.value)}
                      style={{ width: '100%', padding: '8px', border: '1px solid var(--border-color)', borderRadius: '4px' }}
                    />
                  </td>
                )}
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );

  return (
    <div>
      <h3 style={{ color: 'var(--primary-color)', marginBottom: '24px', paddingBottom: '8px', borderBottom: '2px solid var(--border-color)' }}>
        III. TYPE AND AMOUNT OF WASTE FOR DISCHARGE TO FACILITY
      </h3>
      
      <div style={{ marginBottom: '24px' }}>
        <label style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <input
            type="checkbox"
            checked={formData.deliverAllWaste}
            onChange={(e) => onChange('deliverAllWaste', e.target.checked)}
          />
          <strong>I confirm that I am delivering all the waste held on board this vessel at this port.</strong>
        </label>
      </div>

      {renderWasteTable('AnnexI', wasteTypes.annexI, 'MARPOL Annex I - Oil')}
      {renderWasteTable('AnnexII', wasteTypes.annexII, 'MARPOL Annex II - NLS')}
      {renderWasteTable('AnnexIV', wasteTypes.annexIV, 'MARPOL Annex IV - Sewage')}
      {renderWasteTable('AnnexV', wasteTypes.annexV, 'MARPOL Annex V - Garbage')}
      {renderWasteTable('AnnexVI', wasteTypes.annexVI, 'MARPOL Annex VI - Air Pollution')}

      <div className="warning-message">
        <strong>NB: ZERO WASTE WILL NOT BE RESPONSIBLE FOR ANY UNDISCLOSED HAZARDOUS WASTE</strong>
      </div>
    </div>
  );
};

// Waste Retained Form Component
const WasteRetainedForm = ({ formData, onChange, onNestedChange }) => {
  const wasteTypes = {
    annexI: [
      { id: 'oilyBilgeWater', label: 'Oily Bilge Water' },
      { id: 'oilyResidues', label: 'Oily Residues (Sludge)' },
      { id: 'oilyTankWashing', label: 'Oily Tank Washing' },
      { id: 'dirtyBallastWater', label: 'Dirty Ballast Water' },
      { id: 'scaleSludge', label: 'Scale and Sludge from Tank Cleaning' },
      { id: 'otherAnnexI', label: 'Other (please specify)' }
    ],
    annexII: [
      { id: 'categoryX', label: 'Category X Substance' },
      { id: 'categoryY', label: 'Category Y Substance' },
      { id: 'categoryZ', label: 'Category Z Substance' },
      { id: 'osSubstances', label: 'OS - Other Substances' }
    ],
    annexIV: [
      { id: 'sewage', label: 'Sewage' }
    ],
    annexV: [
      { id: 'plastics', label: 'A. Plastic' },
      { id: 'foodWaste', label: 'B. Food Waste' },
      { id: 'domesticWaste', label: 'C. Domestic Waste' },
      { id: 'cookingOil', label: 'D. Cooking Oil' },
      { id: 'incineratorAsh', label: 'E. Incinerator Ash' },
      { id: 'operationalWaste', label: 'F. Operational Waste' },
      { id: 'cargoResidues', label: 'G. Cargo Residues' },
      { id: 'animalCarcasses', label: 'H. Animal Carcass(es)' },
      { id: 'eWaste', label: 'I. E-Waste' }
    ]
  };

  const handleRetainedChange = (annex, wasteId, field, value) => {
    const currentData = formData[`retained${annex}`] || {};
    const wasteData = currentData[wasteId] || {};
    
    onNestedChange(`retained${annex}`, wasteId, {
      ...wasteData,
      [field]: value
    });
  };

  const renderRetainedTable = (annex, wastes, title) => (
    <div style={{ marginBottom: '32px' }}>
      <h4 style={{ color: 'var(--secondary-color)', marginBottom: '16px' }}>{title}</h4>
      <table className="table">
        <thead>
          <tr>
            <th>Waste Type</th>
            <th>Max Storage Capacity (m³)</th>
            <th>Amount Retained (m³)</th>
            <th>Next Delivery Port</th>
            <th>Volume Before Next Port (m³)</th>
          </tr>
        </thead>
        <tbody>
          {wastes.map(waste => {
            const wasteData = formData[`retained${annex}`]?.[waste.id] || {};
            return (
              <tr key={waste.id}>
                <td>{waste.label}</td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.maxCapacity || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'maxCapacity', e.target.value)}
                    style={{ width: '100%', padding: '8px', border: '1px solid var(--border-color)', borderRadius: '4px' }}
                  />
                </td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.amountRetained || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'amountRetained', e.target.value)}
                    style={{ width: '100%', padding: '8px', border: '1px solid var(--border-color)', borderRadius: '4px' }}
                  />
                </td>
                <td>
                  <input
                    type="text"
                    placeholder="Port name"
                    value={wasteData.nextDeliveryPort || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'nextDeliveryPort', e.target.value)}
                    style={{ width: '100%', padding: '8px', border: '1px solid var(--border-color)', borderRadius: '4px' }}
                  />
                </td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.volumeBeforeNextPort || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'volumeBeforeNextPort', e.target.value)}
                    style={{ width: '100%', padding: '8px', border: '1px solid var(--border-color)', borderRadius: '4px' }}
                  />
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );

  return (
    <div>
      <h3 style={{ color: 'var(--primary-color)', marginBottom: '24px', paddingBottom: '8px', borderBottom: '2px solid var(--border-color)' }}>
        IV. WASTE RETAINED ON BOARD
      </h3>
      
      <p style={{ marginBottom: '24px', color: 'var(--text-secondary)' }}>
        Please complete this section if you are NOT delivering all waste at this port.
      </p>

      {renderRetainedTable('AnnexI', wasteTypes.annexI, 'MARPOL Annex I - Oil')}
      {renderRetainedTable('AnnexII', wasteTypes.annexII, 'MARPOL Annex II - NLS')}
      {renderRetainedTable('AnnexIV', wasteTypes.annexIV, 'MARPOL Annex IV - Sewage')}
      {renderRetainedTable('AnnexV', wasteTypes.annexV, 'MARPOL Annex V - Garbage')}
    </div>
  );
};

// Remarks & Signature Form Component
const RemarksSignatureForm = ({ formData, onChange, onSubmit, isSubmitting }) => {
  return (
    <div>
      <h3 style={{ color: 'var(--primary-color)', marginBottom: '24px', paddingBottom: '8px', borderBottom: '2px solid var(--border-color)' }}>
        V. REMARKS AND SIGNATURES
      </h3>
      
      <div className="form-group">
        <label>Remarks</label>
        <textarea
          rows="4"
          value={formData.remarks}
          onChange={(e) => onChange('remarks', e.target.value)}
          placeholder="Enter any additional remarks or notes..."
          style={{ width: '100%', resize: 'vertical' }}
        />
      </div>

      <div className="form-grid" style={{ marginTop: '32px' }}>
        <div className="form-group">
          <label className="required">Chief Engineer / Captain Signature</label>
          <input
            type="text"
            value={formData.captainSignature}
            onChange={(e) => onChange('captainSignature', e.target.value)}
            placeholder="Enter full name"
            required
            disabled={isSubmitting}
          />
          <div style={{ marginTop: '8px' }}>
            <label style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
              <input
                type="checkbox"
                checked={formData.captainAgreed}
                onChange={(e) => onChange('captainAgreed', e.target.checked)}
                required
                disabled={isSubmitting}
              />
              I certify that the information provided is accurate and complete
            </label>
          </div>
        </div>

        <div className="form-group">
          <label>Agent Signature</label>
          <input
            type="text"
            value={formData.agentSignature}
            onChange={(e) => onChange('agentSignature', e.target.value)}
            placeholder="Enter agent name"
            disabled={isSubmitting}
          />
        </div>

        <div className="form-group">
          <label className="required">ENA Waste Management Signature</label>
          <input
            type="text"
            value={formData.emaSignature}
            onChange={(e) => onChange('emaSignature', e.target.value)}
            placeholder="Enter ENA representative name"
            required
            disabled={isSubmitting}
          />
        </div>
      </div>

      <div style={{ 
        marginTop: '32px', 
        padding: '16px', 
        backgroundColor: '#f0f9ff',
        border: '1px solid #bae6fd',
        borderRadius: '6px'
      }}>
        <h4 style={{ color: 'var(--primary-color)', marginBottom: '8px' }}>
          Form Completion
        </h4>
        <p style={{ color: 'var(--text-secondary)', marginBottom: '16px' }}>
          {isSubmitting 
            ? 'Submitting form to database and generating PDF...' 
            : 'Review all entered information before submitting. Data will be saved to the database and a PDF will be generated.'}
        </p>
      </div>
    </div>
  );
};

export default MainForm;
