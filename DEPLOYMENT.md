# 🚀 Deployment Guide - MentalFit AI

This guide will help you deploy your MentalFit AI application so it can be accessed from any device via a link.

## 📋 Prerequisites

1. **GitHub Account** - to host your code
2. **Vercel Account** - for frontend deployment (free)
3. **Railway/Render Account** - for backend deployment (free tier available)
4. **MongoDB Atlas Account** - for database (free tier available)
5. **OpenAI API Key** - for AI features

## 🗄️ Step 1: Set Up MongoDB Database

1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Create a free account and cluster
3. Create a database user with read/write permissions
4. Get your connection string (it looks like: `mongodb+srv://username:password@cluster.mongodb.net/mentalfit`)

## 🔧 Step 2: Deploy Backend (Choose One)

### Option A: Railway (Recommended - Free Tier)
1. Go to [Railway](https://railway.app)
2. Sign up with GitHub
3. Click "New Project" → "Deploy from GitHub repo"
4. Connect your GitHub repository
5. Set the root directory to `backend/`
6. Add environment variables:
   - `MONGODB_URI` = your MongoDB connection string
   - `JWT_SECRET` = a long random string (use a password generator)
   - `OPENAI_API_KEY` = your OpenAI API key
   - `NODE_ENV` = production
   - `FRONTEND_URL` = (we'll set this after frontend deployment)

### Option B: Render (Alternative - Free Tier)
1. Go to [Render](https://render.com)
2. Sign up with GitHub
3. Click "New" → "Web Service"
4. Connect your GitHub repository
5. Set build command: `npm install`
6. Set start command: `npm start`
7. Add environment variables (same as Railway)

## 🌐 Step 3: Deploy Frontend (Vercel)

1. Go to [Vercel](https://vercel.com)
2. Sign up with GitHub
3. Click "New Project" → "Import Git Repository"
4. Select your repository
5. Set the root directory to `/` (root of project)
6. Add environment variable:
   - `NEXT_PUBLIC_API_URL` = your backend URL (from Railway/Render)

## 🔗 Step 4: Connect Frontend to Backend

1. Copy your backend URL (e.g., `https://your-app.railway.app`)
2. Go to your Vercel project settings
3. Add environment variable: `NEXT_PUBLIC_API_URL` = your backend URL
4. Redeploy the frontend

## 🎯 Step 5: Update Backend CORS

1. Go to your Railway/Render backend settings
2. Add environment variable: `FRONTEND_URL` = your Vercel frontend URL
3. Redeploy the backend

## ✅ Step 6: Test Your Deployment

1. Visit your Vercel frontend URL
2. Test registration/login
3. Test mood logging
4. Test chat functionality

## 🔧 Troubleshooting

### Common Issues:
- **CORS errors**: Make sure `FRONTEND_URL` is set correctly in backend
- **Database connection**: Verify MongoDB URI is correct
- **API errors**: Check that `NEXT_PUBLIC_API_URL` is set in frontend

### Environment Variables Checklist:
**Backend:**
- ✅ MONGODB_URI
- ✅ JWT_SECRET  
- ✅ OPENAI_API_KEY
- ✅ FRONTEND_URL
- ✅ NODE_ENV=production

**Frontend:**
- ✅ NEXT_PUBLIC_API_URL

## 🎉 Success!

Your app is now live and accessible from any device! Share the Vercel URL with anyone.

## 📱 Mobile Access

Your app will work perfectly on:
- ✅ Desktop computers
- ✅ Laptops  
- ✅ Tablets
- ✅ Smartphones
- ✅ Any device with a web browser

## 🔒 Security Notes

- Never commit `.env` files to Git
- Use strong JWT secrets
- Enable HTTPS (automatic with Vercel/Railway/Render)
- Regularly update dependencies

## 💰 Cost

- **Vercel**: Free tier (unlimited personal projects)
- **Railway/Render**: Free tier available
- **MongoDB Atlas**: Free tier (512MB storage)
- **OpenAI**: Pay per use (very cheap for personal use)

## 🆘 Need Help?

If you encounter issues:
1. Check the deployment logs in Railway/Render/Vercel
2. Verify all environment variables are set
3. Test the health endpoint: `your-backend-url/health` 