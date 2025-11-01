#!/bin/bash
# complete-fix-and-deploy.sh

echo "🚀 COMPLETING FIX AND DEPLOYMENT"

# 1. Fix the Header with PROPER hamburger visibility (not always visible)
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
      zIndex: 1000
    }}>
      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 1rem'
      }}>
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          gap: '1rem'
        }}>
          {/* Logo at far left */}
          <div style={{
            width: '45px',
            height: '45px',
            flexShrink: 0,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center'
          }}>
            <Logo3D />
          </div>

          {/* Brand text */}
          <div style={{ 
            minWidth: 0,
            flex: 1,
            overflow: 'hidden'
          }}>
            <h1 style={{
              margin: 0,
              fontSize: '1.25rem',
              fontWeight: '700',
              color: 'white',
              lineHeight: '1.2',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis'
            }}>
              ENA Waste Management
            </h1>
            <p style={{
              margin: 0,
              fontSize: '0.75rem',
              color: 'rgba(255, 255, 255, 0.9)',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis'
            }}>
              MARPOL Compliance System
            </p>
          </div>

          {/* Desktop Navigation - visible by default */}
          <nav style={{
            display: 'flex',
            gap: '1.5rem',
            alignItems: 'center',
            flexShrink: 0
          }} className="desktop-nav">
            {navigationItems.map((item) => (
              <a
                key={item.name}
                href={item.path}
                style={{
                  color: 'white',
                  textDecoration: 'none',
                  fontWeight: '500',
                  padding: '0.5rem 0.75rem',
                  borderRadius: '6px',
                  transition: 'all 0.3s ease',
                  fontSize: '0.9rem',
                  whiteSpace: 'nowrap'
                }}
                onMouseEnter={(e) => {
                  e.target.style.background = 'rgba(255, 255, 255, 0.1)';
                }}
                onMouseLeave={(e) => {
                  e.target.style.background = 'transparent';
                }}
              >
                {item.name}
              </a>
            ))}
          </nav>

          {/* Mobile Menu Button - hidden by default, shown via CSS */}
          <button
            onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
            style={{
              background: 'rgba(255, 255, 255, 0.1)',
              border: 'none',
              borderRadius: '6px',
              color: 'white',
              padding: '0.5rem',
              cursor: 'pointer',
              display: 'none', // HIDDEN BY DEFAULT
              alignItems: 'center',
              justifyContent: 'center',
              width: '40px',
              height: '40px',
              flexShrink: 0
            }}
            aria-label="Toggle menu"
            className="mobile-menu-button"
          >
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
              <path d="M3 12H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
              <path d="M3 6H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
              <path d="M3 18H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            </svg>
          </button>
        </div>

        {/* Mobile Navigation Menu */}
        <div style={{
          display: isMobileMenuOpen ? 'block' : 'none',
          marginTop: '0.75rem'
        }} className="mobile-menu">
          <div style={{
            background: 'rgba(255, 255, 255, 0.1)',
            borderRadius: '8px',
            padding: '0.75rem',
            backdropFilter: 'blur(10px)'
          }}>
            <div style={{
              display: 'flex',
              flexDirection: 'column',
              gap: '0.25rem'
            }}>
              {navigationItems.map((item) => (
                <a
                  key={item.name}
                  href={item.path}
                  style={{
                    color: 'white',
                    textDecoration: 'none',
                    fontWeight: '500',
                    padding: '0.75rem',
                    borderRadius: '6px',
                    transition: 'all 0.3s ease',
                    textAlign: 'center',
                    background: 'transparent',
                    fontSize: '0.9rem',
                    display: 'block'
                  }}
                  onClick={() => setIsMobileMenuOpen(false)}
                  onMouseEnter={(e) => {
                    e.target.style.background = 'rgba(255, 255, 255, 0.2)';
                  }}
                  onMouseLeave={(e) => {
                    e.target.style.background = 'transparent';
                  }}
                >
                  {item.name}
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
EOF

echo "✅ Header fixed with proper hamburger visibility"

# 2. Update App.jsx to include catch-all route for 404 prevention
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
        <main style={{ padding: '0' }}>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/form" element={<MainForm />} />
            <Route path="/reports" element={<Reports />} />
            {/* Catch-all route to prevent 404s on GitHub Pages */}
            <Route path="*" element={<Dashboard />} />
          </Routes>
        </main>
        
        <footer style={{
          background: 'var(--gradient-primary)',
          color: 'white',
          padding: '40px 0 24px',
          marginTop: '80px',
          borderTop: '1px solid rgba(255, 255, 255, 0.1)'
        }}>
          <div className="container">
            <div style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))',
              gap: '40px',
              marginBottom: '32px'
            }}>
              <div>
                <h4 style={{ marginBottom: '16px', opacity: 0.9 }}>ENA Waste Management Ltd.</h4>
                <p style={{ opacity: 0.7, lineHeight: 1.6 }}>
                  Professional maritime waste management solutions ensuring full MARPOL 73/78 compliance and environmental protection.
                </p>
              </div>
              <div>
                <h4 style={{ marginBottom: '16px', opacity: 0.9 }}>Contact Info</h4>
                <p style={{ opacity: 0.7, marginBottom: '8px' }}>📍 Tema Kpone Car Park</p>
                <p style={{ opacity: 0.7, marginBottom: '8px' }}>📦 P.O. BOX GP 4369, Accra</p>
                <p style={{ opacity: 0.7 }}>📞 0244316155, 024272684, 0558674185</p>
              </div>
              <div>
                <h4 style={{ marginBottom: '16px', opacity: 0.9 }}>Compliance</h4>
                <p style={{ opacity: 0.7, lineHeight: 1.6 }}>
                  Under regulations of MARPOL 73/78 and Ghana Ports and Harbours Authority Declaration
                </p>
              </div>
            </div>
            
            <div style={{
              borderTop: '1px solid rgba(255, 255, 255, 0.1)',
              paddingTop: '24px',
              textAlign: 'center',
              opacity: 0.7
            }}>
              <p style={{ margin: 0 }}>
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

echo "✅ App.jsx updated with catch-all route"

# 3. Build and deploy
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed"
    exit 1
fi

# 4. Deploy to GitHub
echo "📦 Deploying to GitHub Pages..."
git add .
git commit -m "FIX: Proper hamburger menu + catch-all routing"
git push origin main

echo ""
echo "🎉 DEPLOYMENT COMPLETE!"
echo "🌐 Live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ Fixed:"
echo "   - Logo at top left corner"
echo "   - Hamburger menu shows only on mobile"
echo "   - Desktop navigation shows on larger screens"
echo "   - Catch-all route prevents 404 errors"
echo ""
echo "📱 Test by resizing your browser to mobile size to see hamburger!"