# MedHelp Developer Guide

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/medhelp/app.git
cd medhelp/saas-app

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env.local

# Start development servers
npm run dev          # Next.js with hot reload (http://localhost:3000)
npx convex dev      # Convex backend (separate terminal)
```

## 🎨 Design System

### Color Palette
Our unique medical-inspired color scheme:

- **Primary**: Teal Green `#22C55E` (Trust, Health, Growth)
- **Secondary**: Coral Pink `#EC4899` (Care, Warmth, Urgency)
- **Accent**: Ocean Blue `#06B6D4` (Calm, Professional, Technology)
- **Background**: Light Blue-Gray `#F8FAFC` / Dark Navy `#0B1929`
- **Glass Effects**: 70% opacity with backdrop blur

### Typography
- **Headings**: Sora (Modern, Medical, Professional)
- **Body**: Inter (Clean, Readable, Technical)
- **Features**: Variable fonts with optical sizing

### Components
- **Glass morphism**: Used for cards and overlays
- **Gradient borders**: For interactive elements
- **Floating animations**: Subtle parallax effects
- **Mesh gradients**: Background decorations

## 🛠 Development Features

### 1. Hot Module Replacement (HMR)
✅ **Already Enabled** - Next.js Turbopack provides instant updates

```bash
npm run dev --turbopack  # Ultra-fast HMR
```

### 2. Dark Mode Support
✅ **Implemented** - Toggle in header, persists preference

```tsx
// Usage in components
import { useTheme } from 'next-themes'

const { theme, setTheme } = useTheme()
```

### 3. Developer Tools

#### Error Overlay
Next.js provides detailed error messages with stack traces in development.

#### React DevTools
Install browser extension for component inspection:
- [Chrome](https://chrome.google.com/webstore/detail/react-developer-tools/)
- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/react-devtools/)

#### Convex Dashboard
Monitor real-time database operations:
```bash
npx convex dashboard  # Opens at https://dashboard.convex.dev
```

### 4. Type Safety
Full TypeScript support with strict mode:

```bash
npm run type-check    # Check for type errors
npm run lint         # ESLint with TypeScript rules
```

### 5. Testing

```bash
npm test             # Run all tests
npm run test:unit    # Unit tests only
npm run test:e2e     # End-to-end tests
npm run test:watch   # Watch mode for TDD
```

### 6. Performance Monitoring

Built-in Web Vitals tracking:
```tsx
// Automatically logs to console in dev
// app/providers/analytics-provider.tsx
```

### 7. API Mocking
MSW (Mock Service Worker) for offline development:

```tsx
// test/mocks/handlers.ts
if (process.env.NEXT_PUBLIC_MOCK_API === 'true') {
  // Mocks enabled
}
```

## 📁 Project Structure

```
saas-app/
├── app/                      # Next.js 15 App Router
│   ├── (authenticated)/     # Protected routes
│   ├── (public)/            # Public routes
│   ├── api/                 # API endpoints
│   ├── consultation/        # Consultation flow
│   └── providers/           # React providers
├── components/              
│   ├── ui/                  # Shadcn UI components
│   └── features/            # Feature-specific components
├── convex/                  # Backend
│   ├── schema.ts           # Database schema
│   └── *.ts                # Mutations & queries
├── features/               # Feature modules
│   ├── ai/                # AI symptom checker
│   ├── appointments/      # Booking system
│   └── payments/          # Stripe integration
├── lib/                    # Utilities
│   ├── api/               # API client
│   ├── cache/             # Caching layer
│   └── utils.ts           # Helper functions
├── public/                # Static assets
└── styles/               # Global styles
```

## 🔥 Hot Keys & Shortcuts

### Development Shortcuts
- `Cmd/Ctrl + S` - Save & hot reload
- `Cmd/Ctrl + Shift + E` - Open error overlay
- `Cmd/Ctrl + Shift + D` - Open React DevTools
- `Cmd/Ctrl + K` - Search files (VS Code)

### Browser DevTools
- `F12` - Open DevTools
- `Cmd/Ctrl + Shift + C` - Inspect element
- `Cmd/Ctrl + Shift + M` - Toggle mobile view

## 🎯 Component Development

### Creating New Components

```bash
# Use our component generator
npm run generate:component MyComponent

# Or manually create with proper structure:
```

```tsx
// components/features/MyComponent.tsx
'use client'

import { motion } from 'framer-motion'
import { cn } from '@/lib/utils'

interface MyComponentProps {
  className?: string
  children?: React.ReactNode
}

export function MyComponent({ className, children }: MyComponentProps) {
  return (
    <motion.div 
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      className={cn(
        'glass-card rounded-2xl p-6',
        className
      )}
    >
      {children}
    </motion.div>
  )
}
```

## 🔧 Environment Variables

```env
# Required for basic functionality
NEXT_PUBLIC_CONVEX_URL=
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=

# Stripe (Payments)
STRIPE_SECRET_KEY=
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=
STRIPE_WEBHOOK_SECRET=

# Optional features
OPENAI_API_KEY=              # AI symptom checker
NEXT_PUBLIC_PUSHER_KEY=      # Real-time chat
KV_REST_API_URL=             # Redis caching
VERCEL_BLOB_READ_WRITE_TOKEN= # File storage

# Development tools
NEXT_PUBLIC_MOCK_API=false   # Enable MSW mocking
NEXT_PUBLIC_DEBUG=false      # Debug logging
```

## 🚄 Performance Optimizations

### 1. Image Optimization
```tsx
import Image from 'next/image'

<Image 
  src="/hero.jpg" 
  alt="Hero" 
  width={1200} 
  height={600}
  priority // Load immediately
  placeholder="blur" // Show blurred placeholder
/>
```

### 2. Code Splitting
```tsx
// Dynamic imports for heavy components
const HeavyComponent = dynamic(() => import('./HeavyComponent'), {
  loading: () => <Skeleton />,
  ssr: false // Client-side only
})
```

### 3. Caching Strategy
```tsx
// API routes use edge runtime for speed
export const runtime = 'edge'

// Static pages are pre-rendered
export const revalidate = 3600 // Revalidate every hour
```

## 🎨 Styling Guide

### Using Our Custom Utilities

```tsx
// Glass morphism effect
<div className="glass">

// Glass card with gradient
<div className="glass-card">

// Gradient text
<h1 className="gradient-text">

// Hover animations
<button className="hover-lift">
<card className="hover-glow">

// Background patterns
<section className="pattern-dots">
<section className="pattern-grid">

// Mesh gradient background
<div className="mesh-gradient">
```

### Animation Patterns

```tsx
// Parallax scrolling
const { scrollYProgress } = useScroll()
const y = useTransform(scrollYProgress, [0, 1], [0, 150])

// Floating animation
<motion.div className="animate-float">

// Stagger children
<motion.div
  variants={{
    hidden: { opacity: 0 },
    show: {
      opacity: 1,
      transition: { staggerChildren: 0.1 }
    }
  }}
>
```

## 🔌 API Development

### Creating New Endpoints

```typescript
// app/api/my-endpoint/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@clerk/nextjs'

export const runtime = 'edge' // Use edge runtime

export async function GET(req: NextRequest) {
  const { userId } = auth()
  
  if (!userId) {
    return NextResponse.json(
      { error: 'Unauthorized' },
      { status: 401 }
    )
  }

  // Your logic here
  return NextResponse.json({ data: 'success' })
}
```

### Convex Mutations

```typescript
// convex/myFeature.ts
import { mutation } from "./_generated/server"
import { v } from "convex/values"

export const createItem = mutation({
  args: { 
    name: v.string(),
    value: v.number() 
  },
  handler: async (ctx, args) => {
    const identity = await ctx.auth.getUserIdentity()
    if (!identity) throw new Error("Unauthorized")
    
    return await ctx.db.insert("items", {
      ...args,
      userId: identity.subject,
      createdAt: Date.now()
    })
  }
})
```

## 🚀 Deployment

### Vercel Deployment

```bash
# Preview deployment
vercel

# Production deployment
vercel --prod
```

### Environment Setup
1. Add all env vars in Vercel dashboard
2. Connect GitHub repo for auto-deploy
3. Set up domain and SSL

## 🐛 Debugging Tips

### 1. Console Debugging
```tsx
// Enhanced logging in development
if (process.env.NODE_ENV === 'development') {
  console.log('🔍 Debug:', { data })
}
```

### 2. React Query DevTools
```tsx
// Already configured in providers
// Look for floating button in bottom-right
```

### 3. Network Tab
- Monitor API calls
- Check WebSocket connections (Convex)
- Verify Stripe webhooks

### 4. Performance Profiler
```tsx
// Wrap components to measure
import { Profiler } from 'react'

<Profiler id="MyComponent" onRender={onRenderCallback}>
  <MyComponent />
</Profiler>
```

## 📚 Resources

### Documentation
- [Next.js 15 Docs](https://nextjs.org/docs)
- [Convex Docs](https://docs.convex.dev)
- [Clerk Auth Docs](https://clerk.com/docs)
- [Stripe API](https://stripe.com/docs/api)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Framer Motion](https://www.framer.com/motion/)

### Internal Docs
- `/CLAUDE.md` - AI assistant instructions
- `/CODE_PATTERNS.md` - Code examples
- `/API_REFERENCE.md` - API documentation

## 🤝 Contributing

1. Create feature branch: `git checkout -b feature/amazing-feature`
2. Follow our code style (Prettier + ESLint)
3. Write tests for new features
4. Update documentation
5. Submit PR with description

## 💡 Tips & Tricks

### VS Code Extensions
- **Tailwind CSS IntelliSense** - Autocomplete for classes
- **Prettier** - Code formatting
- **ESLint** - Linting
- **Thunder Client** - API testing
- **GitHub Copilot** - AI assistance

### Chrome Extensions
- **React Developer Tools** - Component inspection
- **Convex DevTools** - Database monitoring
- **Stripe DevTools** - Payment debugging

### Terminal Aliases
Add to your `.zshrc` or `.bashrc`:

```bash
alias dev="npm run dev"
alias convex="npx convex dev"
alias build="npm run build"
alias test="npm test"
alias lint="npm run lint"
```

## 🎯 Performance Benchmarks

Target metrics for optimal user experience:

- **First Contentful Paint**: < 1.2s
- **Largest Contentful Paint**: < 2.5s
- **Time to Interactive**: < 3.8s
- **Cumulative Layout Shift**: < 0.1
- **First Input Delay**: < 100ms

Monitor with:
```bash
npm run lighthouse  # Generate performance report
```

## 🔐 Security Best Practices

1. **Never commit secrets** - Use `.env.local`
2. **Validate all inputs** - Use Zod schemas
3. **Sanitize user content** - Prevent XSS
4. **Use HTTPS always** - Enforced in production
5. **Rate limit APIs** - Prevent abuse
6. **Encrypt sensitive data** - Medical records
7. **Audit dependencies** - `npm audit`

## 🆘 Troubleshooting

### Common Issues

**Hot reload not working?**
```bash
# Clear Next.js cache
rm -rf .next
npm run dev
```

**Type errors?**
```bash
# Regenerate types
npx convex codegen
npm run type-check
```

**Convex connection issues?**
```bash
# Check auth and restart
npx convex dev --once
npx convex dev
```

**Styles not updating?**
```bash
# Clear Tailwind cache
npm run build:css
```

## 📈 Monitoring

### Development
- Console logs for debugging
- React DevTools for component state
- Network tab for API calls

### Production
- Vercel Analytics for Web Vitals
- Sentry for error tracking
- LogRocket for session replay
- Custom OpenTelemetry traces

---

**Happy coding! 🚀** 

For questions, reach out to the team or check our internal wiki.