import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { wasteApi } from '../../services/api/wasteApi';

const Dashboard = () => {
  const [stats, setStats] = useState({
    totalSubmissions: 0,
    totalShips: 0,
    recentSubmissions: 0
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadStatistics();
  }, []);

  const loadStatistics = async () => {
    try {
      // In a real app, you would call wasteApi.getStatistics()
      // For now, we'll use mock data
      setTimeout(() => {
        setStats({
          totalSubmissions: 47,
          totalShips: 23,
          recentSubmissions: 12
        });
        setLoading(false);
      }, 1000);
    } catch (error) {
      console.error('Failed to load statistics:', error);
      setLoading(false);
    }
  };

  const StatCard = ({ title, value, subtitle, icon, color }) => (
    <div className="card" style={{
      background: `linear-gradient(135deg, ${color}20, ${color}10)`,
      border: `1px solid ${color}30`
    }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
        <div>
          <h3 style={{ color: 'var(--text-secondary)', fontSize: '14px', fontWeight: 600, marginBottom: '8px' }}>
            {title}
          </h3>
          <div style={{ fontSize: '32px', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '4px' }}>
            {loading ? '...' : value}
          </div>
          <p style={{ color: 'var(--text-tertiary)', fontSize: '14px' }}>
            {subtitle}
          </p>
        </div>
        <div style={{
          width: '48px',
          height: '48px',
          borderRadius: '12px',
          background: `linear-gradient(135deg, ${color}, ${color}dd)`,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          fontSize: '20px'
        }}>
          {icon}
        </div>
      </div>
    </div>
  );

  const QuickAction = ({ title, description, icon, link, color }) => (
    <Link to={link} className="card" style={{
      textDecoration: 'none',
      color: 'inherit',
      display: 'block',
      transition: 'all 0.3s ease',
      border: `2px solid ${color}20`,
      background: `linear-gradient(135deg, ${color}08, ${color}05)`
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
        <div style={{
          width: '56px',
          height: '56px',
          borderRadius: '14px',
          background: `linear-gradient(135deg, ${color}, ${color}dd)`,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          fontSize: '24px',
          flexShrink: 0
        }}>
          {icon}
        </div>
        <div>
          <h3 style={{ color: 'var(--text-primary)', marginBottom: '4px', fontWeight: 600 }}>
            {title}
          </h3>
          <p style={{ color: 'var(--text-secondary)', fontSize: '14px', margin: 0 }}>
            {description}
          </p>
        </div>
      </div>
    </Link>
  );

  return (
    <div className="container">
      {/* Hero Section */}
      <div style={{ marginBottom: '48px' }}>
        <div className="card-elevated" style={{
          background: 'var(--gradient-primary)',
          color: 'white',
          textAlign: 'center',
          padding: '60px 40px'
        }}>
          <h1 style={{ 
            fontSize: '3rem', 
            fontWeight: 700, 
            marginBottom: '16px',
            background: 'linear-gradient(135deg, #fff, #a0c8ff)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent'
          }}>
            ENA Waste Management
          </h1>
          <p style={{ 
            fontSize: '1.25rem', 
            opacity: 0.9, 
            marginBottom: '32px',
            maxWidth: '600px',
            margin: '0 auto 32px'
          }}>
            Advanced MARPOL Compliance System for Sustainable Maritime Operations
          </p>
          <div style={{ display: 'flex', gap: '16px', justifyContent: 'center', flexWrap: 'wrap' }}>
            <Link to="/form" className="btn" style={{
              background: 'rgba(255, 255, 255, 0.2)',
              color: 'white',
              border: '2px solid rgba(255, 255, 255, 0.3)',
              backdropFilter: 'blur(10px)'
            }}>
              🚀 Start New Waste Form
            </Link>
            <Link to="/reports" className="btn" style={{
              background: 'transparent',
              color: 'white',
              border: '2px solid rgba(255, 255, 255, 0.3)'
            }}>
              📈 View Analytics
            </Link>
          </div>
        </div>
      </div>

      {/* Statistics Grid */}
      <div style={{ marginBottom: '48px' }}>
        <h2 style={{ 
          color: 'var(--text-primary)', 
          marginBottom: '24px',
          fontSize: '1.75rem',
          fontWeight: 700
        }}>
          System Overview
        </h2>
        <div style={{ 
          display: 'grid', 
          gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', 
          gap: '24px',
          marginBottom: '40px'
        }}>
          <StatCard
            title="Total Submissions"
            value={stats.totalSubmissions}
            subtitle="MARPOL forms processed"
            icon="📊"
            color="#00a8cc"
          />
          <StatCard
            title="Registered Ships"
            value={stats.totalShips}
            subtitle="Active vessels"
            icon="🚢"
            color="#10b981"
          />
          <StatCard
            title="Recent Activity"
            value={stats.recentSubmissions}
            subtitle="Last 7 days"
            icon="🔄"
            color="#f59e0b"
          />
        </div>
      </div>

      {/* Quick Actions */}
      <div>
        <h2 style={{ 
          color: 'var(--text-primary)', 
          marginBottom: '24px',
          fontSize: '1.75rem',
          fontWeight: 700
        }}>
          Quick Actions
        </h2>
        <div style={{ 
          display: 'grid', 
          gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))', 
          gap: '24px' 
        }}>
          <QuickAction
            title="New Waste Form"
            description="Submit a new MARPOL waste collection form"
            icon="📝"
            link="/form"
            color="#00a8cc"
          />
          <QuickAction
            title="View Reports"
            description="Access analytics and compliance reports"
            icon="📈"
            link="/reports"
            color="#10b981"
          />
          <QuickAction
            title="Ship Registry"
            description="Manage registered vessels"
            icon="🚢"
            link="/ships"
            color="#f59e0b"
          />
        </div>
      </div>

      {/* Recent Activity Section */}
      <div style={{ marginTop: '48px' }}>
        <div className="card">
          <h3 style={{ color: 'var(--text-primary)', marginBottom: '20px' }}>Recent Activity</h3>
          <div style={{ color: 'var(--text-secondary)', textAlign: 'center', padding: '40px' }}>
            <div style={{ fontSize: '48px', marginBottom: '16px' }}>📊</div>
            <p>Activity feed and recent submissions will appear here</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
