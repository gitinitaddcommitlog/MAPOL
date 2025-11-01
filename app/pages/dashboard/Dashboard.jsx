import React from 'react';

const Dashboard = () => {
  const stats = [
    { label: 'Total Reports', value: '24', change: '+12%' },
    { label: 'Pending Forms', value: '8', change: '-3%' },
    { label: 'Completed', value: '16', change: '+5%' },
    { label: 'Compliance Rate', value: '92%', change: '+2%' }
  ];

  const quickActions = [
    { label: 'New Waste Form', icon: '📝', link: '/form' },
    { label: 'View Reports', icon: '📊', link: '/reports' },
    { label: 'Compliance Check', icon: '✅', link: '#' },
    { label: 'Export Data', icon: '📤', link: '#' }
  ];

  return (
    <div style={{ 
      minHeight: 'calc(100vh - 200px)',
      padding: 'var(--mobile-padding)'
    }}>
      <div className="container">
        {/* Welcome Section */}
        <section style={{ 
          marginBottom: '3rem',
          textAlign: 'center'
        }}>
          <h1 className="responsive-heading" style={{
            background: 'var(--gradient-primary)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent',
            backgroundClip: 'text',
            marginBottom: '1rem',
            fontWeight: '700'
          }}>
            MARPOL Compliance Dashboard
          </h1>
          <p className="responsive-text" style={{
            color: '#64748b',
            maxWidth: '600px',
            margin: '0 auto',
            lineHeight: '1.6'
          }}>
            Monitor waste management compliance, track reports, and ensure environmental protection standards.
          </p>
        </section>

        {/* Stats Grid */}
        <section style={{ marginBottom: '3rem' }}>
          <h2 style={{
            fontSize: 'clamp(1.25rem, 3vw, 1.5rem)',
            marginBottom: '1.5rem',
            color: '#1e293b'
          }}>
            Overview
          </h2>
          <div className="responsive-grid">
            {stats.map((stat, index) => (
              <div
                key={index}
                style={{
                  background: 'white',
                  padding: '1.5rem',
                  borderRadius: '12px',
                  boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
                  border: '1px solid #e2e8f0',
                  textAlign: 'center'
                }}
              >
                <div style={{
                  fontSize: 'clamp(1.5rem, 4vw, 2rem)',
                  fontWeight: '700',
                  color: '#1e293b',
                  marginBottom: '0.5rem'
                }}>
                  {stat.value}
                </div>
                <div style={{
                  color: '#64748b',
                  fontSize: '0.9rem',
                  marginBottom: '0.5rem'
                }}>
                  {stat.label}
                </div>
                <div style={{
                  color: stat.change.startsWith('+') ? '#10b981' : '#ef4444',
                  fontSize: '0.8rem',
                  fontWeight: '600'
                }}>
                  {stat.change}
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Quick Actions */}
        <section>
          <h2 style={{
            fontSize: 'clamp(1.25rem, 3vw, 1.5rem)',
            marginBottom: '1.5rem',
            color: '#1e293b'
          }}>
            Quick Actions
          </h2>
          <div className="responsive-grid">
            {quickActions.map((action, index) => (
              <a
                key={index}
                href={action.link}
                className="touch-button"
                style={{
                  background: 'white',
                  padding: '1.5rem',
                  borderRadius: '12px',
                  boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
                  border: '1px solid #e2e8f0',
                  textDecoration: 'none',
                  color: 'inherit',
                  display: 'flex',
                  flexDirection: 'column',
                  alignItems: 'center',
                  gap: '0.75rem',
                  transition: 'all 0.3s ease'
                }}
                onMouseEnter={(e) => {
                  e.target.style.transform = 'translateY(-4px)';
                  e.target.style.boxShadow = '0 8px 15px -3px rgba(0, 0, 0, 0.1)';
                }}
                onMouseLeave={(e) => {
                  e.target.style.transform = 'translateY(0)';
                  e.target.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)';
                }}
              >
                <span style={{ fontSize: '2rem' }}>{action.icon}</span>
                <span style={{
                  fontWeight: '600',
                  color: '#1e293b',
                  textAlign: 'center',
                  fontSize: 'clamp(0.9rem, 2vw, 1rem)'
                }}>
                  {action.label}
                </span>
              </a>
            ))}
          </div>
        </section>

        {/* Recent Activity - Mobile Optimized */}
        <section style={{ marginTop: '3rem' }}>
          <h2 style={{
            fontSize: 'clamp(1.25rem, 3vw, 1.5rem)',
            marginBottom: '1.5rem',
            color: '#1e293b'
          }}>
            Recent Activity
          </h2>
          <div style={{
            background: 'white',
            borderRadius: '12px',
            padding: '1.5rem',
            boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
            overflowX: 'auto'
          }}>
            <div style={{
              display: 'grid',
              gap: '1rem',
              minWidth: '300px'
            }}>
              {[
                { action: 'Waste Form Submitted', time: '2 hours ago', status: 'Completed' },
                { action: 'Compliance Check', time: '5 hours ago', status: 'Pending' },
                { action: 'Report Generated', time: '1 day ago', status: 'Completed' }
              ].map((activity, index) => (
                <div
                  key={index}
                  style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                    padding: '1rem',
                    background: '#f8fafc',
                    borderRadius: '8px',
                    flexWrap: 'wrap',
                    gap: '0.5rem'
                  }}
                >
                  <div style={{ flex: '1 1 200px' }}>
                    <div style={{ fontWeight: '600', color: '#1e293b' }}>
                      {activity.action}
                    </div>
                    <div style={{ fontSize: '0.875rem', color: '#64748b' }}>
                      {activity.time}
                    </div>
                  </div>
                  <div style={{
                    padding: '0.25rem 0.75rem',
                    borderRadius: '20px',
                    fontSize: '0.75rem',
                    fontWeight: '600',
                    background: activity.status === 'Completed' ? '#dcfce7' : '#fef3c7',
                    color: activity.status === 'Completed' ? '#166534' : '#92400e'
                  }}>
                    {activity.status}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>
      </div>
    </div>
  );
};

export default Dashboard;
