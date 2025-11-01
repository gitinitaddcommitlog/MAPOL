#!/bin/bash
echo "=== DEPLOYING TO GITHUB PAGES ==="

# Build the project
npm run build

# Verify build
if [ ! -f "docs/index.html" ]; then
    echo "❌ Build failed - no index.html in docs/"
    exit 1
fi

if [ ! -f "docs/404.html" ]; then
    echo "❌ 404.html missing - SPA routing won't work"
    exit 1
fi

# Commit and push
git add docs/
git commit -m "deploy: GitHub Pages build with 3D logo"
git push origin main

echo "✅ DEPLOYMENT INITIATED!"
echo "🌐 Live site: https://gitinitaddcommitlog.github.io/MAPOL/"
echo "⏰ Wait 2-5 minutes for GitHub Pages to update"
