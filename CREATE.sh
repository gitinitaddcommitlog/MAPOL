#!/bin/bash
# remove-mobile-mess-and-fix-gh-pages.sh

echo "🧹 REMOVING MOBILE MESS AND FIXING GITHUB PAGES"

# 1. Restore the original working Header (before any mobile changes)
echo "📁 Restoring original Header..."
find app/components/layout/ -name "*.backup" | head -5

# Check if we have a backup, otherwise create a clean header
if [ -f "app/components/layout/Header.jsx.backup" ]; then
    cp app/components/layout/Header.jsx.backup app/components/layout/Header.jsx
    echo "✅ Restored Header from backup"
else
    # Create a clean, simple header without mobile complexity
    cat > app/components/layout/Header.jsx << 'EOF'
import React from 'react';
import Logo3D from './Logo3D.jsx';

const Header = () => {
  return (
    <header style={{
      background: 'var(--gradient-primary)',
      padding: '1rem 0',
      boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
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
          justifyContent: 'center'
        }}>
          <Logo3D />
        </div>
        
        {/* Brand */}
        <div>
          <h1 style={{
            margin: 0,
            fontSize: '1.75rem',
            fontWeight: '700',
            color: 'white'
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
        
        {/* Navigation */}
        <nav style={{
          display: 'flex',
          gap: '2rem',
          alignItems: 'center',
          marginLeft: 'auto'
        }}>
          <a href="/" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Dashboard
          </a>
          <a href="/form" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Forms
          </a>
          <a href="/reports" style={{
            color: 'white',
            textDecoration: 'none',
            fontWeight: '500',
            padding: '0.5rem 1rem',
            borderRadius: '6px',
            transition: 'all 0.3s ease'
          }} onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
             onMouseLeave={(e) => e.target.style.background = 'transparent'}>
            Reports
          </a>
        </nav>
      </div>
    </header>
  );
};

export default Header;
EOF
    echo "✅ Created clean Header without mobile complexity"
fi

# 2. Remove the mobile CSS files that are causing issues
echo "🗑️ Removing mobile CSS files..."
rm -f app/styles/mobile-responsive.css
rm -f app/styles/responsive.css

# 3. Clean up globals.css - remove mobile imports
echo "🔧 Cleaning up globals.css..."
grep -v "mobile-responsive.css" app/styles/globals.css > app/styles/globals-clean.css
grep -v "responsive.css" app/styles/globals-clean.css > app/styles/globals.css
rm -f app/styles/globals-clean.css

# 4. Fix the GitHub Pages 404 issue - this is the main problem!
echo "🔧 Fixing GitHub Pages 404 issue..."

# The issue is that GitHub Pages needs a catch-all route in the built files
# We need to ensure the build includes proper routing

# Update App.jsx to ensure proper routing
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
            {/* Catch-all route for GitHub Pages SPA */}
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

# 5. Ensure we have the 404.html for GitHub Pages SPA support
echo "📄 Ensuring 404.html exists for GitHub Pages SPA..."
cat > public/404.html << 'EOF'
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>MARPOL Waste Management</title>
    <script type="text/javascript">
      // Single Page Apps for GitHub Pages
      var segmentCount = 0;
      var l = window.location;
      l.replace(
        l.protocol + '//' + l.hostname + (l.port ? ':' + l.port : '') +
        l.pathname.split('/').slice(0, 1 + segmentCount).join('/') + '/?p=/' +
        l.pathname.slice(1).split('/').slice(segmentCount).join('/').replace(/&/g, '~and~') +
        (l.search ? '&q=' + l.search.slice(1).replace(/&/g, '~and~') : '') +
        l.hash
      );
    </script>
  </head>
  <body>
    <p>Redirecting to MARPOL Waste Management System...</p>
  </body>
</html>
EOF

# 6. Build and test
echo "🔨 Building application..."
rm -rf docs/
npm run build

# 7. Verify the build has all pages
echo "🔍 Verifying build contents..."
ls -la docs/
echo "HTML files in build: $(find docs/ -name "*.html" | wc -l)"

# 8. Deploy
echo "📦 Deploying to GitHub Pages..."
git add .
git commit -m "FIX: Remove mobile complexity and fix GitHub Pages 404"
git push origin main

echo ""
echo "🎉 CLEAN DEPLOYMENT COMPLETE!"
echo "🌐 Your site should now work at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ What was fixed:"
echo "   - Removed all mobile responsiveness complexity"
echo "   - Restored clean, working header"
echo "   - Added catch-all route for GitHub Pages SPA"
echo "   - Added 404.html for client-side routing"
echo "   - All pages (Dashboard, Forms, Reports) should work"
echo ""
echo "💡 If you still see 404, wait 5 minutes for GitHub Pages to update"