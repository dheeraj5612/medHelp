#!/bin/bash

# MedHelp Project Status Line for Claude Code
# Displays relevant project context and expertise areas

# Get current git branch
BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Check which part of the codebase we're working in
CWD=$(pwd)
if [[ "$CWD" == *"/api"* ]]; then
    FOCUS="🔧 API"
elif [[ "$CWD" == *"/convex"* ]]; then
    FOCUS="🗄️ DB"
elif [[ "$CWD" == *"/components"* ]]; then
    FOCUS="🎨 UI"
elif [[ "$CWD" == *"/test"* ]]; then
    FOCUS="🧪 Tests"
else
    FOCUS="🏥 MedHelp"
fi

# Output status line
echo "$FOCUS [$BRANCH] | API • Convex • Stripe • AI • Chat • UI • Tests • Perf • Security | Use CLAUDE.md for context"