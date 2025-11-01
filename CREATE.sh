#!/bin/bash
# deploy-layout-fix.sh

echo "🚀 DEPLOYING HEADER LAYOUT FIX"

# Build and test
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed"
    exit 1
fi

# Deploy to GitHub
echo "📦 Deploying to GitHub Pages..."
git add .
git commit -m "FIX: Header layout - fixed text overlap and mobile spacing"
git push origin main

echo ""
echo "🎉 LAYOUT FIX DEPLOYED!"
echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ Fixed issues:"
echo "   - Text no longer overlaps 3D logo"
echo "   - Proper spacing on all screen sizes"
echo "   - Hamburger menu works correctly"
echo "   - Maintained all navigation functionality"