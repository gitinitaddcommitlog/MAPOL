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
      zIndex: 1000,
      backdropFilter: 'blur(10px)'
    }}>
      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        gap: '1rem'
      }}>
        {/* Logo and Brand - Beautifully spaced */}
        <div style={{
          display: 'flex',
          alignItems: 'center',
          gap: '0.75rem',
          flex: 1,
          minWidth: 0
        }}>
          <div className="logo-container" style={{
            width: '60px',
            height: '60px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            flexShrink: 0
          }}>
            <Logo3D />
          </div>
          
          <div style={{ minWidth: 0, flex: 1 }}>
            <h1 style={{
              margin: 0,
              fontSize: '1.75rem',
              fontWeight: '700',
              color: 'white',
              lineHeight: '1.1',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis'
            }}>
              ENA Waste Management
            </h1>
            <p style={{
              margin: '2px 0 0 0',
              fontSize: '0.9rem',
              color: 'rgba(255, 255, 255, 0.9)',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis'
            }}>
              MARPOL Compliance System
            </p>
          </div>
        </div>
        
        {/* Desktop Navigation - Elegant spacing */}
        <nav className="desktop-nav" style={{
          display: 'flex',
          gap: '1.5rem',
          alignItems: 'center',
          marginLeft: 'auto'
        }}>
          {navigationItems.map((item) => (
            <a
              key={item.name}
              href={item.path}
              className="touch-target"
              style={{
                color: 'white',
                textDecoration: 'none',
                fontWeight: '600',
                padding: '0.6rem 1.2rem',
                borderRadius: '8px',
                transition: 'all 0.3s ease',
                whiteSpace: 'nowrap',
                background: 'transparent',
                border: '1px solid transparent'
              }}
              onMouseEnter={(e) => {
                e.target.style.background = 'rgba(255, 255, 255, 0.15)';
                e.target.style.borderColor = 'rgba(255, 255, 255, 0.3)';
                e.target.style.transform = 'translateY(-2px)';
              }}
              onMouseLeave={(e) => {
                e.target.style.background = 'transparent';
                e.target.style.borderColor = 'transparent';
                e.target.style.transform = 'translateY(0)';
              }}
            >
              {item.name}
            </a>
          ))}
        </nav>

        {/* Mobile Menu Button - Beautiful design */}
        <button
          className="mobile-nav-button"
          onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
          aria-label="Toggle menu"
        >
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
            <path d="M3 12H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            <path d="M3 6H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            <path d="M3 18H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
          </svg>
        </button>
      </div>

      {/* Mobile Navigation Menu - Beautiful dropdown */}
      <div className={`mobile-menu ${isMobileMenuOpen ? 'open' : ''}`} style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem'
      }}>
        <div style={{
          background: 'rgba(255, 255, 255, 0.1)',
          borderRadius: '12px',
          padding: '0.75rem',
          backdropFilter: 'blur(15px)',
          marginTop: '0.5rem',
          border: '1px solid rgba(255, 255, 255, 0.2)'
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
                className="mobile-menu-item touch-target"
                onClick={() => setIsMobileMenuOpen(false)}
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
