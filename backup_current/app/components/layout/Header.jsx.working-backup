import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  const location = useLocation();

  const navItems = [
    { path: '/', label: 'Dashboard', icon: '📊' },
    { path: '/form', label: 'Waste Form', icon: '📝' },
    { path: '/reports', label: 'Reports', icon: '📈' },
  ];

  const isActive = (path) => location.pathname === path;

  return (
    <header style={{
      background: 'var(--gradient-primary)',
      borderBottom: '1px solid rgba(255, 255, 255, 0.1)',
      padding: '16px 0',
      boxShadow: 'var(--shadow-xl)',
      position: 'sticky',
      top: 0,
      zIndex: 1000,
      backdropFilter: 'blur(10px)',
    }}>
      <div className="container">
        <div style={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          flexWrap: 'wrap',
          gap: '24px'
        }}>
          {/* Logo and Company Name */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '16px',
            flexShrink: 0
          }}>
            <Logo3D />
            <div>
              <h1 style={{ 
                color: 'white',
                fontSize: '28px',
                margin: 0,
                fontWeight: 700,
                letterSpacing: '-0.02em'
              }}>
                ENA WASTE MANAGEMENT
              </h1>
              <p style={{
                color: 'rgba(255, 255, 255, 0.8)',
                fontSize: '14px',
                margin: '4px 0 0 0',
                fontWeight: 400
              }}>
                MARPOL Compliance System
              </p>
            </div>
          </div>
          
          {/* Navigation */}
          <nav>
            <ul style={{
              display: 'flex',
              listStyle: 'none',
              gap: '8px',
              margin: 0,
              padding: 0,
              flexWrap: 'wrap'
            }}>
              {navItems.map(item => (
                <li key={item.path}>
                  <Link 
                    to={item.path}
                    style={{
                      color: isActive(item.path) ? 'white' : 'rgba(255, 255, 255, 0.8)',
                      textDecoration: 'none',
                      fontWeight: isActive(item.path) ? '600' : '400',
                      padding: '12px 20px',
                      borderRadius: '12px',
                      background: isActive(item.path) ? 'rgba(255, 255, 255, 0.15)' : 'transparent',
                      border: isActive(item.path) ? '1px solid rgba(255, 255, 255, 0.2)' : '1px solid transparent',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '8px',
                      transition: 'all 0.3s ease',
                      backdropFilter: 'blur(10px)'
                    }}
                    onMouseEnter={(e) => {
                      if (!isActive(item.path)) {
                        e.target.style.background = 'rgba(255, 255, 255, 0.1)';
                        e.target.style.color = 'white';
                      }
                    }}
                    onMouseLeave={(e) => {
                      if (!isActive(item.path)) {
                        e.target.style.background = 'transparent';
                        e.target.style.color = 'rgba(255, 255, 255, 0.8)';
                      }
                    }}
                  >
                    <span style={{ fontSize: '16px' }}>{item.icon}</span>
                    {item.label}
                  </Link>
                </li>
              ))}
            </ul>
          </nav>
        </div>
      </div>
    </header>
  );
};

export default Header;
