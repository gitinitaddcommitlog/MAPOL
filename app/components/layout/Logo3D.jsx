import React, { useRef, Suspense } from 'react';
import { Canvas, useFrame } from '@react-three/fiber';
import { OrbitControls, useGLTF, Environment } from '@react-three/drei';

// 3D Model component with auto-rotation
function ENAModel({ modelPath }) {
  const meshRef = useRef();
  const { scene } = useGLTF(modelPath);

  // Slow rotation animation
  useFrame((state, delta) => {
    if (meshRef.current) {
      meshRef.current.rotation.y += delta * 0.1; // Very slow rotation
    }
  });

  return <primitive ref={meshRef} object={scene} scale={1.5} />;
}

// Fallback component while model loads
function ModelFallback() {
  return (
    <mesh>
      <boxGeometry args={[2, 2, 2]} />
      <meshStandardMaterial color="#1a365d" />
    </mesh>
  );
}

// Main 3D Logo Component
function Logo3D() {
  return (
    <div style={{ 
      width: '120px', 
      height: '120px', 
      position: 'relative',
      cursor: 'grab',
      filter: 'drop-shadow(0 8px 24px rgba(0, 0, 0, 0.15))'
    }}>
      <Canvas
        camera={{ position: [5, 5, 5], fov: 45 }}
        style={{ 
          width: '100%', 
          height: '100%',
          borderRadius: '12px',
          background: 'linear-gradient(135deg, #1a365d 0%, #2d4a80 100%)'
        }}
      >
        <ambientLight intensity={0.6} />
        <directionalLight position={[10, 10, 5]} intensity={1} />
        <pointLight position={[-10, -10, -10]} intensity={0.5} />
        
        <Suspense fallback={<ModelFallback />}>
          <ENAModel modelPath="/ena-logo.glb" />
        </Suspense>
        
        <Environment preset="city" />
        
        {/* Enable orbit controls for interactive rotation */}
        <OrbitControls
          enableZoom={false}
          enablePan={false}
          maxPolarAngle={Math.PI / 2}
          minPolarAngle={Math.PI / 6}
          autoRotate={false}
          rotateSpeed={0.5}
        />
      </Canvas>
      
      {/* Loading indicator */}
      <div style={{
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        color: 'white',
        fontSize: '12px',
        opacity: 0.7,
        display: 'none' /* Hidden when not needed */
      }} className="loading-text">
        Loading...
      </div>
    </div>
  );
}

export default Logo3D;
