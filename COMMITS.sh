#!/bin/bash
# QUICK-COMMITS.sh - Quick Commit Check

echo "📋 QUICK COMMIT HISTORY"

echo ""
echo "🎯 LATEST COMMITS:"
echo "=================="
git log --oneline -10

echo ""
echo "📊 COMMIT STATS:"
echo "================"
echo "Total commits: $(git rev-list --count HEAD)"
echo "Latest commit: $(git log -1 --pretty=format:"%h - %s")"
echo "Date: $(git log -1 --pretty=format:"%cd" --date=relative)"

echo ""
echo "🔍 DETAILED VIEW OPTIONS:"
echo "========================="
echo "1. See last 5 commits with dates:"
echo "   git log --oneline --pretty=format:\"%h %ad %s\" --date=short -5"
echo ""
echo "2. See commits by author:"
echo "   git shortlog -s -n"
echo ""
echo "3. See commit graph:"
echo "   git log --oneline --graph --all -10"
echo ""
echo "4. See specific file changes:"
echo "   git log --oneline --follow app/components/layout/Header.jsx"

echo ""
echo "🚀 QUICK COMMANDS TO RUN:"
echo "========================"
echo "git log --oneline -10"
echo "git log --pretty=format:\"%h %ad %s\" --date=short -5"
echo "git log --oneline --graph --all -8"