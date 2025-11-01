#!/bin/bash
# deploy_simple_version.sh

echo "=== DEPLOYING SIMPLE VERSION TO GITHUB PAGES ==="

echo "STEP 1: Update docs folder"
rm -rf docs/
mkdir -p docs
cp index.html docs/

echo ""
echo "STEP 2: Add GitHub Pages config"
touch docs/.nojekyll

cat > docs/404.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MARPOL Waste Management</title>
    <script>
        window.location.href = '/MAPOL/';
    </script>
</head>
<body>
    Redirecting to MARPOL application...
</body>
</html>
EOF

echo ""
echo "STEP 3: Commit and push"
git add .
git commit -m "deploy: Simple working version
- Pure HTML/CSS/JS - no frameworks
- Working navigation and forms
- Animated 3D-style logo
- Professional maritime design
- Immediate loading, no dependencies"
git push origin main

echo ""
echo "✅ SIMPLE VERSION DEPLOYED!"
echo "🌐 Live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo "⏰ Wait 2-5 minutes for deployment"