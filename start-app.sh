#!/bin/bash

echo "🚀 Starting MARPOL Application..."
echo "================================="

# Check if backend node_modules exists
if [ ! -d "backend/node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    cd backend
    npm install
    cd ..
fi

# Check if frontend node_modules exists  
if [ ! -d "node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    npm install
fi

echo ""
echo "✅ Dependencies installed!"
echo ""
echo "📋 To run the application:"
echo ""
echo "Terminal 1 - Backend:"
echo "   cd backend && npm run dev"
echo ""
echo "Terminal 2 - Frontend:"
echo "   npm run dev"
echo ""
echo "🌐 Application will be available at:"
echo "   Frontend: http://localhost:3000"
echo "   Backend:  http://localhost:5000"
