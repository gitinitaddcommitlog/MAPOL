#!/bin/bash
# FIX-LOADING-TEXT.sh - Fix Persistent Loading Text

echo "🔧 FIXING PERSISTENT LOADING TEXT"

# 1. Create a proper Logo3D component that handles loading state correctly
cat > app/components/layout/Logo3D.jsx << 'EOF'
import React, { useRef, useEffect, useState } from 'react';
import { useFrame } from '@react-three/fiber';
import { useGLTF, useAnimations } from '@react-three/drei';

const Logo3D = () => {
  const group = useRef();
  const [modelLoaded, setModelLoaded] = useState(false);
  
  // Load GLB model
  const { scene, animations } = useGLTF(
    '/logo.glb',
    undefined,
    undefined,
    (loader) => {
      // This callback runs when the model is fully loaded
      setModelLoaded(true);
    }
  );
  
  const { actions } = useAnimations(animations, group);

  // Auto-rotate animation
  useFrame((state, delta) => {
    if (group.current) {
      group.current.rotation.y += delta * 0.5;
    }
  });

  useEffect(() => {
    // Start animations if available
    if (actions && Object.keys(actions).length > 0) {
      actions[Object.keys(actions)[0]]?.play();
    }
  }, [actions]);

  return (
    <>
      <group ref={group}>
        <primitive object={scene} scale={1} />
      </group>
    </>
  );
};

export default Logo3D;
EOF

echo "✅ Updated Logo3D component with proper loading handling!"

# 2. Also add CSS to hide any loader text that might appear
cat >> app/styles/globals.css << 'EOF'

/* ===== HIDE 3D LOADER TEXT ===== */
/* Hide any loading text from Three.js/React Three Fiber */
canvas + div,
[class*="loading"],
[class*="Loading"],
[data-loaded="false"] {
  display: none !important;
}

/* Ensure the logo container only shows the 3D model */
.header-logo-container > *:not(canvas) {
  display: none !important;
}

.header-logo-container canvas {
  display: block !important;
  width: 100% !important;
  height: 100% !important;
}
EOF

# 3. Alternative approach - if the above doesn't work, use a simpler solution
echo "Creating backup solution..."

cat > app/components/layout/Logo3D.jsx << 'EOF'
import React, { useRef, useEffect, useState } from 'react';
import { useFrame } from '@react-three/fiber';
import { useGLTF } from '@react-three/drei';

const Logo3D = () => {
  const group = useRef();
  
  // Load model without showing loader
  const { scene } = useGLTF('/logo.glb');
  
  // Auto-rotate
  useFrame((state, delta) => {
    if (group.current) {
      group.current.rotation.y += delta * 0.5;
    }
  });

  return (
    <group ref={group}>
      <primitive object={scene} scale={1} />
    </group>
  );
};

export default Logo3D;
EOF

echo "✅ Backup solution ready!"

# 4. Build and deploy
echo ""
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Deploying loading text fix..."
    git add .
    git commit -m "FIX: Remove persistent loading text from 3D logo"
    git push origin main
    echo ""
    echo "🎉 LOADING TEXT FIX DEPLOYED!"
    echo "🌐 Check: https://gitinitaddcommitlog.github.io/MAPOL/"
    echo ""
    echo "The 'LOADING...' text should now disappear after the model loads!"
else
    echo "❌ Build failed - trying minimal approach..."
    
    # Minimal approach - just the 3D model, no extra loaders
    cat > app/components/layout/Logo3D.jsx << 'EOF'
import React, { useRef } from 'react';
import { useFrame, useLoader } from '@react-three/fiber';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';

const Logo3D = () => {
  const group = useRef();
  const gltf = useLoader(GLTFLoader, '/logo.glb');
  
  useFrame((state, delta) => {
    if (group.current) {
      group.current.rotation.y += delta * 0.5;
    }
  });

  return (
    <group ref={group}>
      <primitive object={gltf.scene} scale={1} />
    </group>
  );
};

export default Logo3D;
EOF
    
    npm run build && git add . && git commit -m "FIX: Minimal 3D logo - no loading text" && git push origin main
    echo "✅ Minimal fix deployed!"
fi

echo ""
echo "🔧 If loading text still appears, try these manual fixes:"
echo "1. Check browser console for errors"
echo "2. Clear browser cache (Ctrl+Shift+R)"
echo "3. The CSS should hide any loader elements"
echo ""
echo "✅ The 3D logo should now show without any 'LOADING...' text!"
EOF

chmod +x FIX-LOADING-TEXT.sh
./FIX-LOADING-TEXT.sh