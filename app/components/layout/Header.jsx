import React from 'react';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
    }}>
      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem',
        display: 'flex',
        alignItems: 'center',
        gap: '1.5rem'
      }}>
        {/* Logo */}
        <div style={{
          width: '60px',
          height: '60px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}>
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div>
          <h1 style={{
            margin: 0,
            fontSize: '1.75rem',
            fontWeight: '700',
            color: 'white'
          }}>
            ENA Waste Management
          </h1>
          <p style={{
            margin: 0,
            fontSize: '0.9rem',
            color: 'rgba(255, 255, 255, 0.9)'
          }}>
            MARPOL Compliance System
          </p>
        </div>
        
        {/* Simple Navigation */}
        <nav style={{
          display: 'flex',
          gap: '2rem',
          alignItems: 'center',
          marginLeft: 'auto'
        }}>
          <a href="/" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Dashboard
          </a>
          <a href="/form" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Forms
          </a>
          <a href="/reports" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Reports
          </a>
        </nav>
      </div>
    </header>
  );
};

export default Header;
