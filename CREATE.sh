#!/bin/bash
# complete-deployment-fix.sh

echo "🚀 COMPLETE DEPLOYMENT FIX"

# 1. Copy the 3D logo
echo "📁 Copying 3D logo..."
cp "/home/donkali/Documents/FIBERSPINES/LAB/3DVIEWER/BLENDER-FILES/ENA.glb" "public/ena-logo.glb"

# 2. Make sure vite.config.js is correct
cat > vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  root: resolve(__dirname, 'app'),
  publicDir: resolve(__dirname, 'public'),
  server: {
    port: 3000,
    open: true
  },
  resolve: {
    extensions: ['.js', '.jsx', '.ts', '.tsx']
  },
  base: './',
  build: {
    outDir: resolve(__dirname, 'docs'),
    assetsDir: 'assets',
    emptyOutDir: true
  }
})
EOF

# 3. Clean and rebuild
echo "🔨 Rebuilding application..."
rm -rf docs/
npm run build

# 4. Verify the build has the logo
echo "🔍 Verifying build..."
if [ -f "docs/assets/ena-logo.glb" ] || [ -f "docs/ena-logo.glb" ]; then
    echo "✅ 3D logo is in build"
else
    echo "❌ 3D logo missing from build - checking where it went..."
    find docs/ -name "*.glb"
fi

# 5. Force push all changes to GitHub
echo "📦 Pushing to GitHub..."
git add .
git status
git commit -m "FIX: Complete deployment with 3D logo asset"
git push origin main

echo ""
echo "✅ DEPLOYMENT PUSHED!"
echo "🌐 Check in 2-5 minutes: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "💡 If the page still closes, check browser console for new errors"
echo "   The 404 for ena-logo.glb should now be fixed"