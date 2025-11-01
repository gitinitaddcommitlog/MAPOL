#!/bin/bash
# deploy-now.sh

echo "🚀 Deploying to GitHub Pages..."

# Add all changes
git add .

# Commit
git commit -m "Deploy MARPOL app to GitHub Pages"

# Push to main
git push origin main

echo "✅ Deployment pushed to GitHub!"
echo ""
echo "🌐 Check your site in 2-3 minutes:"
echo "   https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "📋 If the interface isn't correct, we'll see what needs fixing."