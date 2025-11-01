import React from 'react';
import { useNavigate } from 'react-router-dom';

const Dashboard = () => {
  const navigate = useNavigate();

  const stats = [
    { label: 'Total Forms Today', value: '12', color: '#10b981' },
    { label: 'Pending Approvals', value: '3', color: '#f59e0b' },
    { label: 'Completed Reports', value: '45', color: '#3b82f6' },
    { label: 'Vessels Served', value: '8', color: '#8b5cf6' }
  ];

  const recentActivities = [
    { vessel: 'MV Atlantic Star', action: 'Waste Form Submitted', time: '2 hours ago', status: 'completed' },
    { vessel: 'MV Ocean Queen', action: 'Oil Waste Declaration', time: '4 hours ago', status: 'pending' },
    { vessel: 'MV Sea Explorer', action: 'Plastic Waste Form', time: '1 day ago', status: 'completed' }
  ];

  const handleQuickAction = (action) => {
    switch(action) {
      case 'form':
        navigate('/form');
        break;
      case 'reports':
        navigate('/reports');
        break;
      case 'settings':
        alert('Settings feature coming soon!');
        break;
      default:
        break;
    }
  };

  return (
    <div className="container">
      <div style={{ marginBottom: '2rem' }}>
        <h1>Dashboard Overview</h1>
        <p>Welcome to ENA Waste Management MARPOL Compliance System</p>
      </div>

      {/* Stats Grid */}
      <div className="stats-grid">
        {stats.map((stat, index) => (
          <div key={index} className="stat-card" style={{ borderLeftColor: stat.color }}>
            <div className="stat-value" style={{ color: stat.color }}>
              {stat.value}
            </div>
            <div className="stat-label">{stat.label}</div>
          </div>
        ))}
      </div>

      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fit, minmax(400px, 1fr))',
        gap: '2rem'
      }}>
        {/* Quick Actions - NOW FUNCTIONAL */}
        <div className="card">
          <h2 style={{ marginBottom: '1.5rem' }}>Quick Actions</h2>
          <div className="quick-actions">
            <button 
              className="btn-primary" 
              style={{ justifyContent: 'center' }}
              onClick={() => handleQuickAction('form')}
            >
              📝 Create New Waste Form
            </button>
            <button 
              className="btn-secondary"
              onClick={() => handleQuickAction('reports')}
            >
              📊 Generate Report
            </button>
            <button 
              className="btn-accent"
              onClick={() => handleQuickAction('settings')}
            >
              ⚙️ System Settings
            </button>
          </div>
        </div>

        {/* Recent Activity */}
        <div className="card">
          <h2 style={{ marginBottom: '1.5rem' }}>Recent Activity</h2>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
            {recentActivities.map((activity, index) => (
              <div key={index} className="activity-item">
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start' }}>
                  <div>
                    <strong>{activity.vessel}</strong>
                    <p style={{ margin: '0.25rem 0', color: '#64748b' }}>{activity.action}</p>
                    <small style={{ color: '#94a3b8' }}>{activity.time}</small>
                  </div>
                  <span className={`status-badge status-${activity.status}`}>
                    {activity.status}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
