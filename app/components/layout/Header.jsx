import React, { useState } from 'react';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'sticky',
      top: 0,
      zIndex: 1000
    }}>
      <div className="container">
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          flexWrap: 'wrap',
          gap: '1rem'
        }}>
          {/* Logo and Brand */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '1rem',
            flex: '1 1 auto'
          }}>
            <div style={{
              width: '60px',
              height: '60px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <Logo3D />
            </div>
            <div>
              <h1 style={{
                margin: 0,
                fontSize: 'clamp(1.25rem, 4vw, 1.75rem)',
                fontWeight: '700',
                color: 'white',
                lineHeight: '1.2'
              }}>
                ENA Waste Management
              </h1>
              <p style={{
                margin: 0,
                fontSize: 'clamp(0.75rem, 2vw, 0.9rem)',
                color: 'rgba(255, 255, 255, 0.8)',
                opacity: 0.9
              }}>
                MARPOL Compliance System
              </p>
            </div>
          </div>

          {/* Desktop Navigation */}
          <nav className="desktop-only" style={{
            display: 'flex',
            gap: '2rem',
            alignItems: 'center'
          }}>
            {['Dashboard', 'Forms', 'Reports'].map((item) => (
              <a
                key={item}
                href={item === 'Dashboard' ? '/' : `/${item.toLowerCase()}`}
                style={{
                  color: 'white',
                  textDecoration: 'none',
                  fontWeight: '500',
                  padding: '0.5rem 1rem',
                  borderRadius: '8px',
                  transition: 'all 0.3s ease',
                  fontSize: 'clamp(0.9rem, 2vw, 1rem)'
                }}
                onMouseEnter={(e) => {
                  e.target.style.background = 'rgba(255, 255, 255, 0.1)';
                  e.target.style.transform = 'translateY(-2px)';
                }}
                onMouseLeave={(e) => {
                  e.target.style.background = 'transparent';
                  e.target.style.transform = 'translateY(0)';
                }}
              >
                {item}
              </a>
            ))}
          </nav>

          {/* Mobile Menu Button */}
          <button
            className="mobile-only touch-button"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            style={{
              background: 'rgba(255, 255, 255, 0.1)',
              border: 'none',
              borderRadius: '8px',
              color: 'white',
              padding: '0.75rem',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}
            aria-label="Toggle menu"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
              <path d="M3 12H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
              <path d="M3 6H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
              <path d="M3 18H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            </svg>
          </button>
        </div>

        {/* Mobile Navigation Menu */}
        {isMenuOpen && (
          <nav className="mobile-only" style={{
            marginTop: '1rem',
            padding: '1rem',
            background: 'rgba(255, 255, 255, 0.1)',
            borderRadius: '12px',
            backdropFilter: 'blur(10px)'
          }}>
            <div style={{
              display: 'flex',
              flexDirection: 'column',
              gap: '0.5rem'
            }}>
              {['Dashboard', 'Forms', 'Reports'].map((item) => (
                <a
                  key={item}
                  href={item === 'Dashboard' ? '/' : `/${item.toLowerCase()}`}
                  style={{
                    color: 'white',
                    textDecoration: 'none',
                    fontWeight: '500',
                    padding: '1rem',
                    borderRadius: '8px',
                    transition: 'all 0.3s ease',
                    textAlign: 'center',
                    fontSize: '1.1rem'
                  }}
                  onClick={() => setIsMenuOpen(false)}
                  onMouseEnter={(e) => {
                    e.target.style.background = 'rgba(255, 255, 255, 0.2)';
                  }}
                  onMouseLeave={(e) => {
                    e.target.style.background = 'transparent';
                  }}
                >
                  {item}
                </a>
              ))}
            </div>
          </nav>
        )}
      </div>
    </header>
  );
};

export default Header;
