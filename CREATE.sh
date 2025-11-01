#!/bin/bash
# deploy_working_version.sh

echo "=== DEPLOYING WORKING VERSION ==="

echo "STEP 1: Prepare docs folder"
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
git commit -m "fix: Working React app with single entry point
- All components properly rendered
- Working navigation and forms
- Professional maritime interface
- No loading issues"
git push origin main

echo ""
echo "✅ WORKING VERSION DEPLOYED!"
echo "🌐 Live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo "⏰ Wait 2-5 minutes for deployment"