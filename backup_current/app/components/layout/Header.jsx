import React, { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  const location = useLocation();
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  const isActive = (path) => {
    return location.hash === `#${path}` || (path === '/' && location.hash === '');
  };

  const toggleMobileMenu = () => setIsMobileMenuOpen(!isMobileMenuOpen);
  const closeMobileMenu = () => setIsMobileMenuOpen(false);

  useEffect(() => {
    closeMobileMenu();
  }, [location]);

  const navLinks = [
    { path: '/', label: 'Dashboard' },
    { path: '/form', label: 'Forms' },
    { path: '/reports', label: 'Reports' }
  ];

  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 2px 10px rgba(0,0,0,0.1)'
    }}>
      <div className="header-container">
        <div className="header-logo-container">
          <Logo3D />
        </div>
        
        <div style={{ flex: 1, marginLeft: '0.5rem' }}>
          <Link to="/" style={{ textDecoration: 'none' }} onClick={closeMobileMenu}>
            <h1 className="header-title">ENA Waste Management</h1>
            <p className="header-subtitle">MARPOL Compliance System</p>
          </Link>
        </div>
        
        <nav className="desktop-nav">
          {navLinks.map(link => (
            <Link
              key={link.path}
              to={link.path}
              className={isActive(link.path) ? 'active' : ''}
            >
              {link.label}
            </Link>
          ))}
        </nav>

        <button className="mobile-nav-toggle" onClick={toggleMobileMenu}>
          ☰
        </button>

        <nav className={`mobile-nav ${isMobileMenuOpen ? 'open' : ''}`}>
          <button className="mobile-nav-close" onClick={closeMobileMenu}>
            ✕
          </button>
          {navLinks.map(link => (
            <Link
              key={link.path}
              to={link.path}
              className={isActive(link.path) ? 'active' : ''}
              onClick={closeMobileMenu}
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
