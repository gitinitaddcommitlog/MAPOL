#!/bin/bash
# CREATE.sh - Fix Navigation for All Devices

echo "🔧 CREATING PROPER RESPONSIVE NAVIGATION"

# 1. Fix CSS with proper responsive design
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

/* HEADER STYLES */
.header-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  align-items: center;
  gap: 1rem;
}

.header-logo-container {
  width: 120px;
  height: 120px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.header-logo-container canvas {
  width: 100% !important;
  height: 100% !important;
  display: block !important;
}

.header-title {
  margin: 0;
  font-size: 1.75rem;
  font-weight: 700;
  color: white;
  line-height: 1.2;
}

.header-subtitle {
  margin: 2px 0 0 0;
  font-size: 0.9rem;
  color: rgba(255, 255, 255, 0.9);
  line-height: 1.3;
}

/* DESKTOP NAVIGATION */
.desktop-nav {
  display: flex;
  gap: 1.5rem;
  align-items: center;
  margin-left: auto;
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

/* MOBILE HAMBURGER MENU */
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
  top: 2rem;
  right: 2rem;
  background: none;
  border: none;
  color: white;
  font-size: 2rem;
  cursor: pointer;
  padding: 0.5rem;
}

/* Enhanced responsive design */
@media (max-width: 1024px) {
  .header-container {
    padding: 0 1.5rem;
  }
  
  .header-logo-container {
    width: 100px;
    height: 100px;
  }
  
  .header-title {
    font-size: 1.5rem;
  }
  
  .desktop-nav {
    gap: 1rem;
  }
}

@media (max-width: 768px) {
  .header-container {
    padding: 0 1rem;
    gap: 0.5rem;
  }
  
  .header-logo-container {
    width: 80px;
    height: 80px;
  }
  
  .header-title {
    font-size: 1.2rem;
  }
  
  .header-subtitle {
    font-size: 0.75rem;
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

# 2. Create a new Header component with proper responsive navigation
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
EOF

# 3. Ensure App.jsx has proper HashRouter setup
cat > app/App.jsx << 'EOF'
import React from 'react';
import { HashRouter as Router, Routes, Route } from 'react-router-dom';
import Header from './components/layout/Header.jsx';
import Dashboard from './pages/dashboard/Dashboard.jsx';
import MainForm from './pages/forms/MainForm.jsx';
import Reports from './pages/reports/Reports.jsx';
import './styles/globals.css';

function App() {
  return (
    <Router>
      <div style={{ 
        minHeight: '100vh', 
        background: 'linear-gradient(135deg, #f8fafc 0%, #f1f5f9 50%, #e2e8f0 100%)',
        backgroundAttachment: 'fixed'
      }}>
        <Header />
        <main style={{ padding: '0', minHeight: 'calc(100vh - 200px)' }}>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/form" element={<MainForm />} />
            <Route path="/reports" element={<Reports />} />
            <Route path="*" element={<Dashboard />} />
          </Routes>
        </main>
        
        <footer style={{
          background: 'var(--gradient-primary)',
          color: 'white',
          padding: '3rem 0 1.5rem',
          marginTop: 'auto',
          borderTop: '1px solid rgba(255, 255, 255, 0.1)'
        }}>
          <div style={{ 
            maxWidth: '1200px', 
            margin: '0 auto', 
            padding: '0 2rem' 
          }}>
            <div className="footer-grid" style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))',
              gap: '3rem',
              marginBottom: '2rem'
            }}>
              <div>
                <h4 style={{ 
                  marginBottom: '1rem', 
                  opacity: 0.9,
                  fontSize: '1.1rem',
                  fontWeight: '600'
                }}>
                  ENA Waste Management Ltd.
                </h4>
                <p style={{ 
                  opacity: 0.7, 
                  lineHeight: 1.6,
                  fontSize: '0.9rem'
                }}>
                  Professional maritime waste management solutions ensuring full MARPOL 73/78 compliance and environmental protection.
                </p>
              </div>
              <div>
                <h4 style={{ 
                  marginBottom: '1rem', 
                  opacity: 0.9,
                  fontSize: '1.1rem',
                  fontWeight: '600'
                }}>
                  Contact Info
                </h4>
                <p style={{ opacity: 0.7, marginBottom: '0.5rem' }}>📍 Tema Kpone Car Park</p>
                <p style={{ opacity: 0.7, marginBottom: '0.5rem' }}>📦 P.O. BOX GP 4369, Accra</p>
                <p style={{ opacity: 0.7 }}>📞 0244316155, 024272684, 0558674185</p>
              </div>
              <div>
                <h4 style={{ 
                  marginBottom: '1rem', 
                  opacity: 0.9,
                  fontSize: '1.1rem',
                  fontWeight: '600'
                }}>
                  Compliance
                </h4>
                <p style={{ 
                  opacity: 0.7, 
                  lineHeight: 1.6,
                  fontSize: '0.9rem'
                }}>
                  Under regulations of MARPOL 73/78 and Ghana Ports and Harbours Authority Declaration
                </p>
              </div>
            </div>
            
            <div style={{
              borderTop: '1px solid rgba(255, 255, 255, 0.1)',
              paddingTop: '1.5rem',
              textAlign: 'center',
              opacity: 0.7
            }}>
              <p style={{ 
                margin: 0,
                fontSize: '0.85rem'
              }}>
                © 2024 ENA Waste Management Ltd. All rights reserved. | MARPOL Compliance System v2.0
              </p>
            </div>
          </div>
        </footer>
      </div>
    </Router>
  );
}

export default App;
EOF

# 4. Build and deploy
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
    
    # Deploy
    echo "📦 Deploying..."
    git add .
    git commit -m "FEAT: Professional responsive navigation with hamburger menu"
    git push origin main
    
    echo ""
    echo "🎉 DEPLOYMENT COMPLETE!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "📱 Responsive Features:"
    echo "   • Desktop: Horizontal navigation bar"
    echo "   • Tablet: Adjusted spacing"
    echo "   • Mobile: Hamburger menu with full-screen overlay"
    echo "   • Smooth animations and proper active states"
    echo "   • Body scroll lock when menu is open"
else
    echo "❌ Build failed"
    exit 1
fi
EOF

# Make executable and run
chmod +x CREATE.sh
./CREATE.sh