#!/bin/bash
# final-deployment.sh

echo "🚀 FINAL DEPLOYMENT TO GITHUB PAGES"

# Build the production version
echo "🔨 Building production version..."
npm run build

echo "📊 Build completed! Checking output..."
echo "JS files: $(find docs/ -name '*.js' | wc -l)"
echo "CSS files: $(find docs/ -name '*.css' | wc -l)"
echo "Total files in docs/: $(find docs/ -type f | wc -l)"

# Test the built version locally first
echo "🌐 Testing built version locally..."
echo "Opening preview server in background..."
npm run preview &
PREVIEW_PID=$!

# Wait a moment for preview to start
sleep 3

echo ""
echo "✅ If no errors above, the build is successful!"
echo "📦 Deploying to GitHub Pages..."
git add .
git commit -m "Deploy complete MARPOL app with full interface"
git push origin main

# Kill the preview server
kill $PREVIEW_PID 2>/dev/null

echo ""
echo "🎉 DEPLOYMENT COMPLETE!"
echo "🌐 Your app will be live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "⏰ Wait 2-5 minutes, then check:"
echo "   1. https://gitinitaddcommitlog.github.io/MAPOL/"
echo "   2. All pages work (Dashboard, Forms, Reports)"
echo "   3. 3D logo displays correctly"
echo "   4. All form fields are visible"
echo ""
echo "💡 If anything is missing, we'll fix the specific issues."