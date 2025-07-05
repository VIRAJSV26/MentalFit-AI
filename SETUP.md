# 🔑 Setup Guide - Get Your API Keys

Before deploying, you need to get these API keys and database access:

## 1. 🗄️ MongoDB Atlas (Database)

**Free Tier Available** ✅

1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Click "Try Free" and create account
3. Create a new cluster (choose free tier)
4. Click "Connect" → "Connect your application"
5. Copy the connection string
6. Replace `<password>` with your database password

**Example connection string:**
```
mongodb+srv://yourusername:yourpassword@cluster0.xxxxx.mongodb.net/mentalfit?retryWrites=true&w=majority
```

## 2. 🤖 OpenAI API Key

**Pay per use** (very cheap for personal use)

1. Go to [OpenAI Platform](https://platform.openai.com)
2. Sign up/Login
3. Go to "API Keys" section
4. Click "Create new secret key"
5. Copy the key (starts with `sk-`)

**Cost:** ~$0.002 per 1K tokens (very cheap for personal use)

## 3. 🔐 Generate JWT Secret

**Free** - Generate a strong random string

You can use any of these methods:

**Option A: Online Generator**
- Go to [Random.org](https://www.random.org/strings/)
- Generate 64 characters
- Use letters, numbers, and symbols

**Option B: Command Line (if you have Node.js)**
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

**Option C: Use this pre-generated one (for testing only):**
```
my-super-secret-jwt-key-for-mental-fit-ai-2024-change-in-production
```

## 4. 📧 Email Setup (Optional)

If you want email features:

1. Go to [Gmail](https://gmail.com)
2. Enable 2-factor authentication
3. Generate an "App Password"
4. Use your Gmail address and the app password

## 🎯 Quick Checklist

- [ ] MongoDB Atlas account created
- [ ] Database connection string copied
- [ ] OpenAI API key generated
- [ ] JWT secret generated
- [ ] (Optional) Gmail app password created

## 💰 Estimated Monthly Costs

- **MongoDB Atlas**: $0 (free tier)
- **Vercel**: $0 (free tier)
- **Railway/Render**: $0 (free tier)
- **OpenAI**: ~$1-5/month (depending on usage)

## 🚀 Ready to Deploy?

Once you have all the keys, run:
```bash
./deploy.bat
```

Or follow the detailed guide in `DEPLOYMENT.md` 