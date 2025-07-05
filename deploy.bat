@echo off
echo 🚀 MentalFit AI Deployment Script
echo ==================================
echo.

REM Check if git is initialized
if not exist ".git" (
    echo ❌ Git repository not found. Please initialize git first:
    echo    git init
    echo    git add .
    echo    git commit -m "Initial commit"
    echo    git remote add origin YOUR_GITHUB_REPO_URL
    echo    git push -u origin main
    pause
    exit /b 1
)

REM Check if all required files exist
echo 📋 Checking project structure...
if not exist "package.json" (
    echo ❌ package.json not found in root directory
    pause
    exit /b 1
)

if not exist "backend\package.json" (
    echo ❌ backend\package.json not found
    pause
    exit /b 1
)

if not exist "vercel.json" (
    echo ❌ vercel.json not found
    pause
    exit /b 1
)

echo ✅ Project structure looks good!
echo.
echo 📝 Deployment Checklist:
echo ========================
echo.
echo 1. 🗄️  MongoDB Atlas Setup:
echo    - Go to https://www.mongodb.com/atlas
echo    - Create free cluster
echo    - Get connection string
echo.
echo 2. 🔧 Backend Deployment (Railway):
echo    - Go to https://railway.app
echo    - Connect GitHub repo
echo    - Set root directory to 'backend/'
echo    - Add environment variables:
echo      • MONGODB_URI=your_mongodb_connection_string
echo      • JWT_SECRET=your_long_random_string
echo      • OPENAI_API_KEY=your_openai_key
echo      • NODE_ENV=production
echo.
echo 3. 🌐 Frontend Deployment (Vercel):
echo    - Go to https://vercel.com
echo    - Connect GitHub repo
echo    - Add environment variable:
echo      • NEXT_PUBLIC_API_URL=your_backend_url
echo.
echo 4. 🔗 Connect Frontend to Backend:
echo    - Copy backend URL to Vercel environment variables
echo    - Add FRONTEND_URL to backend environment variables
echo.
echo 🎯 Quick Commands:
echo ==================
echo.
echo Push to GitHub:
echo git add .
echo git commit -m "Ready for deployment"
echo git push
echo.
echo Test locally:
echo cd backend ^&^& npm install ^&^& npm run dev
echo cd .. ^&^& npm install ^&^& npm run dev
echo.
echo 🔗 Your app will be available at:
echo Frontend: https://your-project.vercel.app
echo Backend: https://your-project.railway.app
echo.
echo 📱 Works on all devices: Desktop, Laptop, Tablet, Phone!
echo.
echo Need help? Check DEPLOYMENT.md for detailed instructions.
pause 