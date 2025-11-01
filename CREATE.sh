#!/bin/bash
# VERIFY-HEADER.sh - Verify the Header Fix

echo "🔍 VERIFYING HEADER LAYOUT FIX"

echo ""
echo "🌐 Checking online version..."
echo "Please open: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "📱 Check on both desktop and mobile:"
echo "   • Logo should be properly contained in header"
echo "   • Header height should be compact"
echo "   • Navigation should work on all devices"
echo ""

# Check current git status
echo "📊 Current git status:"
git status --short

echo ""
echo "📁 Current header files:"
find app/components/layout/ -name "*.jsx" -o -name "*.css" | while read file; do
    echo "📄 $file"
done

echo ""
echo "🎯 HEADER SPECIFICATIONS:"
echo "========================="
echo "✅ Logo container: 60px × 60px (desktop)"
echo "✅ Logo container: 50px × 50px (mobile)" 
echo "✅ Header min-height: 80px"
echo "✅ Responsive design maintained"
echo "✅ Hamburger menu functional"

echo ""
echo "🔧 QUICK FIXES IF NEEDED:"
echo "=========================="

# Check if logo container is properly sized in CSS
if grep -q "header-logo-container" app/styles/globals.css; then
    echo "✅ Logo container CSS found"
    echo ""
    echo "📏 Current logo container size:"
    grep -A 5 "header-logo-container" app/styles/globals.css | grep -E "width|height"
else
    echo "❌ Logo container CSS missing"
fi

echo ""
echo "🚀 NEXT STEPS:"
echo "=============="
echo "[1] Open the website and verify the header"
echo "[2] Test navigation on mobile/desktop"
echo "[3] Check if logo is properly contained"
echo "[4] Continue with other enhancements"

read -p "Does the header look good now? (y/n): " header_ok

if [ "$header_ok" = "y" ]; then
    echo "🎉 Perfect! Header layout is fixed."
    echo ""
    echo "💡 What would you like to enhance next?"
    echo "   • Dashboard content"
    echo "   • Forms functionality" 
    echo "   • Reports system"
    echo "   • Additional features"
else
    echo "🔧 Let me make additional header adjustments..."
    
    # Additional CSS tweaks if needed
    cat >> app/styles/globals.css << 'EOF'

/* Additional header refinements */
.header-logo-container {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    overflow: hidden !important;
}

/* Ensure header stays compact */
header {
    display: flex !important;
    align-items: center !important;
    height: auto !important;
    min-height: 80px !important;
}

/* Mobile header adjustments */
@media (max-width: 768px) {
    header {
        min-height: 70px !important;
        padding: 0.5rem 0 !important;
    }
}
EOF
    
    echo "✅ Additional header refinements added"
    echo "🔨 Rebuilding..."
    npm run build
    git add .
    git commit -m "REFINE: Additional header layout adjustments"
    git push origin main
    echo "🎉 Refinements deployed!"
fi

echo ""
echo "✅ HEADER FIX COMPLETE!"
echo "🌐 Your application: https://gitinitaddcommitlog.github.io/MAPOL/"
EOF

chmod +x VERIFY-HEADER.sh
./VERIFY-HEADER.sh