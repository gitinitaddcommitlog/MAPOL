import React from 'react';

const Dashboard = () => {
  return (
    <div className="container">
      <div className="card">
        <h1>Dashboard</h1>
        <p>Welcome to ENA Waste Management MARPOL Compliance System</p>
        <div style={{marginTop: '2rem', display: 'grid', gap: '1rem'}}>
          <div className="card" style={{background: '#f0f9ff'}}>
            <h3>Quick Actions</h3>
            <p>Access forms and reports from the navigation menu.</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
