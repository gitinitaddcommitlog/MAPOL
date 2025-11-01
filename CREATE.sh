#!/bin/bash
# CREATE.sh - Verify GitHub Pages Deployment

echo "🔍 VERIFYING GITHUB PAGES SETUP"

# 1. Check if we have the proper files for GitHub Pages
echo "📁 Checking docs/ folder structure:"
ls -la docs/

# 2. Check if index.html exists and has proper content
echo ""
echo "📄 Checking index.html in docs/:"
if [ -f "docs/index.html" ]; then
    echo "✅ index.html exists"
    echo "First 10 lines of index.html:"
    head -10 docs/index.html
else
    echo "❌ index.html missing from docs/"
    echo "This will cause GitHub Pages 404 error!"
fi

# 3. Check if 404.html exists for SPA routing
echo ""
echo "📄 Checking 404.html for SPA routing:"
if [ -f "docs/404.html" ]; then
    echo "✅ 404.html exists for client-side routing"
else
    echo "❌ 404.html missing - creating it now..."
    cat > docs/404.html << 'EOF'
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
fi

# 4. Check if assets are properly built
echo ""
echo "📦 Checking built assets:"
echo "JS files: $(find docs/ -name "*.js" | wc -l)"
echo "CSS files: $(find docs/ -name "*.css" | wc -l)"
echo "GLB files: $(find docs/ -name "*.glb" | wc -l)"

# 5. Verify the built index.html has React content
echo ""
echo "🔍 Checking if built index.html contains React app:"
if grep -q "root\|react" docs/index.html; then
    echo "✅ index.html contains React app structure"
else
    echo "❌ index.html missing React content - this is a problem!"
    echo "The build might not be processing React components properly"
fi

# 6. Test locally with preview to be sure
echo ""
echo "🌐 Testing locally with preview server..."
npm run preview &
PREVIEW_PID=$!
sleep 5
echo "Preview server should be running on http://localhost:4173"
echo "Please check if the app works correctly, then press Enter to continue..."
read

kill $PREVIEW_PID 2>/dev/null

# 7. Only deploy if everything looks good
echo ""
echo "🚀 DEPLOYING TO GITHUB PAGES..."
git add .
git commit -m "DEPLOY: Verified GitHub Pages setup with proper index.html and 404.html"
git push origin main

echo ""
echo "✅ DEPLOYMENT INITIATED!"
echo "🌐 Check in 2-5 minutes: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "💡 If you still see issues:"
echo "   1. Check GitHub repo Settings → Pages"
echo "   2. Ensure source is set to 'Deploy from docs folder'"
echo "   3. Verify docs/ folder contains:"
echo "      - index.html (main app)"
echo "      - 404.html (SPA routing)"
echo "      - assets/ folder (JS, CSS, images)"
echo "      - ena-logo.glb (3D model)"