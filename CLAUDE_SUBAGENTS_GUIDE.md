# 🤖 MedHelp Claude Code Subagents Guide

## Quick Start

Run the setup script to configure all subagents:
```bash
./setup-claude-subagents.sh
```

## Available Subagents (19 Specialists)

### 🔧 Core Development
- **@medhelp-api** - Next.js API routes, auth, rate limiting
- **@convex-backend** - Database schema, queries, real-time sync
- **@ui-components** - React components, Shadcn UI, accessibility
- **@testing-qa** - Unit/integration/E2E tests, 80% coverage

### 💰 Business Features
- **@stripe-payments** - Payments, subscriptions, refunds, webhooks
- **@appointment-scheduler** - Booking, queue management, availability
- **@notification-system** - Email/SMS/push notifications
- **@analytics-insights** - Metrics, dashboards, business intelligence

### 🏥 Healthcare Specific
- **@ai-health-features** - Symptom checker, drug interactions, GPT-4
- **@medical-records** - Secure storage, encryption, HIPAA compliance
- **@realtime-chat** - Consultation chat, presence, video calls

### ⚡ Performance & Infrastructure
- **@performance-optimizer** - Caching, Core Web Vitals, resilience
- **@devops-deployment** - Vercel/Convex deploy, CI/CD, monitoring
- **@pwa-mobile** - PWA features, offline mode, mobile optimization

### 🔒 Security & Quality
- **@security-compliance** - HIPAA, encryption, auth, PCI compliance
- **@code-reviewer** - Code quality, patterns, best practices
- **@bug-investigator** - Debugging, root cause analysis, troubleshooting
- **@database-migrations** - Schema updates, data migrations

### 📚 Documentation
- **@documentation** - Technical docs, API docs, guides

## Usage Examples

### Creating a New API Endpoint
```
User: @medhelp-api Create a new endpoint to fetch patient appointment history
```

### Implementing Payment Features
```
User: @stripe-payments Add support for partial refunds with admin approval
```

### Building UI Components
```
User: @ui-components Create an accessible doctor profile card component
```

### Writing Tests
```
User: @testing-qa Write E2E tests for the appointment booking flow
```

### Debugging Production Issues
```
User: @bug-investigator Users report payments failing intermittently
```

### Performance Optimization
```
User: @performance-optimizer The appointments page is loading slowly
```

### Security Audit
```
User: @security-compliance Review the medical records upload feature for HIPAA compliance
```

## Best Practices

### 1. Use Multiple Agents for Complex Tasks
```
User: @medhelp-api @stripe-payments @testing-qa 
Implement a new subscription upgrade API with payment processing and tests
```

### 2. Always Review After Major Changes
```
User: @code-reviewer Review the changes we just made to the payment system
```

### 3. Debug Before Fixing
```
User: @bug-investigator Investigate why real-time chat messages are delayed
```

### 4. Document As You Go
```
User: @documentation Update the API docs for the new endpoints we created
```

## Common Workflows

### New Feature Development
1. Design with `@ui-components`
2. Implement backend with `@convex-backend`
3. Create API with `@medhelp-api`
4. Add tests with `@testing-qa`
5. Review with `@code-reviewer`
6. Document with `@documentation`

### Payment Implementation
1. Design flow with `@stripe-payments`
2. Add UI with `@ui-components`
3. Test with `@testing-qa`
4. Ensure compliance with `@security-compliance`

### Performance Issues
1. Investigate with `@bug-investigator`
2. Optimize with `@performance-optimizer`
3. Add caching if needed
4. Monitor with `@devops-deployment`

### Production Bug
1. Investigate with `@bug-investigator`
2. Fix with appropriate specialist
3. Add tests with `@testing-qa`
4. Deploy with `@devops-deployment`

## Agent Capabilities

### medhelp-api
- Next.js 15 API routes
- Clerk authentication
- Rate limiting
- Error handling
- Edge runtime optimization

### convex-backend
- Schema management (15+ tables)
- Real-time queries/mutations
- Index optimization
- Data migrations

### stripe-payments
- $50 consultations
- Subscription tiers ($200/550/2000)
- Webhook processing
- Refund automation
- PCI compliance

### ai-health-features
- GPT-4 symptom analysis
- Drug interactions
- Emergency detection
- Medical summaries
- HIPAA compliance

### realtime-chat
- Pusher integration
- Encrypted messages
- File sharing
- Video consultations
- Presence detection

### ui-components
- React 19 + Shadcn UI
- Tailwind CSS
- Accessibility (WCAG 2.1)
- Mobile-first design
- Loading states

### testing-qa
- Vitest unit tests
- Playwright E2E
- MSW mocking
- 80% coverage target
- Performance benchmarks

### performance-optimizer
- Multi-layer caching
- Bundle optimization
- Circuit breakers
- <100ms API response
- 100 Lighthouse score

### devops-deployment
- Vercel multi-region
- Convex deployment
- GitHub Actions CI/CD
- OpenTelemetry monitoring
- Zero-downtime deploys

### security-compliance
- HIPAA compliance
- AES-256 encryption
- RBAC implementation
- Audit logging
- Security headers

## Project Structure Reference

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
├── test/                 # Test suites
└── types/                # TypeScript types
```

## Environment Variables

Required for full functionality:
- Convex (database)
- Clerk (authentication)
- Stripe (payments)
- OpenAI (AI features)
- Pusher (real-time)
- Vercel KV (caching)
- Vercel Blob (storage)

## Key Commands

```bash
# Development
npm run dev              # Start Next.js
npx convex dev          # Start Convex

# Testing
npm test                # Run all tests
npm run test:e2e        # E2E tests
npm run test:coverage   # Coverage report

# Quality
npm run lint            # ESLint
npm run type-check      # TypeScript
npm run format          # Prettier

# Deployment
npm run build           # Production build
npx convex deploy       # Deploy Convex
npm run vercel:deploy   # Deploy to Vercel
```

## Tips

1. **Always check CLAUDE.md** for project-specific patterns
2. **Use CODE_PATTERNS.md** for copy-paste examples
3. **Review DEVELOPER_GUIDE.md** for onboarding
4. **Check feature flags** in lib/config.ts
5. **Test with missing env vars** to ensure graceful degradation

## Need Help?

- Use `@bug-investigator` for any issues
- Use `@documentation` to find information
- Use `@code-reviewer` to validate approaches
- Combine multiple agents for complex tasks

---

*Last updated: January 2025*
*19 specialized subagents configured for MedHelp healthcare platform*