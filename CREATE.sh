#!/bin/bash
# fix-responsive-beautiful.sh

echo "🎨 FIXING RESPONSIVE DESIGN BEAUTIFULLY"

# 1. Create a clean, beautiful responsive CSS
echo "🎨 Creating beautiful responsive CSS..."
cat > app/styles/responsive.css << 'EOF'
/* 🎨 BEAUTIFUL RESPONSIVE DESIGN */

/* Mobile First Approach - iPhone 12 Pro Max: 428px and below */
@media (max-width: 428px) {
  /* Header - Compact and beautiful */
  header > div {
    padding: 0 1rem !important;
    gap: 0.75rem !important;
  }
  
  /* Smaller logo for mobile */
  .logo-container {
    width: 45px !important;
    height: 45px !important;
  }
  
  /* Better typography for mobile */
  header h1 {
    font-size: 1.1rem !important;
    line-height: 1.1 !important;
  }
  
  header p {
    font-size: 0.7rem !important;
    margin-top: 2px !important;
  }
  
  /* Hide desktop nav, show mobile button */
  .desktop-nav {
    display: none !important;
  }
  
  .mobile-nav-button {
    display: flex !important;
  }
  
  /* Content spacing */
  main {
    padding: 0 1rem !important;
  }
  
  /* Footer mobile optimization */
  footer > div {
    padding: 0 1rem !important;
  }
  
  .footer-grid {
    grid-template-columns: 1fr !important;
    gap: 2rem !important;
  }
  
  footer {
    padding: 2rem 0 1rem !important;
  }
}

/* Tablets: 429px - 768px */
@media (min-width: 429px) and (max-width: 768px) {
  header > div {
    padding: 0 1.5rem !important;
    gap: 1rem !important;
  }
  
  .logo-container {
    width: 50px !important;
    height: 50px !important;
  }
  
  header h1 {
    font-size: 1.3rem !important;
  }
  
  header p {
    font-size: 0.75rem !important;
  }
  
  .desktop-nav {
    display: none !important;
  }
  
  .mobile-nav-button {
    display: flex !important;
  }
  
  main {
    padding: 0 1.5rem !important;
  }
  
  footer > div {
    padding: 0 1.5rem !important;
  }
  
  .footer-grid {
    grid-template-columns: repeat(2, 1fr) !important;
    gap: 2rem !important;
  }
}

/* Desktop: 769px and above */
@media (min-width: 769px) {
  .mobile-nav-button {
    display: none !important;
  }
  
  .mobile-menu {
    display: none !important;
  }
  
  .desktop-nav {
    display: flex !important;
  }
  
  .logo-container {
    width: 60px !important;
    height: 60px !important;
  }
}

/* Large tablets and small desktop: 769px - 1024px */
@media (min-width: 769px) and (max-width: 1024px) {
  header > div {
    padding: 0 1.5rem !important;
  }
  
  header h1 {
    font-size: 1.4rem !important;
  }
  
  .desktop-nav a {
    font-size: 0.9rem !important;
    padding: 0.4rem 0.8rem !important;
  }
}

/* Large desktop: 1025px and above */
@media (min-width: 1025px) {
  header > div {
    padding: 0 2rem !important;
  }
  
  header h1 {
    font-size: 1.75rem !important;
  }
}

/* Beautiful mobile menu */
.mobile-nav-button {
  display: none;
  background: rgba(255, 255, 255, 0.15) !important;
  border: 1px solid rgba(255, 255, 255, 0.2) !important;
  border-radius: 8px !important;
  color: white !important;
  padding: 0.5rem !important;
  cursor: pointer !important;
  align-items: center !important;
  justify-content: center !important;
  width: 44px !important;
  height: 44px !important;
  flex-shrink: 0 !important;
  transition: all 0.3s ease !important;
}

.mobile-nav-button:hover {
  background: rgba(255, 255, 255, 0.25) !important;
  transform: scale(1.05) !important;
}

.mobile-menu {
  display: none;
  margin-top: 0.75rem;
  animation: slideDown 0.3s ease;
}

.mobile-menu.open {
  display: block;
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Mobile menu items */
.mobile-menu-item {
  color: white !important;
  text-decoration: none !important;
  font-weight: 500 !important;
  padding: 1rem !important;
  border-radius: 8px !important;
  transition: all 0.3s ease !important;
  text-align: center !important;
  background: transparent !important;
  display: block !important;
  margin-bottom: 0.25rem !important;
  border: 1px solid transparent !important;
}

.mobile-menu-item:hover {
  background: rgba(255, 255, 255, 0.15) !important;
  border-color: rgba(255, 255, 255, 0.3) !important;
  transform: translateX(5px) !important;
}

/* Smooth transitions for all elements */
header, .desktop-nav a, .mobile-nav-button {
  transition: all 0.3s ease;
}

/* Responsive content containers */
@media (max-width: 768px) {
  .content-container {
    padding: 1rem !important;
  }
  
  .responsive-grid {
    grid-template-columns: 1fr !important;
    gap: 1rem !important;
  }
  
  .card {
    padding: 1.25rem !important;
    margin-bottom: 1rem !important;
  }
}

/* Enhanced touch targets */
@media (max-width: 768px) {
  .touch-target {
    min-height: 44px;
    min-width: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  a, button {
    min-height: 44px;
  }
}
EOF

# 2. Create a beautiful responsive Header
echo "🔧 Creating beautiful responsive Header..."
cat > app/components/layout/Header.jsx << 'EOF'
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
EOF

# 3. Update App.jsx with beautiful responsive footer
echo "🔄 Updating App.jsx with beautiful footer..."
cat > app/App.jsx << 'EOF'
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
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

echo "✅ Beautiful responsive design applied!"
echo "🎨 Features:"
echo "   - Smaller logo on mobile (45px vs 60px desktop)"
echo "   - Beautiful animations and transitions"
echo "   - Enhanced spacing and typography"
echo "   - Elegant mobile menu with blur effects"
echo "   - Smooth hover effects"
echo "   - Perfect touch targets"

# 4. Build and deploy
echo "🔨 Building beautiful application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed"
    exit 1
fi

echo "📦 Deploying beautiful responsive design..."
git add .
git commit -m "FEAT: Beautiful responsive design with smaller mobile logo and elegant spacing"
git push origin main

echo ""
echo "🎉 BEAUTIFUL RESPONSIVE DESIGN DEPLOYED!"
echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "📱 Now features:"
echo "   - Logo scales from 45px (mobile) to 60px (desktop)"
echo "   - Beautiful animations and blur effects"
echo "   - Perfect spacing on all devices"
echo "   - Elegant mobile menu"
echo "   - Smooth transitions everywhere"