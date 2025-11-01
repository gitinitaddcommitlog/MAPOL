#!/bin/bash
# COMMIT-NOW.sh - Commit Current Work

echo "🚀 COMMITTING YOUR WORK"

echo ""
echo "📊 CURRENT CHANGES:"
echo "==================="
git status --short

echo ""
echo "🔍 CHANGES TO BE COMMITTED:"
echo "==========================="
git diff --name-only

echo ""
echo "💾 COMMITTING ALL CHANGES..."
git add .

echo ""
echo "📝 CREATING COMMIT MESSAGE..."
git commit -m "ENHANCE: GOOD COMMIT2"

echo ""
echo "📤 PUSHING TO GITHUB..."
git push origin main

echo ""
echo "🎉 SUCCESSFULLY COMMITTED!"
echo "🌐 Live: https://gitinitaddcommitlog.github.io/MAPOL/"
echo ""
echo "✅ Your work is now saved and deployed!"
echo "📋 Commit: $(git log -1 --pretty=format:"%h")"
echo "📅 Time: $(date)"