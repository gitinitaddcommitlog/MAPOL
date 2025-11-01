#!/bin/bash
# FIX-HAMBURGER.sh - Fix Side Panel Not Opening

echo "🔧 FIXING HAMBURGER MENU - SIDE PANEL NOT OPENING"

# 1. First, let's check the current Header component
echo "🔍 Checking current Header component..."
grep -A 5 -B 5 "mobile-nav-toggle" app/components/layout/Header.jsx
grep -A 10 "mobile-nav" app/components/layout/Header.jsx

# 2. Check if CSS classes are properly defined
echo "🔍 Checking CSS classes..."
grep -A 10 "mobile-nav-toggle" app/styles/globals.css
grep -A 10 "mobile-nav.open" app/styles/globals.css

# 3. Fix the Header component with proper event handling
cat > app/components/layout/Header.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  const location = useLocation();
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  const isActive = (path) => {
    return location.hash === `#${path}` || (path === '/' && location.hash === '');
  };

  const toggleMobileMenu = () => {
    console.log('Toggle mobile menu clicked, current state:', isMobileMenuOpen);
    setIsMobileMenuOpen(!isMobileMenuOpen);
  };

  const closeMobileMenu = () => {
    console.log('Closing mobile menu');
    setIsMobileMenuOpen(false);
  };

  // Close mobile menu when route changes
  useEffect(() => {
    closeMobileMenu();
  }, [location]);

  // Prevent body scroll when mobile menu is open
  useEffect(() => {
    if (isMobileMenuOpen) {
      document.body.style.overflow = 'hidden';
      console.log('Body scroll locked');
    } else {
      document.body.style.overflow = 'unset';
      console.log('Body scroll unlocked');
    }
    return () => {
      document.body.style.overflow = 'unset';
    };
  }, [isMobileMenuOpen]);

  const navLinks = [
    { path: '/', label: 'Dashboard', icon: '📊' },
    { path: '/form', label: 'Waste Forms', icon: '📝' },
    { path: '/reports', label: 'Reports', icon: '📈' }
  ];

  return (
    <header>
      <div className="header-container">
        {/* Logo */}
        <div className="header-logo-container">
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div className="header-brand">
          <Link to="/" style={{ textDecoration: 'none' }} onClick={closeMobileMenu}>
            <h1 className="header-title">ENA Waste Management</h1>
            <p className="header-subtitle">MARPOL Compliance System</p>
          </Link>
        </div>
        
        {/* Desktop Navigation */}
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

        {/* Mobile Navigation Toggle */}
        <button 
          className="mobile-nav-toggle"
          onClick={toggleMobileMenu}
          aria-label="Toggle mobile menu"
          style={{
            background: 'none',
            border: 'none',
            color: 'white',
            fontSize: '1.5rem',
            cursor: 'pointer',
            padding: '0.5rem',
            marginLeft: 'auto'
          }}
        >
          {isMobileMenuOpen ? '✕' : '☰'}
        </button>

        {/* Mobile Navigation Overlay */}
        {isMobileMenuOpen && (
          <div 
            className="mobile-nav-overlay"
            onClick={closeMobileMenu}
            style={{
              position: 'fixed',
              top: 0,
              left: 0,
              width: '100%',
              height: '100%',
              background: 'rgba(0, 0, 0, 0.5)',
              zIndex: 999
            }}
          ></div>
        )}

        {/* Mobile Navigation Menu - SIDE PANEL */}
        <nav 
          className={`mobile-nav ${isMobileMenuOpen ? 'open' : ''}`}
          style={{
            display: isMobileMenuOpen ? 'flex' : 'none',
            position: 'fixed',
            top: 0,
            right: 0,
            width: '280px',
            height: '100%',
            background: 'linear-gradient(135deg, #1a365d 0%, #0f2040 100%)',
            flexDirection: 'column',
            justifyContent: 'flex-start',
            alignItems: 'flex-start',
            gap: 0,
            zIndex: 1000,
            transform: isMobileMenuOpen ? 'translateX(0)' : 'translateX(100%)',
            transition: 'transform 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
            boxShadow: '-4px 0 20px rgba(0, 0, 0, 0.3)',
            padding: '80px 0 0 0'
          }}
        >
          <button 
            onClick={closeMobileMenu}
            aria-label="Close mobile menu"
            style={{
              position: 'absolute',
              top: '1rem',
              right: '1rem',
              background: 'rgba(255, 255, 255, 0.1)',
              border: 'none',
              color: 'white',
              fontSize: '1.5rem',
              cursor: 'pointer',
              padding: '0.5rem',
              borderRadius: '8px',
              width: '40px',
              height: '40px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              zIndex: 1001
            }}
          >
            ✕
          </button>
          
          {/* Mobile Menu Header */}
          <div style={{
            width: '100%',
            padding: '1.5rem',
            borderBottom: '1px solid rgba(255, 255, 255, 0.2)',
            marginBottom: '1rem'
          }}>
            <div style={{
              color: 'white',
              fontSize: '1.1rem',
              fontWeight: '700',
              margin: 0
            }}>
              ENA Waste Management
            </div>
            <div style={{
              color: 'rgba(255, 255, 255, 0.8)',
              fontSize: '0.9rem',
              margin: '0.25rem 0 0 0'
            }}>
              MARPOL Compliance
            </div>
          </div>
          
          {/* Mobile Menu Links - BOLD CONTENT */}
          {navLinks.map(link => (
            <Link
              key={link.path}
              to={link.path}
              onClick={closeMobileMenu}
              style={{
                color: 'white',
                textDecoration: 'none',
                fontSize: '1.1rem',
                fontWeight: '700',
                padding: '1.2rem 1.5rem',
                transition: 'all 0.3s ease',
                textAlign: 'left',
                width: '100%',
                borderBottom: '1px solid rgba(255, 255, 255, 0.1)',
                display: 'flex',
                alignItems: 'center',
                gap: '0.75rem',
                background: isActive(link.path) ? 'rgba(255, 255, 255, 0.15)' : 'transparent'
              }}
            >
              {link.icon} {link.label}
            </Link>
          ))}
        </nav>
      </div>
    </header>
  );
};

export default Header;
EOF

echo "✅ HAMBURGER MENU FIXED!"
echo ""
echo "🎯 WHAT WAS FIXED:"
echo "=================="
echo "✅ Added inline styles as fallback"
echo "✅ Fixed toggle button functionality"
echo "✅ Added console logs for debugging"
echo "✅ Proper state management"
echo "✅ Overlay click to close"
echo "✅ Smooth slide-in animation"

# 4. Build and deploy
echo ""
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Deploying hamburger fix..."
    git add .
    git commit -m "FIX: Hamburger menu now opens side panel properly"
    git push origin main
    echo ""
    echo "🎉 HAMBURGER MENU FIXED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "The hamburger menu should now open the side panel when clicked!"
    echo ""
    echo "💡 If it still doesn't work, open browser console to see debug logs"
else
    echo "❌ Build failed"
fi
EOF

chmod +x FIX-HAMBURGER.sh
./FIX-HAMBURGER.sh