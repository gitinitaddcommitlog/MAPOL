#!/bin/bash
# fix-logo-path.sh

echo "🔧 FIXING LOGO PATH IN COMPONENT"

# Update the path in Logo3D.jsx from absolute to relative
echo "📝 Updating Logo3D.jsx path..."
sed -i 's|modelPath="/ena-logo.glb"|modelPath="./ena-logo.glb"|g' app/components/layout/Logo3D.jsx

# Verify the change
echo "🔍 Verifying the change:"
grep -A 2 -B 2 "modelPath" app/components/layout/Logo3D.jsx

# Rebuild with the correct path
echo "🚀 Rebuilding..."
rm -rf docs/
npm run build

# Verify the GLB is still there
echo "🔍 Checking build:"
find docs/ -name "*.glb"

# Deploy the fix
echo "📦 Deploying fix..."
git add .
git commit -m "FIX: Use relative path for 3D logo"
git push origin main

echo ""
echo "✅ DEPLOYED!"
echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "💡 The logo should now load from: ./ena-logo.glb (same directory)"
echo "   Instead of: /ena-logo.glb (root domain)"