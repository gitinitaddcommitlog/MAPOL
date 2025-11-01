#!/bin/bash
# BEAUTIFY-FORMS.sh - Create Professional Forms Design

echo "🎨 CREATING BEAUTIFUL PROFESSIONAL FORMS"

# 1. First, let's add enhanced form styling to the CSS
cat >> app/styles/globals.css << 'EOF'

/* ===== ENHANCED FORM STYLES ===== */
.form-container {
  max-width: 1000px;
  margin: 0 auto;
}

.form-progress {
  background: white;
  border-radius: 16px;
  padding: 2rem;
  margin-bottom: 2rem;
  box-shadow: var(--shadow-lg);
  border: 1px solid var(--border-light);
}

.progress-steps {
  display: flex;
  justify-content: space-between;
  position: relative;
  margin-bottom: 2rem;
}

.progress-steps::before {
  content: '';
  position: absolute;
  top: 20px;
  left: 0;
  right: 0;
  height: 3px;
  background: var(--border-color);
  z-index: 1;
}

.progress-step {
  text-align: center;
  flex: 1;
  position: relative;
  z-index: 2;
}

.progress-circle {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 12px;
  font-weight: 700;
  font-size: 16px;
  border: 3px solid var(--border-color);
  background: white;
  transition: all 0.3s ease;
  position: relative;
}

.progress-circle.active {
  background: var(--gradient-primary);
  border-color: var(--primary-color);
  color: white;
  transform: scale(1.1);
  box-shadow: 0 4px 12px rgba(26, 54, 93, 0.3);
}

.progress-circle.completed {
  background: var(--success-color);
  border-color: var(--success-color);
  color: white;
}

.progress-label {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--text-secondary);
  transition: all 0.3s ease;
}

.progress-label.active {
  color: var(--primary-color);
  font-weight: 700;
}

/* Enhanced Form Sections */
.form-section {
  background: white;
  border-radius: 16px;
  padding: 2.5rem;
  margin-bottom: 2rem;
  box-shadow: var(--shadow-lg);
  border: 1px solid var(--border-light);
  transition: all 0.3s ease;
}

.form-section:hover {
  box-shadow: var(--shadow-xl);
}

.section-header {
  color: var(--primary-color);
  margin-bottom: 2rem;
  padding-bottom: 1rem;
  border-bottom: 3px solid var(--border-light);
  position: relative;
}

.section-header::after {
  content: '';
  position: absolute;
  bottom: -3px;
  left: 0;
  width: 80px;
  height: 3px;
  background: var(--gradient-accent);
  border-radius: 3px;
}

/* Enhanced Form Grid */
.enhanced-form-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
  margin-bottom: 1.5rem;
}

/* Professional Form Groups */
.enhanced-form-group {
  margin-bottom: 1.5rem;
}

.enhanced-form-group label {
  display: block;
  font-weight: 600;
  margin-bottom: 0.75rem;
  color: var(--text-primary);
  font-size: 0.95rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.enhanced-form-group label.required::after {
  content: "*";
  color: var(--error-color);
  margin-left: 0.25rem;
}

.enhanced-form-group input,
.enhanced-form-group select,
.enhanced-form-group textarea {
  width: 100%;
  padding: 1rem;
  border: 2px solid var(--border-color);
  border-radius: 12px;
  font-size: 1rem;
  transition: all 0.3s ease;
  background: var(--surface-color);
  font-family: var(--font-body);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.enhanced-form-group input:focus,
.enhanced-form-group select:focus,
.enhanced-form-group textarea:focus {
  outline: none;
  border-color: var(--secondary-color);
  box-shadow: 0 0 0 4px rgba(0, 168, 204, 0.1);
  background: var(--surface-elevated);
  transform: translateY(-1px);
}

.enhanced-form-group input:hover,
.enhanced-form-group select:hover,
.enhanced-form-group textarea:hover {
  border-color: var(--primary-light);
}

/* Radio and Checkbox Groups */
.radio-group {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin-bottom: 1rem;
}

.radio-option {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 1rem;
  border: 2px solid var(--border-color);
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  background: white;
}

.radio-option:hover {
  border-color: var(--secondary-color);
  background: #f8fdff;
}

.radio-option input[type="radio"] {
  margin: 0;
  width: 18px;
  height: 18px;
}

.radio-option.selected {
  border-color: var(--secondary-color);
  background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
  box-shadow: 0 4px 12px rgba(0, 168, 204, 0.15);
}

/* Enhanced Tables */
.enhanced-table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin: 1.5rem 0;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: var(--shadow-md);
  background: white;
}

.enhanced-table th {
  background: var(--gradient-primary);
  color: white;
  font-weight: 600;
  padding: 1.25rem;
  text-align: left;
  font-size: 0.9rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.enhanced-table td {
  padding: 1.25rem;
  border-bottom: 1px solid var(--border-light);
  background: white;
  transition: background 0.2s ease;
}

.enhanced-table tr:hover td {
  background: #f8fafc;
}

.enhanced-table tr:last-child td {
  border-bottom: none;
}

.enhanced-table input {
  width: 100%;
  padding: 0.75rem;
  border: 2px solid var(--border-color);
  border-radius: 8px;
  font-size: 0.9rem;
  transition: all 0.3s ease;
}

.enhanced-table input:focus {
  outline: none;
  border-color: var(--secondary-color);
  box-shadow: 0 0 0 3px rgba(0, 168, 204, 0.1);
}

/* Form Navigation */
.form-navigation {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 2rem;
  padding-top: 2rem;
  border-top: 2px solid var(--border-light);
}

.nav-btn {
  padding: 1rem 2rem;
  border: none;
  border-radius: 12px;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 0.75rem;
  min-width: 140px;
  justify-content: center;
}

.nav-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
  transform: none !important;
}

.nav-btn-prev {
  background: white;
  color: var(--text-primary);
  border: 2px solid var(--border-color);
}

.nav-btn-prev:hover:not(:disabled) {
  background: #f8fafc;
  border-color: var(--primary-color);
  color: var(--primary-color);
  transform: translateX(-2px);
}

.nav-btn-next {
  background: var(--gradient-primary);
  color: white;
  box-shadow: 0 4px 14px rgba(26, 54, 93, 0.2);
}

.nav-btn-next:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(26, 54, 93, 0.3);
}

.nav-btn-submit {
  background: linear-gradient(135deg, var(--success-color), #059669);
  color: white;
  box-shadow: 0 4px 14px rgba(16, 185, 129, 0.3);
}

.nav-btn-submit:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(16, 185, 129, 0.4);
}

/* Warning and Info Messages */
.form-warning {
  background: linear-gradient(135deg, #fffbeb, #fef3c7);
  border: 1px solid #f59e0b;
  border-left: 4px solid var(--warning-color);
  color: #92400e;
  padding: 1.5rem;
  border-radius: 12px;
  margin: 1.5rem 0;
  box-shadow: var(--shadow-sm);
}

.form-info {
  background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
  border: 1px solid var(--secondary-color);
  border-left: 4px solid var(--secondary-color);
  color: var(--primary-color);
  padding: 1.5rem;
  border-radius: 12px;
  margin: 1.5rem 0;
  box-shadow: var(--shadow-sm);
}

/* Responsive Forms */
@media (max-width: 768px) {
  .form-section {
    padding: 1.5rem;
    margin-bottom: 1rem;
  }
  
  .enhanced-form-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }
  
  .progress-steps {
    flex-wrap: wrap;
    gap: 1rem;
  }
  
  .progress-step {
    flex: 0 0 calc(50% - 0.5rem);
  }
  
  .nav-btn {
    padding: 0.875rem 1.5rem;
    min-width: 120px;
    font-size: 0.9rem;
  }
  
  .enhanced-table {
    font-size: 0.8rem;
  }
  
  .enhanced-table th,
  .enhanced-table td {
    padding: 0.75rem;
  }
}

/* Custom Checkbox and Radio */
.enhanced-checkbox {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 1rem;
  border: 2px solid var(--border-color);
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  background: white;
  margin-bottom: 0.5rem;
}

.enhanced-checkbox:hover {
  border-color: var(--secondary-color);
  background: #f8fdff;
}

.enhanced-checkbox.checked {
  border-color: var(--secondary-color);
  background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
  box-shadow: 0 4px 12px rgba(0, 168, 204, 0.15);
}

.enhanced-checkbox input[type="checkbox"] {
  margin: 0;
  width: 18px;
  height: 18px;
}
EOF

# 2. Now create a beautifully styled forms page
cat > app/pages/forms/MainForm.jsx << 'EOF'
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { generateMARPOLPDF } from '../../services/pdf/pdfGenerator';
import { wasteApi } from '../../services/api/wasteApi';

const MainForm = () => {
  const [currentStep, setCurrentStep] = useState(1);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const navigate = useNavigate();
  
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

  const steps = [
    { number: 1, title: 'Ship Details', icon: '🚢' },
    { number: 2, title: 'Port & Voyage', icon: '🌊' },
    { number: 3, title: 'Waste Discharge', icon: '🗑️' },
    { number: 4, title: 'Waste Retained', icon: '📦' },
    { number: 5, title: 'Review & Sign', icon: '📝' }
  ];

  const nextStep = () => setCurrentStep(prev => Math.min(prev + 1, 5));
  const prevStep = () => setCurrentStep(prev => Math.max(prev - 1, 1));

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

  const handleSubmit = async () => {
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
      generateMARPOLPDF(formData);
      const result = await wasteApi.submitForm(formData);
      
      console.log('Form submitted to backend:', result);
      alert('MARPOL Form Submitted Successfully! Data saved to database and PDF generated.');
      
      // Reset form and redirect to dashboard
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
      navigate('/');
      
    } catch (error) {
      console.error('Form submission failed:', error);
      alert('Failed to submit form to database. Please check your connection and try again.');
    } finally {
      setIsSubmitting(false);
    }
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

  return (
    <div className="container form-container">
      {/* Progress Bar */}
      <div className="form-progress">
        <h1 style={{ color: 'var(--primary-color)', marginBottom: '2rem', textAlign: 'center' }}>
          MARPOL Waste Declaration Form
        </h1>
        
        <div className="progress-steps">
          {steps.map(step => (
            <div key={step.number} className="progress-step">
              <div className={`progress-circle ${currentStep >= step.number ? (currentStep === step.number ? 'active' : 'completed') : ''}`}>
                {currentStep > step.number ? '✓' : step.icon}
              </div>
              <div className={`progress-label ${currentStep === step.number ? 'active' : ''}`}>
                {step.title}
              </div>
            </div>
          ))}
        </div>

        <div style={{ textAlign: 'center', color: 'var(--text-secondary)' }}>
          Step {currentStep} of {steps.length} - {steps[currentStep - 1]?.title}
        </div>
      </div>

      {/* Current Form Section */}
      <div className="form-section">
        {renderStepContent()}
      </div>

      {/* Navigation Buttons */}
      <div className="form-navigation">
        <button 
          onClick={prevStep}
          disabled={currentStep === 1 || isSubmitting}
          className="nav-btn nav-btn-prev"
        >
          ← Previous
        </button>
        
        <div style={{ flex: 1 }}></div>
        
        {currentStep < steps.length ? (
          <button onClick={nextStep} className="nav-btn nav-btn-next" disabled={isSubmitting}>
            Next →
          </button>
        ) : (
          <button 
            onClick={handleSubmit} 
            className="nav-btn nav-btn-submit"
            disabled={isSubmitting}
          >
            {isSubmitting ? (
              <>⏳ Submitting...</>
            ) : (
              <>✅ Submit Form</>
            )}
          </button>
        )}
      </div>
    </div>
  );
};

// Ship Particulars Form Component - Enhanced
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
      <div className="section-header">
        <h2>🚢 I. SHIP PARTICULARS</h2>
        <p style={{ color: 'var(--text-secondary)', margin: '0.5rem 0 0 0', fontSize: '1rem' }}>
          Complete all ship identification details
        </p>
      </div>
      
      <div className="enhanced-form-grid">
        <div className="enhanced-form-group">
          <label className="required">Name of Ship</label>
          <input
            type="text"
            value={formData.shipName}
            onChange={(e) => onChange('shipName', e.target.value)}
            placeholder="Enter ship name"
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label className="required">IMO Number</label>
          <input
            type="text"
            value={formData.imoNumber}
            onChange={(e) => onChange('imoNumber', e.target.value)}
            placeholder="Enter IMO number"
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label className="required">Gross Tonnage</label>
          <input
            type="number"
            value={formData.grossTonnage}
            onChange={(e) => onChange('grossTonnage', e.target.value)}
            placeholder="Enter gross tonnage"
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label className="required">Owner or Operator</label>
          <input
            type="text"
            value={formData.ownerOperator}
            onChange={(e) => onChange('ownerOperator', e.target.value)}
            placeholder="Enter owner/operator name"
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label>Distinctive Number or Letter</label>
          <input
            type="text"
            value={formData.distinctiveNumber}
            onChange={(e) => onChange('distinctiveNumber', e.target.value)}
            placeholder="Enter distinctive number/letter"
          />
        </div>

        <div className="enhanced-form-group">
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

      <div className="enhanced-form-group">
        <label className="required">Type of Ship</label>
        <div className="radio-group">
          {shipTypes.map(type => (
            <label 
              key={type} 
              className={`radio-option ${formData.shipType === type ? 'selected' : ''}`}
            >
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
            className="enhanced-form-group"
            style={{ marginTop: '1rem' }}
          />
        )}
      </div>
    </div>
  );
};

// Port & Voyage Form Component - Enhanced
const PortVoyageForm = ({ formData, onChange }) => {
  return (
    <div>
      <div className="section-header">
        <h2>🌊 II. PORT AND VOYAGE PARTICULARS</h2>
        <p style={{ color: 'var(--text-secondary)', margin: '0.5rem 0 0 0', fontSize: '1rem' }}>
          Enter port arrival, departure, and voyage details
        </p>
      </div>
      
      <div className="enhanced-form-grid">
        <div className="enhanced-form-group">
          <label className="required">Location/Terminal Name and POC</label>
          <input
            type="text"
            value={formData.locationTerminal}
            onChange={(e) => onChange('locationTerminal', e.target.value)}
            placeholder="Enter location/terminal and point of contact"
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label className="required">Arrival Date and Time</label>
          <input
            type="datetime-local"
            value={formData.arrivalDateTime}
            onChange={(e) => onChange('arrivalDateTime', e.target.value)}
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label className="required">Departure Date and Time</label>
          <input
            type="datetime-local"
            value={formData.departureDateTime}
            onChange={(e) => onChange('departureDateTime', e.target.value)}
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label className="required">Last Port and Country</label>
          <input
            type="text"
            value={formData.lastPortCountry}
            onChange={(e) => onChange('lastPortCountry', e.target.value)}
            placeholder="Enter last port and country"
            required
          />
        </div>

        <div className="enhanced-form-group">
          <label>Next Port and Country</label>
          <input
            type="text"
            value={formData.nextPortCountry}
            onChange={(e) => onChange('nextPortCountry', e.target.value)}
            placeholder="Enter next port and country (if known)"
          />
        </div>

        <div className="enhanced-form-group">
          <label>Last Port where waste was discharged</label>
          <input
            type="text"
            value={formData.lastWasteDischargePort}
            onChange={(e) => onChange('lastWasteDischargePort', e.target.value)}
            placeholder="Enter last waste discharge port"
          />
        </div>

        <div className="enhanced-form-group">
          <label>Date of Last Discharge</label>
          <input
            type="date"
            value={formData.lastDischargeDate}
            onChange={(e) => onChange('lastDischargeDate', e.target.value)}
          />
        </div>

        <div className="enhanced-form-group">
          <label>Next Port of discharge</label>
          <input
            type="text"
            value={formData.nextDischargePort}
            onChange={(e) => onChange('nextDischargePort', e.target.value)}
            placeholder="Enter next discharge port (if known)"
          />
        </div>

        <div className="enhanced-form-group">
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

// Waste Discharge Form Component - Enhanced
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
    <div style={{ marginBottom: '2rem' }}>
      <h4 style={{ color: 'var(--secondary-color)', marginBottom: '1.5rem', paddingBottom: '0.5rem', borderBottom: '2px solid var(--border-light)' }}>
        {title}
      </h4>
      <table className="enhanced-table">
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
                <td style={{ fontWeight: '500' }}>{waste.label}</td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.quantity || ''}
                    onChange={(e) => handleWasteChange(annex, waste.id, e.target.value, wasteData.substanceName)}
                  />
                </td>
                {waste.requiresName && (
                  <td>
                    <input
                      type="text"
                      placeholder="Enter substance name"
                      value={wasteData.substanceName || ''}
                      onChange={(e) => handleWasteChange(annex, waste.id, wasteData.quantity, e.target.value)}
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
      <div className="section-header">
        <h2>🗑️ III. TYPE AND AMOUNT OF WASTE FOR DISCHARGE</h2>
        <p style={{ color: 'var(--text-secondary)', margin: '0.5rem 0 0 0', fontSize: '1rem' }}>
          Specify waste types and quantities for discharge
        </p>
      </div>
      
      <div style={{ marginBottom: '2rem' }}>
        <label className={`enhanced-checkbox ${formData.deliverAllWaste ? 'checked' : ''}`}>
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

      <div className="form-warning">
        <strong>⚠️ IMPORTANT:</strong> ZERO WASTE WILL NOT BE RESPONSIBLE FOR ANY UNDISCLOSED HAZARDOUS WASTE
      </div>
    </div>
  );
};

// Waste Retained Form Component - Enhanced
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
    <div style={{ marginBottom: '2rem' }}>
      <h4 style={{ color: 'var(--secondary-color)', marginBottom: '1.5rem', paddingBottom: '0.5rem', borderBottom: '2px solid var(--border-light)' }}>
        {title}
      </h4>
      <table className="enhanced-table">
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
                <td style={{ fontWeight: '500' }}>{waste.label}</td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.maxCapacity || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'maxCapacity', e.target.value)}
                  />
                </td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.amountRetained || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'amountRetained', e.target.value)}
                  />
                </td>
                <td>
                  <input
                    type="text"
                    placeholder="Port name"
                    value={wasteData.nextDeliveryPort || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'nextDeliveryPort', e.target.value)}
                  />
                </td>
                <td>
                  <input
                    type="number"
                    step="0.01"
                    placeholder="0.00"
                    value={wasteData.volumeBeforeNextPort || ''}
                    onChange={(e) => handleRetainedChange(annex, waste.id, 'volumeBeforeNextPort', e.target.value)}
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
      <div className="section-header">
        <h2>📦 IV. WASTE RETAINED ON BOARD</h2>
        <p style={{ color: 'var(--text-secondary)', margin: '0.5rem 0 0 0', fontSize: '1rem' }}>
          Complete this section if NOT delivering all waste at this port
        </p>
      </div>

      {renderRetainedTable('AnnexI', wasteTypes.annexI, 'MARPOL Annex I - Oil')}
      {renderRetainedTable('AnnexII', wasteTypes.annexII, 'MARPOL Annex II - NLS')}
      {renderRetainedTable('AnnexIV', wasteTypes.annexIV, 'MARPOL Annex IV - Sewage')}
      {renderRetainedTable('AnnexV', wasteTypes.annexV, 'MARPOL Annex V - Garbage')}
    </div>
  );
};

// Remarks & Signature Form Component - Enhanced
const RemarksSignatureForm = ({ formData, onChange, onSubmit, isSubmitting }) => {
  return (
    <div>
      <div className="section-header">
        <h2>📝 V. REMARKS AND SIGNATURES</h2>
        <p style={{ color: 'var(--text-secondary)', margin: '0.5rem 0 0 0', fontSize: '1rem' }}>
          Final review and authorization
        </p>
      </div>
      
      <div className="enhanced-form-group">
        <label>Remarks</label>
        <textarea
          rows="4"
          value={formData.remarks}
          onChange={(e) => onChange('remarks', e.target.value)}
          placeholder="Enter any additional remarks or notes..."
          style={{ 
            width: '100%', 
            resize: 'vertical',
            padding: '1rem',
            border: '2px solid var(--border-color)',
            borderRadius: '12px',
            fontSize: '1rem',
            fontFamily: 'inherit'
          }}
        />
      </div>

      <div className="enhanced-form-grid" style={{ marginTop: '2rem' }}>
        <div className="enhanced-form-group">
          <label className="required">Chief Engineer / Captain Signature</label>
          <input
            type="text"
            value={formData.captainSignature}
            onChange={(e) => onChange('captainSignature', e.target.value)}
            placeholder="Enter full name"
            required
            disabled={isSubmitting}
          />
          <div style={{ marginTop: '1rem' }}>
            <label className={`enhanced-checkbox ${formData.captainAgreed ? 'checked' : ''}`}>
              <input
                type="checkbox"
                checked={formData.captainAgreed}
                onChange={(e) => onChange('captainAgreed', e.target.checked)}
                required
                disabled={isSubmitting}
              />
              <strong>I certify that the information provided is accurate and complete</strong>
            </label>
          </div>
        </div>

        <div className="enhanced-form-group">
          <label>Agent Signature</label>
          <input
            type="text"
            value={formData.agentSignature}
            onChange={(e) => onChange('agentSignature', e.target.value)}
            placeholder="Enter agent name"
            disabled={isSubmitting}
          />
        </div>

        <div className="enhanced-form-group">
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

      <div className="form-info">
        <h4 style={{ color: 'var(--primary-color)', marginBottom: '0.5rem' }}>
          📋 Form Completion
        </h4>
        <p style={{ color: 'var(--text-secondary)', margin: 0 }}>
          {isSubmitting 
            ? 'Submitting form to database and generating PDF...' 
            : 'Review all entered information before submitting. Data will be saved to the database and a PDF will be generated.'}
        </p>
      </div>
    </div>
  );
};

export default MainForm;
EOF

echo "✅ BEAUTIFUL FORMS CREATED!"
echo ""
echo "🎯 ENHANCEMENTS ADDED:"
echo "======================"
echo "✅ Modern, clean design with professional styling"
echo "✅ Enhanced progress bar with icons and animations"
echo "✅ Beautiful form sections with hover effects"
echo "✅ Professional input fields with focus states"
echo "✅ Enhanced radio buttons and checkboxes"
echo "✅ Beautiful tables with proper spacing"
echo "✅ Professional navigation buttons"
echo "✅ Responsive design for all devices"
echo "✅ Better user experience and visual hierarchy"

# 3. Build and deploy
echo ""
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Deploying beautiful forms..."
    git add .
    git commit -m "DESIGN: Beautiful professional forms with enhanced UX"
    git push origin main
    echo ""
    echo "🎉 BEAUTIFUL FORMS DEPLOYED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/#/form"
    echo ""
    echo "Your forms should now look professional and user-friendly!"
else
    echo "❌ Build failed"
fi
EOF

chmod +x BEAUTIFY-FORMS.sh
./BEAUTIFY-FORMS.sh