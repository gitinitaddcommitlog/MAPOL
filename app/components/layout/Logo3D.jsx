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
