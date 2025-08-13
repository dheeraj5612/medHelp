# MedHelp Project Context for Claude Code

## Project Overview
MedHelp is a comprehensive healthcare SaaS platform built with Next.js 15, Convex, Stripe, and AI features.

## Specialized Expertise Areas

When working on this project, Claude should apply specialized knowledge for:

### API Development
- Next.js 15 API routes with TypeScript
- Clerk authentication and RBAC
- Stripe payment processing
- Convex database integration
- Rate limiting with Vercel KV
- Follow patterns in `/saas-app/app/api/`

### Database (Convex)
- Schema management (15+ tables)
- Real-time queries and mutations
- Healthcare data optimization
- Key tables: users, doctors, appointments, payments, consultationMessages, medicalRecords

### Payments (Stripe)
- $50 consultations
- Subscription tiers: Monthly $200/5, Quarterly $550/15, Annual $2000/60
- Webhook processing with signature verification
- Refund automation

### AI Healthcare Features
- GPT-4 symptom analysis
- Drug interaction checking
- Emergency detection
- Medical record summarization
- HIPAA compliance required

### Real-time Communication
- Pusher for consultation chat
- Message encryption
- Presence detection
- Video consultations

### UI Components
- React 19 with Shadcn UI
- Tailwind CSS
- WCAG 2.1 accessibility
- Mobile-first design

### Testing
- Vitest for unit tests (80% coverage target)
- Playwright for E2E tests
- MSW for API mocking

### Performance
- Multi-layer caching (Vercel KV, in-memory)
- Target: <100ms API responses, <3s page loads
- Circuit breaker patterns

### Security & Compliance
- HIPAA compliance mandatory
- AES-256 encryption for files
- PCI compliance for payments
- Audit logging

## Project Structure
```
saas-app/
├── app/                    # Next.js pages & API
│   ├── (public)/          # No auth required
│   ├── (authenticated)/   # Auth required
│   └── api/               # API endpoints
├── components/            # React components
├── convex/               # Backend (15+ tables)
├── features/             # Feature modules
├── lib/                  # Core utilities
├── hooks/                # Custom React hooks
└── test/                 # Test suites
```

## Key Commands
```bash
# Development
npm run dev              # Start Next.js
npx convex dev          # Start Convex

# Testing
npm test                # Run all tests
npm run test:e2e        # E2E tests
npm run test:coverage   # Coverage report

# Code Quality
npm run lint            # ESLint
npm run type-check      # TypeScript
npm run format          # Prettier
```

## Environment Variables Required
- CONVEX_* (database)
- CLERK_* (authentication)
- STRIPE_* (payments)
- OPENAI_API_KEY (AI features)
- PUSHER_* (real-time)
- VERCEL_KV_* (caching)
- VERCEL_BLOB_* (storage)

## Critical Patterns to Follow
1. Always use existing patterns in the codebase
2. Ensure HIPAA compliance for all medical data
3. Implement proper error handling with lib/errors.ts
4. Use feature flags from lib/config.ts
5. Test with missing env vars for graceful degradation

## When implementing features, consider:
- Security first (HIPAA, encryption, auth)
- Performance targets (<100ms API, <3s pages)
- Accessibility (WCAG 2.1 AA)
- Test coverage (80% minimum)
- Real-time sync capabilities