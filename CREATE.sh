#!/bin/bash
# CREATE.sh - Fix Navigation Visibility

echo "🔧 FIXING NAVIGATION VISIBILITY"

# 1. First, let's check what's actually in the current Header
echo "📄 Checking current Header component..."
cat app/components/layout/Header.jsx

# 2. Fix the Header with proper navigation that's always visible
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
        
        {/* Navigation - ALWAYS VISIBLE */}
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
              transition: 'all 0.3s ease'
            }}
            onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
            onMouseLeave={(e) => e.target.style.background = 'transparent'}
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
              transition: 'all 0.3s ease'
            }}
            onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
            onMouseLeave={(e) => e.target.style.background = 'transparent'}
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
              transition: 'all 0.3s ease'
            }}
            onMouseEnter={(e) => e.target.style.background = 'rgba(255, 255, 255, 0.1)'}
            onMouseLeave={(e) => e.target.style.background = 'transparent'}
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

# 3. Remove any CSS that might be hiding the navigation
echo "🎨 Fixing CSS to show navigation..."
# Remove any mobile CSS that hides navigation
sed -i '/\.header-nav {/,/}/d' app/styles/globals.css
sed -i '/@media.*768px.*{/,/}/d' app/styles/globals.css

# Add simple responsive CSS that doesn't hide navigation
cat >> app/styles/globals.css << 'EOF'

/* Mobile responsive - don't hide navigation */
@media (max-width: 768px) {
  .header-container {
    padding: 0 1rem !important;
    gap: 0.5rem !important;
  }
  
  .header-logo-container {
    width: 80px !important;
    height: 80px !important;
  }
  
  .header-title {
    font-size: 1.2rem !important;
  }
  
  .header-subtitle {
    font-size: 0.75rem !important;
  }
  
  /* Keep navigation visible but make it smaller */
  nav {
    gap: 0.75rem !important;
  }
  
  nav a {
    padding: 0.4rem 0.8rem !important;
    font-size: 0.9rem !important;
  }
}

/* Tablet */
@media (min-width: 769px) and (max-width: 1024px) {
  .header-container {
    padding: 0 1.5rem !important;
  }
  
  .header-logo-container {
    width: 100px !important;
    height: 100px !important;
  }
  
  .header-title {
    font-size: 1.5rem !important;
  }
  
  nav {
    gap: 1rem !important;
  }
}
EOF

# 4. Test locally first
echo "🌐 Testing locally..."
npm run dev &
DEV_PID=$!
echo "Dev server starting on http://localhost:3000"
echo "Check if navigation is visible and working, then press Enter to continue..."
read

kill $DEV_PID 2>/dev/null

# 5. Build and deploy
echo "🔨 Building application..."
npm run build

echo "📦 Deploying navigation fix..."
git add .
git commit -m "FIX: Navigation always visible - removed hiding CSS"
git push origin main

echo ""
echo "✅ NAVIGATION FIX DEPLOYED!"
echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "🎯 Changes:"
echo "   - Navigation always visible (no hiding on mobile)"
echo "   - Removed CSS that was hiding .header-nav"
echo   - Simple responsive scaling instead of hiding
echo "   - Proper React Router Links"
echo ""
echo "📱 Navigation should now be visible on all screen sizes!"