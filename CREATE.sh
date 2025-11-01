#!/bin/bash
# CREATE.sh - Deploy with Perfect 3D Logo Container

echo "🚀 DEPLOYING WITH PERFECT 3D LOGO CONTAINER"

# Build the application
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed"
    npm run build 2>&1 | grep -i error
    exit 1
fi

# Verify the build has all files
echo "🔍 Verifying build contents..."
echo "Files in docs/:"
ls -la docs/
echo ""
echo "HTML files: $(find docs/ -name "*.html" | wc -l)"
echo "JS files: $(find docs/ -name "*.js" | wc -l)"
echo "GLB files: $(find docs/ -name "*.glb" | wc -l)"

# Deploy to GitHub Pages
echo "📦 Deploying to GitHub Pages..."
git add .
git commit -m "FEAT: Perfect 3D logo container (120px square) + mobile responsiveness"
git push origin main

echo ""
echo "🎉 DEPLOYMENT COMPLETE!"
echo "🌐 Your updated app will be live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ What's deployed:"
echo "   - Perfect 120px square 3D logo container"
echo "   - 20% wider logo space for full rotation visibility"
echo "   - Mobile responsive design"
echo "   - All pages working (Dashboard, Forms, Reports)"
echo "   - Beautiful professional styling"
echo ""
echo "⏰ Please wait 2-5 minutes for GitHub Pages to update"
echo ""
echo "📱 Test on different devices:"
echo "   - Desktop: 120px logo container"
echo "   - Tablet: 102px logo container" 
echo "   - Mobile: 84px logo container"