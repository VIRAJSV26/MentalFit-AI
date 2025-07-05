#!/bin/bash

# MentalFit AI - Full Stack Setup Script
echo "🚀 Setting up MentalFit AI - Full Stack Platform"
echo "================================================"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18+ is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ npm version: $(npm -v)"

# Install frontend dependencies
echo ""
echo "📦 Installing frontend dependencies..."
npm install

if [ $? -eq 0 ]; then
    echo "✅ Frontend dependencies installed successfully"
else
    echo "❌ Failed to install frontend dependencies"
    exit 1
fi

# Install backend dependencies
echo ""
echo "📦 Installing backend dependencies..."
cd backend
npm install

if [ $? -eq 0 ]; then
    echo "✅ Backend dependencies installed successfully"
else
    echo "❌ Failed to install backend dependencies"
    exit 1
fi

cd ..

# Create necessary directories
echo ""
echo "📁 Creating necessary directories..."
mkdir -p backend/logs
mkdir -p backend/uploads

# Create environment files if they don't exist
echo ""
echo "⚙️  Setting up environment files..."

# Frontend environment
if [ ! -f .env.local ]; then
    echo "Creating .env.local for frontend..."
    cat > .env.local << EOF
# Frontend environment variables
NEXT_PUBLIC_API_URL=http://localhost:5000/api
EOF
    echo "✅ Created .env.local"
else
    echo "✅ .env.local already exists"
fi

# Backend environment
if [ ! -f backend/.env ]; then
    echo "Creating backend/.env..."
    cat > backend/.env << EOF
# Server Configuration
NODE_ENV=development
PORT=5000
FRONTEND_URL=http://localhost:3000

# Database Configuration
MONGODB_URI=mongodb://localhost:27017/mentalfit

# JWT Configuration
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRE=30d
JWT_REFRESH_SECRET=your-super-secret-refresh-key-change-this-in-production

# OpenAI Configuration
OPENAI_API_KEY=sk-your-openai-api-key-here

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# Logging
LOG_LEVEL=info
LOG_FILE_PATH=logs

# Security
CORS_ORIGIN=http://localhost:3000
HELMET_ENABLED=true
EOF
    echo "✅ Created backend/.env"
else
    echo "✅ backend/.env already exists"
fi

# Check if MongoDB is running
echo ""
echo "🔍 Checking MongoDB connection..."
if command -v mongod &> /dev/null; then
    echo "✅ MongoDB is installed"
    echo "💡 Make sure MongoDB is running: mongod"
else
    echo "⚠️  MongoDB not found locally"
    echo "💡 Consider using MongoDB Atlas (cloud) and update MONGODB_URI in backend/.env"
fi

# Create package.json scripts for easy development
echo ""
echo "📝 Setting up development scripts..."

# Update frontend package.json to include backend scripts
if ! grep -q '"dev:backend"' package.json; then
    # Add backend scripts to frontend package.json
    sed -i.bak 's/"dev": "next dev"/"dev": "next dev",\n    "dev:backend": "cd backend && npm run dev",\n    "dev:full": "concurrently \"npm run dev\" \"npm run dev:backend\""/' package.json
    rm package.json.bak 2>/dev/null || true
    echo "✅ Added backend development scripts to package.json"
fi

# Install concurrently for running both servers
if ! grep -q "concurrently" package.json; then
    echo "📦 Installing concurrently for running both servers..."
    npm install --save-dev concurrently
fi

echo ""
echo "🎉 Setup completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Update backend/.env with your MongoDB connection string"
echo "2. Add your OpenAI API key to backend/.env (optional but recommended)"
echo "3. Start MongoDB: mongod"
echo "4. Start the backend: npm run dev:backend"
echo "5. Start the frontend: npm run dev"
echo "6. Or run both: npm run dev:full"
echo ""
echo "🌐 Frontend will be available at: http://localhost:3000"
echo "🔧 Backend API will be available at: http://localhost:5000"
echo ""
echo "📚 For more information, check the README.md file"
echo ""
echo "Happy coding! 🚀" 