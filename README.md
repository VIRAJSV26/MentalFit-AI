# MentalFit AI - Full-Stack Mental Wellness Platform

![MentalFit AI](https://img.shields.io/badge/MentalFit-AI-blue) ![Next.js](https://img.shields.io/badge/Next.js-15-black) ![Express](https://img.shields.io/badge/Express-4.18-green) ![MongoDB](https://img.shields.io/badge/MongoDB-8.0-green) ![TypeScript](https://img.shields.io/badge/TypeScript-5-blue) ![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4o-green)

A comprehensive full-stack mental wellness platform that combines mood tracking, sentiment analysis, empathetic AI coaching, and comprehensive analytics to support users' emotional well-being.

## 🌟 Features

### Core Functionality
- **User Authentication** - Secure JWT-based authentication with email verification
- **Daily Mood Logging** - Track emotions with emoji selection and detailed journaling
- **AI Sentiment Analysis** - Real-time emotion analysis using OpenAI GPT-4o-mini
- **Empathetic AI Coach** - Conversational mental wellness support with GPT-4o
- **Mood Analytics** - Interactive charts and insights into emotional patterns
- **Wellness Resources** - Guided exercises, breathing techniques, and self-care tips
- **Crisis Support** - Emergency resources and professional help guidance
- **Data Persistence** - MongoDB database with comprehensive data models
- **Real-time Chat** - Interactive AI coaching interface with session management

### Technical Features
- **Full-Stack Architecture** - Next.js frontend with Express.js backend
- **Database Integration** - MongoDB with Mongoose ODM
- **Authentication System** - JWT tokens with refresh mechanism
- **API Security** - Rate limiting, CORS, Helmet security headers
- **Error Handling** - Comprehensive error handling and logging
- **Data Validation** - Input validation with express-validator
- **Responsive Design** - Works seamlessly on all devices
- **Graceful Fallbacks** - Smart responses even without API connectivity
- **Data Visualization** - Beautiful charts using Recharts
- **Accessibility** - WCAG compliant with proper ARIA labels

## 🏗️ Architecture

### Tech Stack
- **Frontend**: Next.js 15 with App Router, TypeScript, Tailwind CSS
- **Backend**: Node.js, Express.js, TypeScript
- **Database**: MongoDB with Mongoose ODM
- **Authentication**: JWT with bcryptjs
- **AI Integration**: OpenAI GPT-4o via OpenAI SDK
- **Charts**: Recharts
- **UI Components**: shadcn/ui
- **HTTP Client**: Axios
- **Validation**: Zod, express-validator
- **Logging**: Winston
- **Security**: Helmet, CORS, rate limiting

### Project Structure
```
mentalfit-ai/
├── app/                    # Next.js App Router pages
│   ├── api/               # Next.js API routes (legacy)
│   ├── analytics/         # Analytics page
│   ├── chat/             # AI coach chat
│   ├── mood-log/         # Mood logging
│   ├── wellness/         # Wellness resources
│   └── page.tsx          # Dashboard
├── backend/               # Express.js backend
│   ├── models/           # MongoDB models
│   ├── routes/           # API routes
│   ├── middleware/       # Express middleware
│   ├── services/         # Business logic services
│   ├── server.js         # Main server file
│   └── package.json      # Backend dependencies
├── components/            # Reusable components
│   ├── ui/               # shadcn/ui components
│   ├── mood-chart.tsx    # Mood visualization
│   ├── navigation.tsx    # App navigation
│   └── ...
├── lib/                  # Utility functions
│   ├── api.ts           # API service
│   ├── utils.ts         # General utilities
│   └── ...
└── docs/                 # Documentation
```

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ 
- MongoDB (local or Atlas)
- npm/pnpm/yarn
- OpenAI API Key (optional but recommended)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd mentalfit-ai
   ```

2. **Install frontend dependencies**
   ```bash
   npm install
   # or
   pnpm install
   ```

3. **Install backend dependencies**
   ```bash
   cd backend
   npm install
   cd ..
   ```

4. **Set up environment variables**

   Create `.env.local` in the root directory:
   ```bash
   # Frontend environment variables
   NEXT_PUBLIC_API_URL=http://localhost:5000/api
   ```

   Create `.env` in the backend directory:
   ```bash
   # Backend environment variables
   NODE_ENV=development
   PORT=5000
   FRONTEND_URL=http://localhost:3000
   MONGODB_URI=mongodb://localhost:27017/mentalfit
   JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
   JWT_EXPIRE=30d
   JWT_REFRESH_SECRET=your-super-secret-refresh-key-change-this-in-production
   OPENAI_API_KEY=sk-your-openai-api-key-here
   ```

5. **Start MongoDB**
   ```bash
   # If using local MongoDB
   mongod
   
   # Or use MongoDB Atlas (cloud)
   # Update MONGODB_URI in backend/.env
   ```

6. **Start the backend server**
   ```bash
   cd backend
   npm run dev
   ```

7. **Start the frontend development server**
   ```bash
   # In a new terminal
   npm run dev
   ```

8. **Open your browser**
   Navigate to [http://localhost:3000](http://localhost:3000)

## 📱 Usage

### Authentication
- Register with email and password
- Login with credentials
- JWT tokens are automatically managed
- Password reset functionality available

### Dashboard
- View mood overview and recent trends
- Quick mood logging
- Access to all features
- Daily inspirational quotes

### Mood Logging
- Select mood with emoji interface
- Write detailed journal entries
- Automatic sentiment analysis
- View mood history with filtering
- Export mood data

### AI Coach Chat
- Real-time conversations with AI wellness coach
- Contextual emotional support
- Practical coping strategies
- Crisis awareness and professional referrals
- Session management and history

### Analytics
- Mood trend visualization
- Sentiment analysis charts
- Mood distribution insights
- Activity correlations
- Personalized recommendations
- Consistency tracking

### Wellness Center
- Breathing exercises (4-7-8, Box Breathing)
- Mindfulness activities (5-4-3-2-1 Grounding)
- Daily affirmations and quotes
- Self-care activity suggestions
- Crisis resources

## 🔧 Configuration

### Environment Variables

#### Frontend (.env.local)
```bash
NEXT_PUBLIC_API_URL=http://localhost:5000/api
```

#### Backend (.env)
```bash
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
```

### API Endpoints

#### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/forgot-password` - Password reset request
- `POST /api/auth/reset-password` - Password reset
- `POST /api/auth/verify-email` - Email verification

#### User Management
- `GET /api/user/profile` - Get user profile
- `PUT /api/user/profile` - Update user profile
- `PUT /api/user/preferences` - Update user preferences
- `GET /api/user/stats` - Get user statistics
- `PUT /api/user/password` - Change password

#### Mood Tracking
- `GET /api/mood` - Get mood entries
- `POST /api/mood` - Create mood entry
- `PUT /api/mood/:id` - Update mood entry
- `DELETE /api/mood/:id` - Delete mood entry
- `GET /api/mood/stats/overview` - Get mood statistics
- `GET /api/mood/stats/trend` - Get mood trends
- `GET /api/mood/stats/activities` - Get activity insights

#### AI Chat
- `POST /api/chat/send` - Send message to AI coach
- `GET /api/chat/sessions` - Get chat sessions
- `GET /api/chat/session/:sessionId` - Get session messages
- `DELETE /api/chat/session/:sessionId` - Delete session
- `GET /api/chat/insights` - Get chat insights

#### Analytics
- `GET /api/analytics/overview` - Get analytics overview
- `GET /api/analytics/mood-trends` - Get mood trends
- `GET /api/analytics/patterns` - Get mood patterns
- `GET /api/analytics/insights` - Get personalized insights

#### Wellness
- `GET /api/wellness/resources` - Get wellness resources
- `GET /api/wellness/resources/:id` - Get specific resource
- `GET /api/wellness/categories` - Get resource categories
- `GET /api/wellness/quotes` - Get motivational quotes
- `GET /api/wellness/crisis-resources` - Get crisis resources

## 🎨 Customization

### Adding New Mood Options
Edit mood options in both frontend and backend:
```typescript
// Frontend: components/mood-log.tsx
const moodOptions = [
  { mood: "Excellent", emoji: "😄", color: "bg-green-500" },
  // Add new moods here
]

// Backend: models/MoodEntry.js
enum: ['Excellent', 'Good', 'Okay', 'Not Great', 'Terrible', 'NewMood']
```

### Customizing AI Responses
Modify fallback responses in `backend/services/aiService.js`:
```javascript
const responsePatterns = {
  anxiety: [
    "Your custom anxiety response...",
    // Add more responses
  ],
  // Add new emotion categories
}
```

### Styling
- Colors: Edit `tailwind.config.ts`
- Components: Modify shadcn/ui components in `/components/ui/`
- Layouts: Update page components in `/app/`

## 📊 Data Management

### Database Models

#### User Model
```typescript
interface User {
  email: string;
  password: string;
  name: string;
  avatar?: string;
  preferences: UserPreferences;
  stats: UserStats;
  isActive: boolean;
  emailVerified: boolean;
  lastLogin: Date;
}
```

#### MoodEntry Model
```typescript
interface MoodEntry {
  user: ObjectId;
  mood: string;
  emoji: string;
  note: string;
  sentiment: {
    score: number;    // -1 to 1
    label: string;    // Positive/Neutral/Negative
    confidence: number;
  };
  activities: string[];
  tags: string[];
  sleepHours?: number;
  energyLevel?: number;
  stressLevel?: number;
  isPrivate: boolean;
}
```

#### ChatMessage Model
```typescript
interface ChatMessage {
  user: ObjectId;
  role: 'user' | 'assistant';
  content: string;
  sessionId: string;
  metadata: {
    messageType: string;
    sentiment: any;
    keywords: string[];
  };
  aiResponse: {
    model: string;
    tokens: number;
    responseTime: number;
    fallbackUsed: boolean;
  };
}
```

### Data Privacy
- All data stored securely in MongoDB
- JWT tokens for authentication
- Password hashing with bcryptjs
- Rate limiting to prevent abuse
- CORS protection
- Input validation and sanitization

## 🚀 Deployment

### Backend Deployment

#### Vercel (Recommended)
1. Push backend code to GitHub
2. Connect repository to Vercel
3. Add environment variables in Vercel dashboard
4. Deploy automatically

#### Railway
1. Connect GitHub repository to Railway
2. Add environment variables
3. Deploy automatically

#### Heroku
1. Create Heroku app
2. Connect GitHub repository
3. Add environment variables
4. Deploy with `git push heroku main`

### Frontend Deployment

#### Vercel (Recommended)
1. Push frontend code to GitHub
2. Connect repository to Vercel
3. Add environment variables
4. Deploy automatically

### Database Deployment

#### MongoDB Atlas (Recommended)
1. Create MongoDB Atlas cluster
2. Get connection string
3. Update `MONGODB_URI` in backend environment
4. Configure network access and security

## 🧪 Testing

### Backend Testing
```bash
cd backend
npm test
```

### Frontend Testing
```bash
npm test
```

### Manual Testing Checklist
- [ ] User registration and login
- [ ] Mood logging with sentiment analysis
- [ ] AI coach conversations
- [ ] Analytics charts rendering
- [ ] Responsive design on mobile
- [ ] Fallback responses without API key
- [ ] Data persistence across sessions
- [ ] JWT token management
- [ ] Error handling and validation

### Browser Compatibility
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## 🤝 Contributing

### Development Setup
1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Make changes and test thoroughly
4. Commit: `git commit -m 'Add amazing feature'`
5. Push: `git push origin feature/amazing-feature`
6. Open Pull Request

### Code Standards
- Use TypeScript for all new code
- Follow existing naming conventions
- Add proper error handling
- Include accessibility features
- Test on multiple devices
- Update documentation

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

### Getting Help
- Check the [API Documentation](docs/API.md)
- Review [Component Documentation](docs/COMPONENTS.md)
- Open an issue on GitHub

### Crisis Resources
If you're experiencing a mental health emergency:
- **US**: National Suicide Prevention Lifeline: 988
- **US**: Crisis Text Line: Text HOME to 741741
- **Emergency**: 911
- **International**: Contact your local emergency services

## 🙏 Acknowledgments

- OpenAI for GPT-4o API
- Vercel for hosting and AI SDK
- shadcn/ui for beautiful components
- Recharts for data visualization
- MongoDB for database
- Express.js community
- The mental health community for inspiration

---

**Built with ❤️ for mental wellness**
