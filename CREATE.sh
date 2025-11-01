#!/bin/bash
# RESTORE-SIDE-PANEL.sh - Restore Hamburger Side Panel

echo "🔧 RESTORING SIDE PANEL HAMBURGER MENU"

# 1. Update the CSS to restore the side panel
cat >> app/styles/globals.css << 'EOF'

/* ===== SIDE PANEL HAMBURGER MENU ===== */
.mobile-nav {
  display: none;
  position: fixed;
  top: 0;
  right: 0;
  width: 280px;
  height: 100%;
  background: var(--gradient-primary);
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  gap: 0;
  z-index: 1000;
  transform: translateX(100%);
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: -4px 0 20px rgba(0, 0, 0, 0.3);
  padding: 80px 0 0 0;
}

.mobile-nav.open {
  transform: translateX(0);
}

/* Mobile menu header */
.mobile-nav-header {
  width: 100%;
  padding: 1.5rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  margin-bottom: 1rem;
}

.mobile-nav-title {
  color: white;
  font-size: 1.1rem;
  font-weight: 700;
  margin: 0;
}

.mobile-nav-subtitle {
  color: rgba(255, 255, 255, 0.8);
  font-size: 0.9rem;
  margin: 0.25rem 0 0 0;
}

/* Mobile menu links - BOLD AND PROMINENT */
.mobile-nav a {
  color: white;
  text-decoration: none;
  font-size: 1.1rem;
  font-weight: 700;
  padding: 1.2rem 1.5rem;
  transition: all 0.3s ease;
  text-align: left;
  width: 100%;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.mobile-nav a:last-child {
  border-bottom: none;
}

.mobile-nav a:hover,
.mobile-nav a.active {
  background: rgba(255, 255, 255, 0.15);
  padding-left: 2rem;
}

.mobile-nav a::before {
  content: "▸";
  font-size: 0.9rem;
  opacity: 0.7;
}

.mobile-nav a.active::before {
  content: "▶";
  opacity: 1;
}

/* Mobile close button - top right */
.mobile-nav-close {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: rgba(255, 255, 255, 0.1);
  border: none;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
  padding: 0.5rem;
  border-radius: 8px;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1001;
}

.mobile-nav-close:hover {
  background: rgba(255, 255, 255, 0.2);
}

/* Overlay when mobile menu is open */
.mobile-nav-overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 999;
}

.mobile-nav-overlay.open {
  display: block;
}
EOF

# 2. Update the Header component to use the side panel
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
    setIsMobileMenuOpen(!isMobileMenuOpen);
  };

  const closeMobileMenu = () => {
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
    } else {
      document.body.style.overflow = 'unset';
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
          <Link to="/" style={{ textDecoration: 'none' }}>
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
        >
          ☰
        </button>

        {/* Mobile Navigation Overlay */}
        <div 
          className={`mobile-nav-overlay ${isMobileMenuOpen ? 'open' : ''}`}
          onClick={closeMobileMenu}
        ></div>

        {/* Mobile Navigation Menu - SIDE PANEL */}
        <nav className={`mobile-nav ${isMobileMenuOpen ? 'open' : ''}`}>
          <button 
            className="mobile-nav-close"
            onClick={closeMobileMenu}
            aria-label="Close mobile menu"
          >
            ✕
          </button>
          
          {/* Mobile Menu Header */}
          <div className="mobile-nav-header">
            <div className="mobile-nav-title">ENA Waste Management</div>
            <div className="mobile-nav-subtitle">MARPOL Compliance</div>
          </div>
          
          {/* Mobile Menu Links - BOLD CONTENT */}
          {navLinks.map(link => (
            <Link
              key={link.path}
              to={link.path}
              className={isActive(link.path) ? 'active' : ''}
              onClick={closeMobileMenu}
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

echo "✅ SIDE PANEL HAMBURGER MENU RESTORED!"
echo ""
echo "🎯 FEATURES RESTORED:"
echo "===================="
echo "✅ Side panel slides in from right (280px wide)"
echo "✅ Bold menu items with icons"
echo "✅ Overlay background when open"
echo "✅ Close button in top right"
echo "✅ Body scroll lock when open"
echo "✅ Auto-close on navigation"

# 3. Build and deploy
echo ""
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Deploying side panel fix..."
    git add .
    git commit -m "FIX: Restore side panel hamburger menu"
    git push origin main
    echo ""
    echo "🎉 SIDE PANEL RESTORED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "The hamburger menu should now open as a side panel on mobile!"
else
    echo "❌ Build failed"
fi
EOF

chmod +x RESTORE-SIDE-PANEL.sh
./RESTORE-SIDE-PANEL.sh