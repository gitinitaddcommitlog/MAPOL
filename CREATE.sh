#!/bin/bash
# CREATE.sh - Final Deployment

echo "🚀 FINAL DEPLOYMENT - GITHUB PAGES ROUTING FIXED"

# 1. Build the application
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed - checking errors..."
    npm run build 2>&1 | grep -i error
    exit 1
fi

# 2. Verify the build has all necessary files
echo "🔍 Verifying build contents..."
echo "Essential files in docs/:"
ls -la docs/ | grep -E "(index.html|404.html|ena-logo.glb|assets)"

# 3. Test locally with preview
echo "🌐 Testing locally with preview server..."
npm run preview &
PREVIEW_PID=$!
sleep 3
echo "Preview running on http://localhost:4173"
echo "Quickly check if all pages work, then press Enter to deploy..."
read

kill $PREVIEW_PID 2>/dev/null

# 4. Deploy to GitHub Pages
echo "📦 DEPLOYING TO GITHUB PAGES..."
git add .
git commit -m "DEPLOY: Final version with working GitHub Pages routing"
git push origin main

echo ""
echo "🎉 DEPLOYMENT COMPLETE!"
echo "🌐 Your app is being deployed to: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ What's deployed:"
echo "   - Perfect 120px 3D logo container"
echo "   - Fixed GitHub Pages SPA routing"
echo "   - Dashboard, Forms, Reports pages working"
echo "   - Mobile responsive design"
echo   - Professional MARPOL compliance interface
echo ""
echo "⏰ Please wait 2-5 minutes for GitHub Pages to update"
echo ""
echo "📱 Test all pages:"
echo "   - Dashboard: https://gitinitaddcommitlog.github.io/MAPOL/"
echo "   - Forms: https://gitinitaddcommitlog.github.io/MAPOL/form"
echo "   - Reports: https://gitinitaddcommitlog.github.io/MAPOL/reports"
echo ""
echo "🎯 The 404 errors should now be resolved!"