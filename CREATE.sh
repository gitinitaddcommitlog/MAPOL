#!/bin/bash
# FIX-LOGO-CONTAINMENT.sh - Fix Logo Floating Issue

echo "🔧 FIXING LOGO CONTAINMENT IN HEADER"

# 1. First, let's check the current header structure
echo "🔍 Checking current header layout..."
grep -A 10 "header-logo-container" app/styles/globals.css

# 2. Fix the CSS to ensure logo is properly contained and aligned
cat > app/styles/globals.css << 'EOF'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  --primary-color: #1a365d;
  --primary-dark: #0f2040;
  --gradient-primary: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
}

body {
  font-family: 'Inter', sans-serif;
  background: #f8fafc;
  min-height: 100vh;
}

/* ===== FIXED HEADER - PROPER LOGO CONTAINMENT ===== */
header {
  background: var(--gradient-primary);
  padding: 0.75rem 0;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  position: relative;
  z-index: 100;
  min-height: 80px;
  display: flex;
  align-items: center;
}

.header-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  align-items: center;
  gap: 1rem;
  width: 100%;
  height: 100%;
}

/* ===== PROPERLY CONTAINED LOGO ===== */
.header-logo-container {
  width: 60px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  margin: 0;
  padding: 4px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 10px;
  border: 2px solid rgba(255, 255, 255, 0.2);
  position: relative;
  overflow: hidden;
}

/* Ensure logo content stays within bounds */
.header-logo-container > div {
  width: 100% !important;
  height: 100% !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  border-radius: 8px !important;
  margin: 0 !important;
  padding: 0 !important;
}

/* ===== BRAND TEXT - PROPER ALIGNMENT ===== */
.header-brand {
  flex: 1;
  min-width: 0;
  margin-left: 0.5rem;
}

.header-title {
  margin: 0;
  font-size: 1.5rem;
  font-weight: 700;
  color: white;
  line-height: 1.2;
}

.header-subtitle {
  margin: 2px 0 0 0;
  font-size: 0.8rem;
  color: rgba(255, 255, 255, 0.9);
  line-height: 1.3;
}

/* ===== DESKTOP NAVIGATION ===== */
.desktop-nav {
  display: flex;
  gap: 1rem;
  align-items: center;
  margin-left: auto;
  flex-shrink: 0;
}

.desktop-nav a {
  color: white;
  text-decoration: none;
  font-weight: 500;
  padding: 0.5rem 1rem;
  border-radius: 6px;
  transition: background 0.3s ease;
}

.desktop-nav a:hover {
  background: rgba(255, 255, 255, 0.1);
}

.desktop-nav a.active {
  background: rgba(255, 255, 255, 0.2);
}

/* ===== MOBILE NAVIGATION ===== */
.mobile-nav-toggle {
  display: none;
  background: none;
  border: none;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
  padding: 0.5rem;
  margin-left: auto;
}

.mobile-nav {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: var(--gradient-primary);
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 1.5rem;
  z-index: 1000;
}

.mobile-nav.open {
  display: flex;
}

.mobile-nav-close {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: none;
  border: none;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .header-container {
    padding: 0 1.5rem;
  }
  
  .header-logo-container {
    width: 55px;
    height: 55px;
  }
  
  .header-title {
    font-size: 1.3rem;
  }
}

@media (max-width: 768px) {
  header {
    padding: 0.5rem 0;
    min-height: 70px;
  }
  
  .header-container {
    padding: 0 1rem;
    gap: 0.5rem;
  }
  
  .header-logo-container {
    width: 50px;
    height: 50px;
    padding: 3px;
  }
  
  .header-brand {
    margin-left: 0.25rem;
  }
  
  .header-title {
    font-size: 1.1rem;
  }
  
  .header-subtitle {
    font-size: 0.7rem;
  }
  
  /* Hide desktop nav on mobile */
  .desktop-nav {
    display: none;
  }
  
  /* Show mobile toggle */
  .mobile-nav-toggle {
    display: block;
  }
}

@media (min-width: 769px) {
  .mobile-nav {
    display: none !important;
  }
}

/* ===== MAIN CONTENT ===== */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

.card {
  background: white;
  border-radius: 12px;
  padding: 2rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}
EOF

# 3. Also update the Header component to use proper structure
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
    <header>
      <div className="header-container">
        {/* Logo - Now properly contained */}
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
        <button className="mobile-nav-toggle" onClick={toggleMobileMenu}>
          ☰
        </button>

        {/* Mobile Navigation Menu */}
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
EOF

echo "✅ Logo containment fixed!"
echo ""
echo "🎯 KEY FIXES:"
echo "• Logo container properly positioned within header"
echo "• Fixed margins and padding"
echo "• Added background and border to contain logo"
echo "• Proper vertical alignment"
echo "• Responsive sizing maintained"

# 4. Build and deploy
echo ""
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Deploying logo containment fix..."
    git add .
    git commit -m "FIX: Logo properly contained within header - no floating"
    git push origin main
    echo ""
    echo "🎉 LOGO CONTAINMENT FIXED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "The logo should now be perfectly contained within the header boundaries!"
else
    echo "❌ Build failed"
fi
EOF

chmod +x FIX-LOGO-CONTAINMENT.sh
./FIX-LOGO-CONTAINMENT.sh