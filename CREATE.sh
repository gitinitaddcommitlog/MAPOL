#!/bin/bash
# push_to_mapol_repo.sh

echo "=== PUSHING MARPOL APP TO MAPOL REPOSITORY ==="

echo "STEP 1: Initialize fresh Git repository"
rm -rf .git
git init

echo ""
echo "STEP 2: Add all MARPOL application files"
git add .

echo ""
echo "STEP 3: Create initial commit"
git commit -m "feat: Deploy MARPOL Waste Management System

- Professional maritime compliance platform
- Single entry point index.html with React Router
- Embedded 3D logo using base64 encoding
- Dashboard, Forms, and Reports pages
- GitHub Pages optimized static deployment
- React Three Fiber 3D visualization"

echo ""
echo "STEP 4: Set up main branch and remote"
git branch -M main
git remote add origin git@github.com:gitinitaddcommitlog/MAPOL.git

echo ""
echo "STEP 5: Push to MAPOL repository"
git push -u origin main

echo ""
echo "✅ MARPOL APP PUSHED SUCCESSFULLY!"