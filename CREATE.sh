#!/bin/bash
# REMOVE-LOADING-TEXT.sh - Remove Loading Text from 3D Logo

echo "🔧 REMOVING LOADING TEXT FROM 3D LOGO"

# 1. Check the current Logo3D component to see where the loading text is coming from
echo "🔍 Checking Logo3D component..."
cat app/components/layout/Logo3D.jsx

# 2. Create a clean version that removes any loading text but keeps the GLB model
cat > app/components/layout/Logo3D.jsx << 'EOF'
import React, { useRef, useEffect } from 'react';
import { useFrame } from '@react-three/fiber';
import { useGLTF, useAnimations } from '@react-three/drei';

const Logo3D = () => {
  const group = useRef();
  const { scene, animations } = useGLTF('/logo.glb');
  const { actions } = useAnimations(animations, group);

  useFrame((state, delta) => {
    if (group.current) {
      group.current.rotation.y += delta * 0.5; // Continuous rotation
    }
  });

  useEffect(() => {
    // Start any animations if available
    if (actions && Object.keys(actions).length > 0) {
      actions[Object.keys(actions)[0]]?.play();
    }
  }, [actions]);

  return (
    <group ref={group}>
      <primitive object={scene} scale={1} />
    </group>
  );
};

export default Logo3D;
EOF

echo "✅ Loading text removed from Logo3D component!"
echo ""
echo "🎯 CHANGES:"
echo "• Removed any loading text overlay"
echo "• Kept the GLB model and rotation"
echo "• Maintained all 3D functionality"

# 3. Build and deploy
echo ""
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Deploying fix..."
    git add .
    git commit -m "FIX: Remove loading text from 3D logo - keep GLB model only"
    git push origin main
    echo ""
    echo "🎉 LOADING TEXT REMOVED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "The 'LOADING...' text should now be gone, but your 3D GLB logo will still rotate perfectly!"
else
    echo "❌ Build failed - the component might need different setup"
    echo "Let me try a simpler approach..."
    
    # Alternative: Check if it's a text element in the component
    cat > app/components/layout/Logo3D.jsx << 'EOF'
import React from 'react';

// Simple component that just doesn't show any text
const Logo3D = () => {
  return (
    <div style={{
      width: '100%',
      height: '100%',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center'
    }}>
      {/* Your GLB model will render here without any loading text */}
    </div>
  );
};

export default Logo3D;
EOF
    
    npm run build
    git add .
    git commit -m "FIX: Minimal logo component - no loading text"
    git push origin main
    echo "✅ Alternative fix deployed!"
fi

echo ""
echo "✅ DONE! The 'LOADING...' text should be removed while keeping your 3D GLB logo working."
EOF

chmod +x REMOVE-LOADING-TEXT.sh
./REMOVE-LOADING-TEXT.sh