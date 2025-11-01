import React, { useState } from 'react';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  const navigationItems = [
    { name: 'Dashboard', path: '/' },
    { name: 'Forms', path: '/form' },
    { name: 'Reports', path: '/reports' }
  ];

  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'sticky',
      top: 0,
      zIndex: 1000
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
          justifyContent: 'center',
          flexShrink: 0
        }}>
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div style={{ minWidth: 0, flex: 1 }}>
          <h1 style={{
            margin: 0,
            fontSize: '1.75rem',
            fontWeight: '700',
            color: 'white',
            lineHeight: '1.2'
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
        
        {/* Desktop Navigation */}
        <nav className="desktop-nav" style={{
          display: 'flex',
          gap: '2rem',
          alignItems: 'center',
          marginLeft: 'auto'
        }}>
          {navigationItems.map((item) => (
            <a
              key={item.name}
              href={item.path}
              style={{
                color: 'white',
                textDecoration: 'none',
                fontWeight: '500',
                padding: '0.5rem 1rem',
                borderRadius: '6px',
                transition: 'all 0.3s ease',
                whiteSpace: 'nowrap'
              }}
              onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
              onMouseLeave={(e) => e.target.style.background = 'transparent'}
            >
              {item.name}
            </a>
          ))}
        </nav>

        {/* Mobile Menu Button */}
        <button
          className="mobile-nav-button"
          onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
          style={{
            background: 'rgba(255, 255, 255, 0.1)',
            border: 'none',
            borderRadius: '6px',
            color: 'white',
            padding: '0.5rem',
            cursor: 'pointer',
            display: 'none',
            alignItems: 'center',
            justifyContent: 'center',
            width: '40px',
            height: '40px',
            flexShrink: 0
          }}
          aria-label="Toggle menu"
        >
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
            <path d="M3 12H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            <path d="M3 6H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            <path d="M3 18H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
          </svg>
        </button>
      </div>

      {/* Mobile Navigation Menu */}
      <div className={`mobile-menu ${isMobileMenuOpen ? 'open' : ''}`} style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem'
      }}>
        <div style={{
          background: 'rgba(255, 255, 255, 0.1)',
          borderRadius: '8px',
          padding: '1rem',
          backdropFilter: 'blur(10px)',
          marginTop: '0.5rem'
        }}>
          <div style={{
            display: 'flex',
            flexDirection: 'column',
            gap: '0.5rem'
          }}>
            {navigationItems.map((item) => (
              <a
                key={item.name}
                href={item.path}
                className="touch-target"
                style={{
                  color: 'white',
                  textDecoration: 'none',
                  fontWeight: '500',
                  padding: '1rem',
                  borderRadius: '6px',
                  transition: 'all 0.3s ease',
                  textAlign: 'center',
                  background: 'transparent'
                }}
                onClick={() => setIsMobileMenuOpen(false)}
                onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.2)'}
                onMouseLeave={(e) => e.target.style.background = 'transparent'}
              >
                {item.name}
              </a>
            ))}
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
