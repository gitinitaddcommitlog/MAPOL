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
    <div className="dashboard-container" style={{ 
      minHeight: 'calc(100vh - 200px)',
      padding: '2rem 0'
    }}>
      <div className="container">
        {/* Welcome Section */}
        <section style={{ 
          marginBottom: '3rem',
          textAlign: 'center'
        }}>
          <h1 style={{
            background: 'var(--gradient-primary)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent',
            backgroundClip: 'text',
            marginBottom: '1rem',
            fontWeight: '700',
            fontSize: '2.5rem'
          }}>
            MARPOL Compliance Dashboard
          </h1>
          <p style={{
            color: '#64748b',
            maxWidth: '600px',
            margin: '0 auto',
            lineHeight: '1.6',
            fontSize: '1.125rem'
          }}>
            Monitor waste management compliance, track reports, and ensure environmental protection standards.
          </p>
        </section>

        {/* Stats Grid */}
        <section style={{ marginBottom: '3rem' }}>
          <h2 style={{
            fontSize: '1.5rem',
            marginBottom: '1.5rem',
            color: '#1e293b'
          }}>
            Overview
          </h2>
          <div className="stats-grid" style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))',
            gap: '1.5rem'
          }}>
            {stats.map((stat, index) => (
              <div
                key={index}
                className="card"
                style={{
                  textAlign: 'center',
                  padding: '2rem 1.5rem'
                }}
              >
                <div style={{
                  fontSize: '2rem',
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
            fontSize: '1.5rem',
            marginBottom: '1.5rem',
            color: '#1e293b'
          }}>
            Quick Actions
          </h2>
          <div className="actions-grid" style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
            gap: '1.5rem'
          }}>
            {quickActions.map((action, index) => (
              <a
                key={index}
                href={action.link}
                className="card"
                style={{
                  textDecoration: 'none',
                  color: 'inherit',
                  display: 'flex',
                  flexDirection: 'column',
                  alignItems: 'center',
                  gap: '1rem',
                  padding: '2rem 1.5rem',
                  transition: 'all 0.3s ease'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.transform = 'translateY(-4px)';
                  e.currentTarget.style.boxShadow = 'var(--shadow-xl)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.transform = 'translateY(0)';
                  e.currentTarget.style.boxShadow = 'var(--shadow-lg)';
                }}
              >
                <span style={{ fontSize: '2.5rem' }}>{action.icon}</span>
                <span style={{
                  fontWeight: '600',
                  color: '#1e293b',
                  textAlign: 'center',
                  fontSize: '1rem'
                }}>
                  {action.label}
                </span>
              </a>
            ))}
          </div>
        </section>
      </div>
    </div>
  );
};

export default Dashboard;
