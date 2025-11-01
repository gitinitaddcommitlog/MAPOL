import React from 'react';

export const StatsGrid = () => {
  const stats = [
    { label: 'Total Forms Today', value: '12', color: '#10b981' },
    { label: 'Pending Approvals', value: '3', color: '#f59e0b' },
    { label: 'Completed Reports', value: '45', color: '#3b82f6' },
    { label: 'Vessels Served', value: '8', color: '#8b5cf6' }
  ];

  return (
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
  );
};

export const RecentActivity = () => {
  const activities = [
    { vessel: 'MV Atlantic Star', action: 'Waste Form Submitted', time: '2 hours ago', status: 'completed' },
    { vessel: 'MV Ocean Queen', action: 'Oil Waste Declaration', time: '4 hours ago', status: 'pending' },
    { vessel: 'MV Sea Explorer', action: 'Plastic Waste Form', time: '1 day ago', status: 'completed' }
  ];

  return (
    <div>
      <h3>Recent Activity</h3>
      <div>
        {activities.map((activity, index) => (
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
  );
};

export const QuickActions = () => {
  return (
    <div>
      <h3>Quick Actions</h3>
      <div className="quick-actions">
        <button className="btn-primary" style={{ justifyContent: 'center' }}>
          📝 Create New Waste Form
        </button>
        <button className="btn-secondary">
          📊 Generate Report
        </button>
        <button className="btn-accent">
          ⚙️ System Settings
        </button>
      </div>
    </div>
  );
};
