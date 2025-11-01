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
