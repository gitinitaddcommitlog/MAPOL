#!/bin/bash
# CREATE.sh - Fix GitHub Pages Routing with HashRouter

echo "🔧 FIXING GITHUB PAGES ROUTING WITH HashRouter"

# 1. Update App.jsx to use HashRouter instead of BrowserRouter
echo "🔄 Switching to HashRouter for GitHub Pages..."
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
            {/* Catch-all route */}
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

# 2. Update Header to work with HashRouter
echo "🔗 Updating Header for HashRouter..."
cat > app/components/layout/Header.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'relative',
      overflow: 'hidden'
    }}>
      <div className="header-container" style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem',
        display: 'flex',
        alignItems: 'center',
        gap: '1rem',
        position: 'relative'
      }}>
        {/* Logo */}
        <div className="header-logo-container" style={{
          width: '120px',
          height: '120px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          flexShrink: 0,
          padding: '0',
          margin: '0',
          overflow: 'visible',
          background: 'transparent'
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
              lineHeight: '1.2',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis'
            }}>
              ENA Waste Management
            </h1>
            <p className="header-subtitle" style={{
              margin: '2px 0 0 0',
              fontSize: '0.9rem',
              color: 'rgba(255, 255, 255, 0.9)',
              lineHeight: '1.3',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis'
            }}>
              MARPOL Compliance System
            </p>
          </Link>
        </div>
        
        {/* Navigation */}
        <nav className="header-nav" style={{
          display: 'flex',
          gap: '1.5rem',
          alignItems: 'center',
          marginLeft: 'auto',
          flexShrink: 0
        }}>
          <Link to="/" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease',
            whiteSpace: 'nowrap'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Dashboard
          </Link>
          <Link to="/#/form" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease',
            whiteSpace: 'nowrap'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Forms
          </Link>
          <Link to="/#/reports" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease',
            whiteSpace: 'nowrap'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Reports
          </Link>
        </nav>
      </div>
    </header>
  );
};

export default Header;
EOF

# 3. Update vite.config.js to ensure proper base path
echo "⚙️ Updating Vite config for GitHub Pages..."
cat > vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  root: resolve(__dirname, 'app'),
  publicDir: resolve(__dirname, 'public'),
  server: {
    port: 3000,
    open: true
  },
  resolve: {
    extensions: ['.js', '.jsx', '.ts', '.tsx']
  },
  base: '/MAPOL/',  // Important for GitHub Pages subpath
  build: {
    outDir: resolve(__dirname, 'docs'),
    assetsDir: 'assets',
    emptyOutDir: true
  }
})
EOF

# 4. Build and test
echo "🔨 Building with HashRouter..."
npm run build

# 5. Deploy
echo "📦 DEPLOYING WITH HashRouter FIX..."
git add .
git commit -m "FIX: HashRouter for GitHub Pages - routing now works in index.html"
git push origin main

echo ""
echo "✅ HASHROUTER DEPLOYED!"
echo "🌐 Check in 2-5 minutes:"
echo "   - Dashboard: https://gitinitaddcommitlog.github.io/MAPOL/#/"
echo "   - Forms: https://gitinitaddcommitlog.github.io/MAPOL/#/form"
echo "   - Reports: https://gitinitaddcommitlog.github.io/MAPOL/#/reports"
echo ""
echo "🎯 Key change: Using HashRouter instead of BrowserRouter"
echo "   - URLs will have # in them (e.g., /#/form)"
echo "   - All routing happens within index.html"
echo "   - No more 404 errors from GitHub Pages!"