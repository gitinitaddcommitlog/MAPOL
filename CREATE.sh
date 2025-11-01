#!/bin/bash
# deploy_enhanced_version.sh

echo "=== DEPLOYING ENHANCED VERSION ==="

echo "STEP 1: Prepare docs folder with your full app structure"
rm -rf docs/
mkdir -p docs
cp index.html docs/
cp -r app/ docs/app/
cp -r public/ docs/public/

echo ""
echo "STEP 2: Add GitHub Pages configuration"
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
git commit -m "feat: Enhanced single entry point with component bridge
- Preserves existing React app structure
- Component bridge for loading actual components
- Working navigation and pages
- Ready for gradual component migration"
git push origin main

echo ""
echo "✅ ENHANCED VERSION DEPLOYED!"
echo "🌐 Live at: https://gitinitaddcommitlog.github.io/MAPOL/"