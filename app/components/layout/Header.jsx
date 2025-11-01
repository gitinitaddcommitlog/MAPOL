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
      padding: '0.75rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'sticky',
      top: 0,
      zIndex: 1000
    }}>
      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 1rem'
      }}>
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          gap: '1rem'
        }}>
          {/* Logo and Brand - Fixed with proper spacing */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '0.75rem',
            flexShrink: 0,
            minWidth: 0,
            flex: 1
          }}>
            <div style={{
              width: '50px',
              height: '50px',
              flexShrink: 0,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <Logo3D />
            </div>
            <div style={{ 
              minWidth: 0,
              flex: 1,
              overflow: 'hidden'
            }}>
              <h1 style={{
                margin: 0,
                fontSize: '1.25rem',
                fontWeight: '700',
                color: 'white',
                lineHeight: '1.2',
                whiteSpace: 'nowrap',
                overflow: 'hidden',
                textOverflow: 'ellipsis'
              }}>
                ENA Waste Management
              </h1>
              <p style={{
                margin: 0,
                fontSize: '0.75rem',
                color: 'rgba(255, 255, 255, 0.9)',
                whiteSpace: 'nowrap',
                overflow: 'hidden',
                textOverflow: 'ellipsis'
              }}>
                MARPOL Compliance System
              </p>
            </div>
          </div>

          {/* Desktop Navigation - Properly spaced */}
          <nav className="desktop-nav" style={{
            display: 'flex',
            gap: '1.5rem',
            alignItems: 'center',
            flexShrink: 0
          }}>
            {navigationItems.map((item) => (
              <a
                key={item.name}
                href={item.path}
                style={{
                  color: 'white',
                  textDecoration: 'none',
                  fontWeight: '500',
                  padding: '0.5rem 0.75rem',
                  borderRadius: '6px',
                  transition: 'all 0.3s ease',
                  fontSize: '0.9rem',
                  whiteSpace: 'nowrap'
                }}
                onMouseEnter={(e) => {
                  e.target.style.background = 'rgba(255, 255, 255, 0.1)';
                }}
                onMouseLeave={(e) => {
                  e.target.style.background = 'transparent';
                }}
              >
                {item.name}
              </a>
            ))}
          </nav>

          {/* Mobile Menu Button - Only shows on mobile */}
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
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
              <path d="M3 12H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
              <path d="M3 6H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
              <path d="M3 18H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            </svg>
          </button>
        </div>

        {/* Mobile Navigation Menu */}
        <div className={`mobile-menu ${isMobileMenuOpen ? 'open' : ''}`} style={{
          display: 'none',
          marginTop: '0.75rem'
        }}>
          <div style={{
            background: 'rgba(255, 255, 255, 0.1)',
            borderRadius: '8px',
            padding: '0.75rem',
            backdropFilter: 'blur(10px)'
          }}>
            <div style={{
              display: 'flex',
              flexDirection: 'column',
              gap: '0.25rem'
            }}>
              {navigationItems.map((item) => (
                <a
                  key={item.name}
                  href={item.path}
                  style={{
                    color: 'white',
                    textDecoration: 'none',
                    fontWeight: '500',
                    padding: '0.75rem',
                    borderRadius: '6px',
                    transition: 'all 0.3s ease',
                    textAlign: 'center',
                    background: 'transparent',
                    fontSize: '0.9rem'
                  }}
                  onClick={() => setIsMobileMenuOpen(false)}
                  onMouseEnter={(e) => {
                    e.target.style.background = 'rgba(255, 255, 255, 0.2)';
                  }}
                  onMouseLeave={(e) => {
                    e.target.style.background = 'transparent';
                  }}
                >
                  {item.name}
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
