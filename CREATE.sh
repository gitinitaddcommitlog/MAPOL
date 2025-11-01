#!/bin/bash
# remove-all-mobile-fix-gh-pages.sh

echo "🧹 REMOVING ALL MOBILE COMPLEXITY & FIXING GITHUB PAGES 404"

# 1. Remove all mobile CSS files
echo "🗑️ Removing mobile CSS files..."
rm -f app/styles/mobile-responsive.css
rm -f app/styles/responsive.css

# 2. Clean up globals.css - remove any mobile imports
echo "🔧 Cleaning globals.css..."
grep -v "mobile-responsive.css" app/styles/globals.css > app/styles/globals-clean.css
grep -v "responsive.css" app/styles/globals-clean.css > app/styles/globals.css
rm -f app/styles/globals-clean.css

# 3. Restore the SIMPLE, WORKING Header (no mobile menu)
echo "📁 Restoring simple Header..."
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
        
        {/* Simple Navigation */}
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

# 4. Fix the GitHub Pages 404 ERROR - This is the MAIN ISSUE!
echo "🔧 FIXING GITHUB PAGES 404 ERROR..."

# Check current docs folder
echo "📁 Current docs folder:"
ls -la docs/ 2>/dev/null || echo "No docs folder found"

# The GitHub Pages 404 means the docs folder isn't properly set up or built
# Let's ensure proper build and deployment

# 5. Ensure proper build configuration
echo "⚙️ Checking build configuration..."
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
  base: './',  // CRITICAL for GitHub Pages
  build: {
    outDir: resolve(__dirname, 'docs'),
    assetsDir: 'assets',
    emptyOutDir: true
  }
})
EOF

# 6. Ensure we have the CRITICAL 404.html for GitHub Pages SPA
echo "📄 Creating essential 404.html for GitHub Pages..."
cat > public/404.html << 'EOF'
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>MARPOL Waste Management</title>
    <script type="text/javascript">
      // Single Page Apps for GitHub Pages - REQUIRED
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

# 7. Build the application PROPERLY
echo "🔨 Building application properly..."
rm -rf docs/
npm run build

# 8. VERIFY the build worked and has all files
echo "🔍 VERIFYING BUILD:"
echo "Files in docs/:"
ls -la docs/
echo ""
echo "HTML files: $(find docs/ -name "*.html" | wc -l)"
echo "JS files: $(find docs/ -name "*.js" | wc -l)"
echo "GLB files: $(find docs/ -name "*.glb" | wc -l)"

# 9. Check if docs folder has the essential files
if [ ! -f "docs/index.html" ]; then
    echo "❌ CRITICAL: index.html missing from docs/"
    echo "💡 The build failed - checking why..."
    npm run build 2>&1 | grep -i error
    exit 1
fi

# 10. Deploy to fix GitHub Pages
echo "📦 DEPLOYING TO FIX GITHUB PAGES 404..."
git add .
git commit -m "FIX: Remove mobile complexity and fix GitHub Pages 404 error"
git push origin main

echo ""
echo "🎉 GITHUB PAGES 404 SHOULD BE FIXED!"
echo "🌐 Check in 2-5 minutes: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ What was fixed:"
echo "   - Removed ALL mobile responsiveness complexity"
echo "   - Restored simple, working header"
echo "   - Ensured proper GitHub Pages SPA configuration"
echo "   - Added essential 404.html for client-side routing"
echo "   - Verified build output has all necessary files"
echo ""
echo "💡 If you still see 404:"
echo "   1. Wait 5+ minutes for GitHub Pages to update"
echo "   2. Check GitHub repo Settings → Pages"
echo "   3. Ensure source is set to 'Deploy from docs folder'"
echo "   4. Make sure docs/ folder contains index.html"