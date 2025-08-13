# Setting Up Claude Code Status Line for MedHelp

## Why Custom Agents Don't Appear in Status Line

Claude Code **doesn't support custom agents** in the traditional sense. The agents system is built-in and limited to:
- `general-purpose` - For research and multi-step tasks
- `statusline-setup` - For configuring status line
- `output-mode-setup` - For output modes

Your custom "agents" (medhelp-api, convex-backend, etc.) **cannot be registered** as actual agents.

## What You CAN Do: Custom Status Line

I've created a custom status line that shows your project context:

### 1. Status Line Script Created
`statusline.sh` - Shows:
- Current focus area based on directory
- Git branch
- Available expertise areas
- Reminder to use CLAUDE.md

### 2. To Enable the Status Line

Run this command in Claude Code:
```
/settings
```

Then add this to your settings:
```json
{
  "statusLine": {
    "type": "command",
    "command": "/Users/dheerajnamburu/source/medHelp/statusline.sh"
  }
}
```

### 3. Alternative: Use Task Tool

You can also use the Task tool to configure the status line:
```
Use the statusline-setup agent to configure my status line with /Users/dheerajnamburu/source/medHelp/statusline.sh
```

## What the Status Line Shows

- **Dynamic Focus**: Changes based on current directory (API, DB, UI, Tests)
- **Git Branch**: Shows current branch
- **Expertise Areas**: Quick reminder of available specializations
- **Context Reminder**: Points to CLAUDE.md for full context

## How to Use Your "Agents" Without Registration

Since custom agents aren't supported, use these approaches:

### 1. Reference Expertise in Requests
```
"Following our Stripe payment patterns, implement refund processing"
"Using Convex best practices, create a new mutation for appointments"
```

### 2. Use CLAUDE.md Context
The CLAUDE.md file is automatically read and provides all your specialized context.

### 3. Use General-Purpose Agent with Specific Instructions
```
Use the general-purpose agent to implement a Stripe webhook handler following our payment patterns in app/api/stripe/
```

## Summary

- ❌ Custom agents can't be registered in Claude Code
- ✅ Custom status line can show project context
- ✅ CLAUDE.md provides automatic context
- ✅ Reference expertise areas in your prompts
- ✅ Use Task tool with general-purpose agent for complex tasks