#!/bin/bash
# verify-build-before-deploy.sh

echo "🔍 VERIFYING BUILD BEFORE DEPLOYMENT"

# Build the app
echo "🔨 Building..."
npm run build

echo "📊 Build output analysis:"
echo "Main HTML file: docs/index.html ($(wc -c < docs/index.html) bytes)"
echo "JS files: $(find docs/ -name "*.js" | wc -l)"
echo "Total files in docs/: $(find docs/ -type f | wc -l)"

# Check if the built index.html contains React content
echo ""
echo "🔎 Checking built index.html for React app:"
if grep -q "root\|react" docs/index.html; then
    echo "✅ index.html contains React app structure"
else
    echo "❌ index.html missing React content"
    echo "First 10 lines of built index.html:"
    head -10 docs/index.html
fi

# Check for asset files
echo ""
echo "📦 Checking assets:"
find docs/ -type f -name "*.glb" -o -name "*.png" -o -name "*.jpg" | head -5

echo ""
echo "🌐 Test the built version locally:"
echo "   npm run preview"
echo "   (This serves the EXACT same files that GitHub Pages will serve)"
echo ""
echo "📋 If 'npm run preview' shows your complete app, then GitHub Pages will work!"