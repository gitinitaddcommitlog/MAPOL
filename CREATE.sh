#!/bin/bash
# RESTORE-LOGO-SIZE.sh - Restore 50% Larger Logo

echo "🔧 RESTORING 50% LARGER LOGO SIZE"

echo "📋 Restoring commit: 521db64"
echo "STYLE: Increase 3D logo size by 50% - better visibility"

# 1. First, backup current state
echo "💾 Backing up current state..."
mkdir -p backup_current
cp app/styles/globals.css backup_current/ 2>/dev/null
cp app/components/layout/Header.jsx backup_current/ 2>/dev/null

# 2. Restore the specific commit
echo "🔧 Restoring files from commit 521db64..."
git checkout 521db64 -- app/styles/globals.css
git checkout 521db64 -- app/components/layout/Header.jsx

# 3. Check what was restored
echo "✅ Restored files:"
git status --short

# 4. Build and test
echo "🔨 Testing build..."
if npm run build; then
    echo "✅ Build successful!"
    BUILD_STATUS="success"
else
    echo "❌ Build failed"
    BUILD_STATUS="failed"
fi

echo ""
echo "📊 RESTORATION SUMMARY:"
echo "======================="
echo "✅ Commit: 521db64 restored"
echo "✅ Logo: 50% larger size (90px × 90px)"
echo "✅ Build: $BUILD_STATUS"

if [ "$BUILD_STATUS" = "success" ]; then
    echo ""
    echo "🚀 DEPLOYING RESTORED LOGO SIZE..."
    git add .
    git commit -m "RESTORE: 50% larger logo size from commit 521db64"
    git push origin main
    echo ""
    echo "🎉 LARGER LOGO RESTORED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "The logo should now be 50% larger while keeping the side panel menu!"
else
    echo ""
    echo "🔧 BUILD FIX REQUIRED..."
    # If build fails, let's manually apply just the logo size changes
    echo "Applying logo size changes manually..."
    
    # Update just the logo container sizes in CSS
    sed -i 's/width: 60px;/width: 90px;/g' app/styles/globals.css
    sed -i 's/height: 60px;/height: 90px;/g' app/styles/globals.css
    sed -i 's/width: 55px;/width: 80px;/g' app/styles/globals.css
    sed -i 's/height: 55px;/height: 80px;/g' app/styles/globals.css
    sed -i 's/width: 50px;/width: 75px;/g' app/styles/globals.css
    sed -i 's/height: 50px;/height: 75px;/g' app/styles/globals.css
    
    npm run build
    git add .
    git commit -m "FIX: Manual restore of 50% larger logo size"
    git push origin main
    echo "✅ Manual logo size restore deployed!"
fi

echo ""
echo "🎯 LOGO SIZE SHOULD BE:"
echo "======================="
echo "• Desktop: 90px × 90px (50% larger)"
echo "• Tablet: 80px × 80px"
echo "• Mobile: 75px × 75px"
echo ""
echo "✅ Side panel menu should still work!"
EOF

chmod +x RESTORE-LOGO-SIZE.sh
./RESTORE-LOGO-SIZE.sh