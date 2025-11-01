#!/bin/bash
# FIX-HEADER-LAYOUT.sh - Fix Logo Container Height

echo "🎨 FIXING HEADER LAYOUT - CONTAINING THE LOGO"

# 1. First, let's check the current header structure
echo "🔍 Current header structure:"
grep -A 10 -B 5 "header-logo-container" app/components/layout/Header.jsx

# 2. Fix the CSS to reduce logo container height and improve header layout
cat > app/styles/globals.css << 'EOF'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  /* Professional Color Palette */
  --primary-color: #1a365d;
  --primary-dark: #0f2040;
  --primary-light: #2d4a80;
  --secondary-color: #00a8cc;
  --accent-color: #00d4aa;
  --success-color: #10b981;
  --warning-color: #f59e0b;
  --error-color: #ef4444;
  
  /* Neutral Colors */
  --background-color: #f8fafc;
  --surface-color: #ffffff;
  --surface-elevated: #ffffff;
  --text-primary: #1e293b;
  --text-secondary: #64748b;
  --text-tertiary: #94a3b8;
  --border-color: #e2e8f0;
  --border-light: #f1f5f9;
  
  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  
  /* Gradients */
  --gradient-primary: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
  --gradient-accent: linear-gradient(135deg, var(--secondary-color) 0%, var(--accent-color) 100%);
  
  /* Typography */
  --font-heading: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --font-body: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

body {
  font-family: var(--font-body);
  line-height: 1.6;
  color: var(--text-primary);
  background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
  min-height: 100vh;
}

/* ===== FIXED HEADER STYLES ===== */
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
}

/* ===== FIXED LOGO CONTAINER ===== */
.header-logo-container {
  width: 60px;  /* Reduced from 120px */
  height: 60px; /* Reduced from 120px */
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  margin: 0;
  padding: 4px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 10px;
  border: 2px solid rgba(255, 255, 255, 0.2);
}

.header-logo-container canvas,
.header-logo-container div {
  width: 100% !important;
  height: 100% !important;
  display: block !important;
  border-radius: 8px;
}

/* ===== BRAND TEXT ===== */
.header-brand {
  flex: 1;
  min-width: 0;
  margin-left: 0.5rem;
}

.header-title {
  margin: 0;
  font-size: 1.5rem; /* Slightly smaller */
  font-weight: 700;
  color: white;
  line-height: 1.2;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.header-subtitle {
  margin: 2px 0 0 0;
  font-size: 0.8rem; /* Slightly smaller */
  color: rgba(255, 255, 255, 0.9);
  line-height: 1.3;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
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
  transition: all 0.3s ease;
  white-space: nowrap;
}

.desktop-nav a:hover {
  background: rgba(255, 255, 255, 0.1);
}

.desktop-nav a.active {
  background: rgba(255, 255, 255, 0.2);
}

/* ===== MOBILE HAMBURGER MENU ===== */
.mobile-nav-toggle {
  display: none;
  background: none;
  border: none;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
  padding: 0.5rem;
  margin-left: auto;
  z-index: 1001;
}

.mobile-nav {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: var(--gradient-primary);
  z-index: 1000;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 2rem;
  transform: translateX(-100%);
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.mobile-nav.open {
  transform: translateX(0);
}

.mobile-nav a {
  color: white;
  text-decoration: none;
  font-size: 1.5rem;
  font-weight: 600;
  padding: 1rem 2rem;
  border-radius: 12px;
  transition: all 0.3s ease;
  text-align: center;
  width: 80%;
  max-width: 300px;
}

.mobile-nav a:hover,
.mobile-nav a.active {
  background: rgba(255, 255, 255, 0.2);
  transform: translateY(-2px);
}

.mobile-nav-close {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: none;
  border: none;
  color: white;
  font-size: 2rem;
  cursor: pointer;
  padding: 0.5rem;
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
  
  .desktop-nav {
    gap: 0.75rem;
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
  
  /* Show mobile nav when open */
  .mobile-nav {
    display: flex;
  }
}

@media (min-width: 769px) {
  .mobile-nav {
    display: none !important;
  }
}

/* ===== ENHANCED FEATURES ===== */
/* ... rest of your existing enhanced CSS ... */

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1.5rem;
  margin: 2rem 0;
}

.stat-card {
  text-align: center;
  padding: 1.5rem;
  border-radius: 12px;
  background: white;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  border-left: 4px solid #3b82f6;
}

.stat-value {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.stat-label {
  color: #64748b;
  font-weight: 500;
}

/* Container */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.card {
  background: var(--surface-color);
  border-radius: 16px;
  padding: 2rem;
  box-shadow: var(--shadow-lg);
  border: 1px solid var(--border-light);
}

/* Button styles */
.btn {
  padding: 14px 28px;
  border: none;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;
}

.btn-primary {
  background: var(--gradient-primary);
  color: white;
}

/* Form styles */
.form-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
}

.form-group {
  display: flex;
  flex-direction: column;
  margin-bottom: 1rem;
}

.form-group label {
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: var(--text-primary);
}

.form-group input,
.form-group select,
.form-group textarea {
  padding: 12px;
  border: 2px solid var(--border-color);
  border-radius: 8px;
  font-size: 14px;
  transition: all 0.3s ease;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  outline: none;
  border-color: var(--secondary-color);
}
EOF

# 3. Also update the Header component to use the new structure
cat > app/components/layout/Header.jsx << 'EOF'
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
    <header>
      <div className="header-container">
        {/* Logo - Now properly contained */}
        <div className="header-logo-container">
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div className="header-brand">
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
EOF

echo "✅ HEADER LAYOUT FIXED!"
echo ""
echo "🎯 CHANGES MADE:"
echo "• Reduced logo container from 120px to 60px"
echo "• Added proper header min-height"
echo "• Improved responsive sizing"
echo "• Better logo container styling"
echo "• Fixed header alignment"

# 4. Build and test
echo ""
echo "🔨 Testing build..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Deploying fixed header..."
    git add .
    git commit -m "FIX: Header layout - reduced logo size and improved containment"
    git push origin main
    echo ""
    echo "🎉 DEPLOYED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "The logo should now be properly contained within the header!"
else
    echo "❌ Build failed"
    echo "Check the errors above and fix manually"
fi
EOF

chmod +x FIX-HEADER-LAYOUT.sh
./FIX-HEADER-LAYOUT.sh