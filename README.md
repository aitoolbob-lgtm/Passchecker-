# 🔐 PassFindexx — Password Intelligence Platform

> A full-stack password strength analyzer and generator with real-time analysis, user accounts, and analytics dashboard.

---

## ✨ Features

### Core
- **Real-Time Analysis** — debounced API calls, results as you type
- **12-Rule Security Engine** — length, uppercase, lowercase, numbers, special chars, common password detection, repeat/sequence detection, leet-speak detection, unique char ratio
- **Entropy Calculation** — mathematically accurate bits of entropy
- **Crack Time Estimation** — based on 10B guesses/second
- **Score 0–100** — weighted rule evaluation
- **Character Visualizer** — color-coded breakdown of your password characters

### Generator
- Configurable length (8–64 chars)
- Toggle uppercase, lowercase, numbers, special characters
- Generate 1 or 5 at once
- Instant strength scoring on generation
- One-click copy

### User Accounts
- Register / Login with JWT auth (7-day tokens)
- bcrypt password hashing (12 rounds)
- Password history saved per user
- Dashboard with personal stats + global stats

### Security
- Helmet.js security headers
- CORS protection
- Rate limiting (200/15min general, 20/15min auth)
- Input validation on all endpoints
- Passwords stored as bcrypt hashes only

---

## 🗂 Folder Structure

```
passfindexx/
├── backend/
│   ├── db/
│   │   └── database.js         # SQLite setup & schema
│   ├── middleware/
│   │   └── auth.js             # JWT middleware
│   ├── routes/
│   │   ├── auth.js             # /api/auth/*
│   │   └── passwords.js        # /api/passwords/*
│   ├── utils/
│   │   └── passwordEngine.js   # Core analysis + generation logic
│   ├── server.js               # Express app entry point
│   └── package.json
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Navbar.jsx + .module.css
│   │   │   ├── StrengthMeter.jsx + .module.css
│   │   │   ├── RulesPanel.jsx + .module.css
│   │   │   └── SuggestionsPanel.jsx + .module.css
│   │   ├── hooks/
│   │   │   ├── useAuth.jsx     # Auth context + provider
│   │   │   └── useToast.jsx    # Toast notification system
│   │   ├── pages/
│   │   │   ├── Home.jsx        # Main analyzer
│   │   │   ├── Generator.jsx   # Password generator
│   │   │   ├── Dashboard.jsx   # User analytics
│   │   │   ├── Login.jsx
│   │   │   ├── Register.jsx
│   │   │   └── About.jsx
│   │   ├── styles/
│   │   │   └── globals.css     # Design system
│   │   ├── utils/
│   │   │   └── api.js          # Axios instance
│   │   ├── App.jsx             # Router + providers
│   │   └── main.jsx
│   ├── index.html
│   └── package.json
└── README.md
```

---

## 🚀 Installation & Setup

### Prerequisites
- Node.js 18+ ([nodejs.org](https://nodejs.org))
- npm 9+

### 1. Install Backend Dependencies

```bash
cd passfindexx/backend
npm install
```

### 2. Install Frontend Dependencies

```bash
cd passfindexx/frontend
npm install
```

---

## ▶️ Running the App

### Development (two terminals)

**Terminal 1 — Backend:**
```bash
cd passfindexx/backend
npm run dev
# API running at http://localhost:3001
```

**Terminal 2 — Frontend:**
```bash
cd passfindexx/frontend
npm run dev
# App running at http://localhost:3000
```

Open [http://localhost:3000](http://localhost:3000)

---

### Production Build

```bash
# Build frontend
cd passfindexx/frontend
npm run build

# Start backend (serves built frontend too)
cd passfindexx/backend
npm start
# App at http://localhost:3001
```

---

## 🔗 API Reference

### Auth
| Method | Endpoint | Body | Description |
|--------|----------|------|-------------|
| POST | `/api/auth/register` | `{ email, username, password }` | Create account |
| POST | `/api/auth/login` | `{ email, password }` | Sign in |
| GET | `/api/auth/me` | — (JWT required) | Get current user |

### Passwords
| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| POST | `/api/passwords/analyze` | Optional | Analyze a password |
| POST | `/api/passwords/generate` | Optional | Generate password |
| GET | `/api/passwords/history` | Required | User's check history |
| GET | `/api/passwords/stats` | Required | User statistics |
| GET | `/api/passwords/global-stats` | None | Platform-wide stats |
| GET | `/api/health` | None | Health check |

### Example: Analyze
```bash
curl -X POST http://localhost:3001/api/passwords/analyze \
  -H "Content-Type: application/json" \
  -d '{"password": "MyStr0ng!Pass"}'
```

Response:
```json
{
  "success": true,
  "result": {
    "score": 87,
    "strength": "Strong",
    "entropy": 78.4,
    "charPool": 94,
    "length": 13,
    "crackTime": "Billions of years",
    "rulesPassed": 10,
    "rulesTotal": 12,
    "suggestions": [],
    "rules": { ... }
  }
}
```

---

## 🗄 Database Schema

**SQLite** with WAL mode for performance.

```sql
users              -- Registered users (email, username, bcrypt hash)
password_checks    -- Every analysis logged (score, entropy, strength, etc.)
generated_passwords -- Generated password metadata
user_sessions      -- Session tracking
```

Data is stored at `backend/passfindexx.db` (auto-created on first run).

---

## 🎨 Design System

- **Theme:** Dark cyberpunk with animated grid background
- **Font:** Outfit (display) + JetBrains Mono (monospace)
- **Colors:** Cyan `#00e5ff`, Violet `#7c3aed`, Green `#00ff88`
- **Strength Colors:** Weak=Red → Fair=Orange → Good=Amber → Strong=Lime → Very Strong=Green

---

## ⚙️ Environment Variables

Create `backend/.env` to override defaults:

```env
PORT=3001
JWT_SECRET=your-custom-secret-here-make-it-long
```

---

## 📦 Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18, React Router 6, CSS Modules, Vite 5 |
| Backend | Node.js, Express 4, JWT, bcryptjs |
| Database | SQLite (better-sqlite3), WAL mode |
| Security | Helmet, CORS, express-rate-limit |
| Dev | Nodemon, Vite HMR |

---

Built with ❤️ — PassFindexx
