#!/bin/bash
# PassFindexx Quick Setup Script

set -e

echo ""
echo "🔐 PassFindexx Setup"
echo "===================="
echo ""

echo "📦 Installing backend dependencies..."
cd backend
npm install --silent
echo "✅ Backend ready"
cd ..

echo ""
echo "📦 Installing frontend dependencies..."
cd frontend
npm install --silent
echo "✅ Frontend ready"
cd ..

echo ""
echo "🎉 Setup complete!"
echo ""
echo "To run in development mode, open two terminals:"
echo ""
echo "  Terminal 1 (Backend):"
echo "    cd passfindexx/backend && npm run dev"
echo ""
echo "  Terminal 2 (Frontend):"
echo "    cd passfindexx/frontend && npm run dev"
echo ""
echo "  Then open: http://localhost:3000"
echo ""
echo "  Or for a production build:"
echo "    cd passfindexx/frontend && npm run build"
echo "    cd passfindexx/backend && npm start"
echo "    Then open: http://localhost:3001"
echo ""
