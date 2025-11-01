#!/bin/bash
# fix-package-and-deploy.sh

# Fix duplicate keys in package.json
cat > package.json << 'EOF'
{
  "name": "marpol-waste-management",
  "version": "1.0.0",
  "type": "module",
  "homepage": "./",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "deploy": "vite build"
  },
  "dependencies": {
    "@react-three/drei": "^9.85.0",
    "@react-three/fiber": "^8.15.11",
    "jspdf": "^3.0.3",
    "jspdf-autotable": "^5.0.2",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.8.0",
    "three": "^0.158.0"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^4.0.0",
    "vite": "^4.3.0"
  }
}
EOF

echo "✅ Fixed package.json duplicates"

# Build again
echo "🚀 Building application..."
npm run build

# Deploy to GitHub
echo "📦 Deploying to GitHub Pages..."
git add .
git commit -m "Deploy MARPOL app to GitHub Pages"
git push origin main

echo "✅ Deployment complete!"
echo "🌐 Your app will be live at: https://gitinitaddcommitlog.github.io/MAPOL/"
echo "   (It may take a few minutes for GitHub Pages to update)"