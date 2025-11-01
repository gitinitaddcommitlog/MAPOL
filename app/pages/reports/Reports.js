import React from 'react';

const Reports = () => {
  return (
    <div className="container-narrow">
      <div className="card-elevated">
        <div style={{ textAlign: 'center', marginBottom: '40px' }}>
          <h1 style={{ 
            color: 'var(--text-primary)', 
            marginBottom: '16px',
            fontSize: '2.5rem',
            fontWeight: 700
          }}>
            Analytics & Reports
          </h1>
          <p style={{ 
            color: 'var(--text-secondary)', 
            fontSize: '1.125rem',
            maxWidth: '600px',
            margin: '0 auto'
          }}>
            Comprehensive waste management analytics and compliance reporting
          </p>
        </div>

        <div style={{ 
          display: 'grid', 
          gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', 
          gap: '24px',
          marginBottom: '40px'
        }}>
          <div className="card" style={{ textAlign: 'center', padding: '40px 24px' }}>
            <div style={{ fontSize: '48px', marginBottom: '16px' }}>📊</div>
            <h3 style={{ marginBottom: '12px' }}>Waste Analytics</h3>
            <p style={{ color: 'var(--text-secondary)', marginBottom: '20px' }}>
              Detailed waste discharge and retention analytics
            </p>
            <div className="btn btn-secondary" style={{ opacity: 0.6 }}>Coming Soon</div>
          </div>

          <div className="card" style={{ textAlign: 'center', padding: '40px 24px' }}>
            <div style={{ fontSize: '48px', marginBottom: '16px' }}>🚢</div>
            <h3 style={{ marginBottom: '12px' }}>Ship Reports</h3>
            <p style={{ color: 'var(--text-secondary)', marginBottom: '20px' }}>
              Vessel-specific waste management reports
            </p>
            <div className="btn btn-secondary" style={{ opacity: 0.6 }}>Coming Soon</div>
          </div>

          <div className="card" style={{ textAlign: 'center', padding: '40px 24px' }}>
            <div style={{ fontSize: '48px', marginBottom: '16px' }}>📈</div>
            <h3 style={{ marginBottom: '12px' }}>Compliance Dashboard</h3>
            <p style={{ color: 'var(--text-secondary)', marginBottom: '20px' }}>
              MARPOL compliance monitoring and alerts
            </p>
            <div className="btn btn-secondary" style={{ opacity: 0.6 }}>Coming Soon</div>
          </div>
        </div>

        <div className="warning-message">
          <strong>Note:</strong> Analytics and reporting features are currently under development. 
          Full functionality will be available in the next release.
        </div>
      </div>
    </div>
  );
};

export default Reports;
