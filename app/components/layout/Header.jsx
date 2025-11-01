import React from 'react';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'relative',
      overflow: 'hidden'
    }}>
      <div className="header-container" style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem',
        display: 'flex',
        alignItems: 'center',
        gap: '1rem',
        position: 'relative'
      }}>
        {/* Logo - 20% WIDER SQUARE CONTAINER */}
        <div className="header-logo-container" style={{
          width: '120px', // 20% wider: 100px → 120px
          height: '120px', // 20% taller: 100px → 120px
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          flexShrink: 0,
          padding: '0',
          margin: '0',
          overflow: 'visible',
          background: 'transparent'
        }}>
          <Logo3D />
        </div>
        
        {/* Brand - Adjusted for wider logo */}
        <div style={{
          flex: 1,
          minWidth: 0,
          marginLeft: '0.75rem'
        }}>
          <h1 className="header-title" style={{
            margin: 0,
            fontSize: '1.75rem',
            fontWeight: '700',
            color: 'white',
            lineHeight: '1.2',
            whiteSpace: 'nowrap',
            overflow: 'hidden',
            textOverflow: 'ellipsis'
          }}>
            ENA Waste Management
          </h1>
          <p className="header-subtitle" style={{
            margin: '2px 0 0 0',
            fontSize: '0.9rem',
            color: 'rgba(255, 255, 255, 0.9)',
            lineHeight: '1.3',
            whiteSpace: 'nowrap',
            overflow: 'hidden',
            textOverflow: 'ellipsis'
          }}>
            MARPOL Compliance System
          </p>
        </div>
        
        {/* Navigation */}
        <nav className="header-nav" style={{
          display: 'flex',
          gap: '1.5rem',
          alignItems: 'center',
          marginLeft: 'auto',
          flexShrink: 0
        }}>
          <a href="/" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease',
            whiteSpace: 'nowrap'
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
            transition: 'all 0.3s ease',
            whiteSpace: 'nowrap'
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
            transition: 'all 0.3s ease',
            whiteSpace: 'nowrap'
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
