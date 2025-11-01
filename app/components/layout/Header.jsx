import React, { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  const location = useLocation();
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 768);

  // Update mobile state on resize
  useEffect(() => {
    const handleResize = () => {
      const mobile = window.innerWidth <= 768;
      setIsMobile(mobile);
      if (!mobile) {
        setIsMobileMenuOpen(false);
      }
    };

    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  // Close mobile menu when route changes
  useEffect(() => {
    setIsMobileMenuOpen(false);
  }, [location]);

  // Prevent body scroll when mobile menu is open
  useEffect(() => {
    if (isMobileMenuOpen) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = 'unset';
    }
    return () => {
      document.body.style.overflow = 'unset';
    };
  }, [isMobileMenuOpen]);

  const toggleMobileMenu = () => {
    setIsMobileMenuOpen(!isMobileMenuOpen);
  };

  const closeMobileMenu = () => {
    setIsMobileMenuOpen(false);
  };

  const isActive = (path) => {
    if (path === '/') {
      return location.hash === '#/' || location.hash === '';
    }
    return location.hash === `#${path}`;
  };

  // Navigation links data
  const navLinks = [
    { path: '/', label: 'Dashboard' },
    { path: '/form', label: 'Forms' },
    { path: '/reports', label: 'Reports' }
  ];

  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'relative',
      zIndex: 100
    }}>
      <div className="header-container">
        {/* Logo */}
        <div className="header-logo-container">
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div style={{
          flex: 1,
          minWidth: 0,
          marginLeft: '0.75rem'
        }}>
          <Link 
            to="/" 
            style={{ textDecoration: 'none' }}
            onClick={closeMobileMenu}
          >
            <h1 className="header-title">
              ENA Waste Management
            </h1>
            <p className="header-subtitle">
              MARPOL Compliance System
            </p>
          </Link>
        </div>
        
        {/* Desktop Navigation */}
        <nav className="desktop-nav">
          {navLinks.map(link => (
            <Link
              key={link.path}
              to={link.path}
              className={isActive(link.path) ? 'active' : ''}
              style={{
                color: 'white',
                textDecoration: 'none',
                fontWeight: '500',
                padding: '0.5rem 1rem',
                borderRadius: '6px',
                transition: 'all 0.3s ease',
                background: isActive(link.path) ? 'rgba(255, 255, 255, 0.2)' : 'transparent'
              }}
              onMouseEnter={(e) => {
                if (!isActive(link.path)) {
                  e.target.style.background = 'rgba(255, 255, 255, 0.1)';
                }
              }}
              onMouseLeave={(e) => {
                if (!isActive(link.path)) {
                  e.target.style.background = 'transparent';
                }
              }}
            >
              {link.label}
            </Link>
          ))}
        </nav>

        {/* Mobile Navigation Toggle */}
        <button 
          className="mobile-nav-toggle"
          onClick={toggleMobileMenu}
          aria-label="Toggle mobile menu"
        >
          {isMobileMenuOpen ? '✕' : '☰'}
        </button>

        {/* Mobile Navigation Menu */}
        <nav className={`mobile-nav ${isMobileMenuOpen ? 'open' : ''}`}>
          <button 
            className="mobile-nav-close"
            onClick={closeMobileMenu}
            aria-label="Close mobile menu"
          >
            ✕
          </button>
          
          {navLinks.map(link => (
            <Link
              key={link.path}
              to={link.path}
              className={isActive(link.path) ? 'active' : ''}
              onClick={closeMobileMenu}
              style={{
                color: 'white',
                textDecoration: 'none',
                fontSize: '1.5rem',
                fontWeight: '600',
                padding: '1rem 2rem',
                borderRadius: '12px',
                transition: 'all 0.3s ease',
                textAlign: 'center',
                width: '80%',
                maxWidth: '300px',
                background: isActive(link.path) ? 'rgba(255, 255, 255, 0.2)' : 'transparent'
              }}
              onMouseEnter={(e) => {
                if (!isActive(link.path)) {
                  e.target.style.background = 'rgba(255, 255, 255, 0.1)';
                }
              }}
              onMouseLeave={(e) => {
                if (!isActive(link.path)) {
                  e.target.style.background = 'transparent';
                }
              }}
            >
              {link.label}
            </Link>
          ))}
        </nav>
      </div>
    </header>
  );
};

export default Header;
