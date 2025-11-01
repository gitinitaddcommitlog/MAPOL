import React from 'react';

const MainForm = () => {
  return (
    <div className="container">
      <div className="card">
        <h1>MARPOL Waste Forms</h1>
        <p>Complete waste management declaration forms here.</p>
        
        <div style={{marginTop: '2rem'}}>
          <div className="form-group">
            <label>Vessel Name</label>
            <input type="text" placeholder="Enter vessel name" />
          </div>
          <div className="form-group">
            <label>Waste Type</label>
            <select>
              <option>Plastic Waste</option>
              <option>Food Waste</option>
              <option>Oily Waste</option>
              <option>Other</option>
            </select>
          </div>
          <button className="btn-primary" style={{marginTop: '1rem'}}>
            Submit Form
          </button>
        </div>
      </div>
    </div>
  );
};

export default MainForm;
