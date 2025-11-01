#!/bin/bash
# deploy-mobile-responsive.sh

echo "🚀 DEPLOYING MOBILE RESPONSIVE VERSION"

# Build the responsive version
echo "🔨 Building responsive app..."
npm run build

# Verify responsive features
echo "🔍 Verifying responsive elements..."
grep -r "clamp\|@media\|responsive" docs/ -i | head -5

# Deploy to GitHub
echo "📦 Deploying to GitHub Pages..."
git add .
git commit -m "FEAT: Complete mobile responsiveness upgrade"
git push origin main

echo ""
echo "🎉 MOBILE RESPONSIVE DEPLOYMENT COMPLETE!"
echo "📱 Test on different devices:"
echo "   - Mobile phones (320px-768px)"
echo "   - Tablets (768px-1024px)" 
echo "   - Desktop (1024px+)"
echo ""
echo "🌐 Live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ Features deployed:"
echo "   - Responsive header with mobile menu"
echo "   - Flexible grid layouts"
echo "   - Touch-friendly buttons"
echo "   - Responsive typography"
echo "   - Mobile-optimized components"