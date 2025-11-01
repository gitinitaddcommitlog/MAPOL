#!/bin/bash
echo "🧪 Testing Backend Setup..."
cd backend

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

echo "🚀 Starting backend server..."
npm run dev
