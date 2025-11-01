#!/bin/bash
# apply-careful-responsive.sh

echo "📱 APPLYING CAREFUL RESPONSIVENESS FOR IPHONE 12 PRO MAX & TABLETS"

# 1. First, backup the current working state
echo "📁 Creating backups..."
cp app/components/layout/Header.jsx app/components/layout/Header.jsx.working-backup
cp app/App.jsx app/App.jsx.backup

# 2. Create a proper responsive CSS that won't break anything
echo "🎨 Creating safe responsive CSS..."
cat > app/styles/responsive.css << 'EOF'
/* 📱 CAREFUL RESPONSIVE DESIGN - iPhone 12 Pro Max & Tablets */

/* iPhone 12 Pro Max: 428px x 926px */
@media (max-width: 428px) {
  /* Header adjustments for mobile */
  header > div {
    padding: 0 1rem !important;
  }
  
  header h1 {
    font-size: 1.25rem !important;
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
  
  /* Main content padding */
  main {
    padding: 0 1rem !important;
  }
  
  /* Footer adjustments */
  footer > div {
    padding: 0 1rem !important;
  }
  
  footer .grid-layout {
    grid-template-columns: 1fr !important;
    gap: 2rem !important;
  }
}

/* Tablets and larger phones: 429px - 768px */
@media (min-width: 429px) and (max-width: 768px) {
  header > div {
    padding: 0 1.5rem !important;
  }
  
  header h1 {
    font-size: 1.5rem !important;
  }
  
  header p {
    font-size: 0.8rem !important;
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
  
  footer .grid-layout {
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
}

/* Large desktop: 1024px and above */
@media (min-width: 1024px) {
  header > div {
    padding: 0 2rem !important;
  }
  
  main {
    padding: 0 2rem !important;
  }
  
  footer > div {
    padding: 0 2rem !important;
  }
}

/* Safe mobile menu styles */
.mobile-menu-button {
  display: none;
  background: rgba(255, 255, 255, 0.1) !important;
  border: none !important;
  border-radius: 6px !important;
  color: white !important;
  padding: 0.5rem !important;
  cursor: pointer !important;
  align-items: center !important;
  justify-content: center !important;
  width: 40px !important;
  height: 40px !important;
  flex-shrink: 0 !important;
}

.mobile-menu {
  display: none;
  margin-top: 0.75rem;
}

.mobile-menu.open {
  display: block;
}

/* Responsive grid for forms and content */
@media (max-width: 768px) {
  .responsive-grid {
    grid-template-columns: 1fr !important;
    gap: 1rem !important;
  }
  
  .form-grid {
    grid-template-columns: 1fr !important;
  }
}

/* iPad Pro and larger tablets: 1024px - 1366px */
@media (min-width: 769px) and (max-width: 1366px) {
  header h1 {
    font-size: 1.5rem !important;
  }
  
  header p {
    font-size: 0.85rem !important;
  }
  
  .desktop-nav a {
    font-size: 0.9rem !important;
    padding: 0.4rem 0.8rem !important;
  }
}

/* Touch-friendly targets for mobile */
@media (max-width: 768px) {
  .touch-target {
    min-height: 44px;
    min-width: 44px;
  }
  
  a, button {
    min-height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
}
EOF

# 3. Update globals.css to include responsive styles
echo "📝 Updating globals.css..."
if ! grep -q "responsive.css" app/styles/globals.css; then
    echo "" >> app/styles/globals.css
    echo "/* Responsive Styles */" >> app/styles/globals.css
    echo "@import './responsive.css';" >> app/styles/globals.css
fi

# 4. Create a carefully enhanced Header with mobile menu
echo "🔧 Creating responsive Header..."
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
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
      position: 'sticky',
      top: 0,
      zIndex: 1000
    }}>
      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem',
        display: 'flex',
        alignItems: 'center',
        gap: '1.5rem'
      }}>
        {/* Logo */}
        <div style={{
          width: '60px',
          height: '60px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          flexShrink: 0
        }}>
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div style={{ minWidth: 0, flex: 1 }}>
          <h1 style={{
            margin: 0,
            fontSize: '1.75rem',
            fontWeight: '700',
            color: 'white',
            lineHeight: '1.2'
          }}>
            ENA Waste Management
          </h1>
          <p style={{
            margin: 0,
            fontSize: '0.9rem',
            color: 'rgba(255, 255, 255, 0.9)'
          }}>
            MARPOL Compliance System
          </p>
        </div>
        
        {/* Desktop Navigation */}
        <nav className="desktop-nav" style={{
          display: 'flex',
          gap: '2rem',
          alignItems: 'center',
          marginLeft: 'auto'
        }}>
          {navigationItems.map((item) => (
            <a
              key={item.name}
              href={item.path}
              style={{
                color: 'white',
                textDecoration: 'none',
                fontWeight: '500',
                padding: '0.5rem 1rem',
                borderRadius: '6px',
                transition: 'all 0.3s ease',
                whiteSpace: 'nowrap'
              }}
              onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
              onMouseLeave={(e) => e.target.style.background = 'transparent'}
            >
              {item.name}
            </a>
          ))}
        </nav>

        {/* Mobile Menu Button */}
        <button
          className="mobile-nav-button"
          onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
          style={{
            background: 'rgba(255, 255, 255, 0.1)',
            border: 'none',
            borderRadius: '6px',
            color: 'white',
            padding: '0.5rem',
            cursor: 'pointer',
            display: 'none',
            alignItems: 'center',
            justifyContent: 'center',
            width: '40px',
            height: '40px',
            flexShrink: 0
          }}
          aria-label="Toggle menu"
        >
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
            <path d="M3 12H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            <path d="M3 6H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
            <path d="M3 18H21" stroke="currentColor" strokeWidth="2" strokeLinecap="round"/>
          </svg>
        </button>
      </div>

      {/* Mobile Navigation Menu */}
      <div className={`mobile-menu ${isMobileMenuOpen ? 'open' : ''}`} style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '0 2rem'
      }}>
        <div style={{
          background: 'rgba(255, 255, 255, 0.1)',
          borderRadius: '8px',
          padding: '1rem',
          backdropFilter: 'blur(10px)',
          marginTop: '0.5rem'
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
                className="touch-target"
                style={{
                  color: 'white',
                  textDecoration: 'none',
                  fontWeight: '500',
                  padding: '1rem',
                  borderRadius: '6px',
                  transition: 'all 0.3s ease',
                  textAlign: 'center',
                  background: 'transparent'
                }}
                onClick={() => setIsMobileMenuOpen(false)}
                onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.2)'}
                onMouseLeave={(e) => e.target.style.background = 'transparent'}
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

# 5. Update App.jsx to ensure footer has proper responsive classes
echo "🔄 Updating App.jsx for responsive footer..."
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
          <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 2rem' }}>
            <div className="grid-layout" style={{
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

echo "✅ Responsive design carefully applied!"
echo "📱 Breakpoints set for:"
echo "   - iPhone 12 Pro Max (428px and below)"
echo "   - Tablets (429px - 768px)"
echo "   - Desktop (769px and above)"
echo "   - iPad Pro (769px - 1366px)"

# 6. Build and test
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed - restoring backups..."
    cp app/components/layout/Header.jsx.working-backup app/components/layout/Header.jsx
    cp app/App.jsx.backup app/App.jsx
    exit 1
fi

# 7. Deploy
echo "📦 Deploying responsive design..."
git add .
git commit -m "FEAT: Careful responsive design for iPhone 12 Pro Max & tablets"
git push origin main

echo ""
echo "🎉 RESPONSIVE DESIGN DEPLOYED!"
echo "🌐 Check on different devices: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "📱 Test on:"
echo "   - iPhone 12 Pro Max (428px)"
echo "   - Tablets (768px)"
echo "   - Desktop (1024px+)"
echo ""
echo "💡 Hamburger menu will only show on mobile/tablet sizes!"