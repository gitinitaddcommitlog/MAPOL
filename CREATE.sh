#!/bin/bash
# CREATE.sh - Fix Navigation Links Not Working

echo "🔧 FIXING NAVIGATION LINKS NOT WORKING"

# 1. First, let's check what URLs are actually being used
echo "🔍 Checking current routing setup..."
grep -n "Router" app/App.jsx
grep -n "Link" app/components/layout/Header.jsx

# 2. Fix the App.jsx to properly handle HashRouter
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

# 3. Fix the Header with proper HashRouter links
cat > app/components/layout/Header.jsx << 'EOF'
import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  const location = useLocation();
  
  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'relative'
    }}>
      <div className="header-container" style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem',
        display: 'flex',
        alignItems: 'center',
        gap: '1rem'
      }}>
        {/* Logo */}
        <div className="header-logo-container" style={{
          width: '120px',
          height: '120px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          flexShrink: 0
        }}>
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div style={{
          flex: 1,
          minWidth: 0,
          marginLeft: '0.75rem'
        }}>
          <Link to="/" style={{ textDecoration: 'none' }}>
            <h1 className="header-title" style={{
              margin: 0,
              fontSize: '1.75rem',
              fontWeight: '700',
              color: 'white',
              lineHeight: '1.2'
            }}>
              ENA Waste Management
            </h1>
            <p className="header-subtitle" style={{
              margin: '2px 0 0 0',
              fontSize: '0.9rem',
              color: 'rgba(255, 255, 255, 0.9)',
              lineHeight: '1.3'
            }}>
              MARPOL Compliance System
            </p>
          </Link>
        </div>
        
        {/* Navigation - PROPER HashRouter LINKS */}
        <nav style={{
          display: 'flex',
          gap: '1.5rem',
          alignItems: 'center',
          marginLeft: 'auto'
        }}>
          <Link 
            to="/" 
            style={{
              color: 'white',
              textDecoration: 'none',
              fontWeight: '500',
              padding: '0.5rem 1rem',
              borderRadius: '6px',
              transition: 'all 0.3s ease',
              background: location.hash === '#/' || location.hash === '' ? 'rgba(255, 255, 255, 0.2)' : 'transparent'
            }}
            onMouseEnter={(e) => {
              if (!(location.hash === '#/' || location.hash === '')) {
                e.target.style.background = 'rgba(255, 255, 255, 0.1)';
              }
            }}
            onMouseLeave={(e) => {
              if (!(location.hash === '#/' || location.hash === '')) {
                e.target.style.background = 'transparent';
              }
            }}
          >
            Dashboard
          </Link>
          <Link 
            to="/form" 
            style={{
              color: 'white',
              textDecoration: 'none',
              fontWeight: '500',
              padding: '0.5rem 1rem',
              borderRadius: '6px',
              transition: 'all 0.3s ease',
              background: location.hash === '#/form' ? 'rgba(255, 255, 255, 0.2)' : 'transparent'
            }}
            onMouseEnter={(e) => {
              if (location.hash !== '#/form') {
                e.target.style.background = 'rgba(255, 255, 255, 0.1)';
              }
            }}
            onMouseLeave={(e) => {
              if (location.hash !== '#/form') {
                e.target.style.background = 'transparent';
              }
            }}
          >
            Forms
          </Link>
          <Link 
            to="/reports" 
            style={{
              color: 'white',
              textDecoration: 'none',
              fontWeight: '500',
              padding: '0.5rem 1rem',
              borderRadius: '6px',
              transition: 'all 0.3s ease',
              background: location.hash === '#/reports' ? 'rgba(255, 255, 255, 0.2)' : 'transparent'
            }}
            onMouseEnter={(e) => {
              if (location.hash !== '#/reports') {
                e.target.style.background = 'rgba(255, 255, 255, 0.1)';
              }
            }}
            onMouseLeave={(e) => {
              if (location.hash !== '#/reports') {
                e.target.style.background = 'transparent';
              }
            }}
          >
            Reports
          </Link>
        </nav>
      </div>
    </header>
  );
};

export default Header;
EOF

# 4. Test the build locally first
echo "🔨 Building and testing locally..."
npm run build

# Start preview server to test
npm run preview &
PREVIEW_PID=$!
sleep 3
echo "Preview server running on http://localhost:4173"
echo "Please test the navigation links, then press Enter to deploy..."
read

kill $PREVIEW_PID 2>/dev/null

# 5. Deploy the fix
echo "📦 Deploying navigation link fix..."
git add .
git commit -m "FIX: Navigation links now working with HashRouter"
git push origin main

echo ""
echo "✅ NAVIGATION LINKS FIXED!"
echo "🌐 Test the links:"
echo "   - Dashboard: https://gitinitaddcommitlog.github.io/MAPOL/#/"
echo "   - Forms: https://gitinitaddcommitlog.github.io/MAPOL/#/form"
echo "   - Reports: https://gitinitaddcommitlog.github.io/MAPOL/#/reports"
echo ""
echo "🎯 The links should now work properly with HashRouter!"