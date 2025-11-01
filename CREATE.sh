#!/bin/bash
# update_github_pages.sh

echo "=== UPDATING GITHUB PAGES ==="

echo "STEP 1: Update docs folder with working version"
rm -rf docs/
mkdir -p docs
cp index.html docs/

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
git commit -m "fix: Working static version with embedded React
- Single HTML file with everything included
- Working 3D visualization with simple cube
- No external dependencies or module loading issues
- Proper navigation between pages"
git push origin main

echo ""
echo "✅ GITHUB PAGES UPDATED!"
echo "🌐 Live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo "⏰ Wait 2-5 minutes for deployment"