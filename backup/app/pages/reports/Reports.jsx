import React from 'react';

const Reports = () => {
  return (
    <div className="container">
      <div className="card">
        <h1>Compliance Reports</h1>
        <p>View and analyze waste management reports.</p>
        
        <div style={{marginTop: '2rem'}}>
          <div className="card" style={{background: '#f0fdf4', marginBottom: '1rem'}}>
            <h3>Monthly Summary</h3>
            <p>Total waste processed: 1,250 kg</p>
          </div>
          <div className="card" style={{background: '#fffbeb', marginBottom: '1rem'}}>
            <h3>Compliance Status</h3>
            <p>All vessels compliant this month</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Reports;
