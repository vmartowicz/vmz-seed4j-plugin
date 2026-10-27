#!/usr/bin/env bash
# Read-only diagnostic: its output is added to the agent context. Never mutates the project.
# Does not call `seed4j --version` on purpose: it starts a JVM on every session.

if ! command -v seed4j >/dev/null 2>&1; then
  echo "[seed4j] seed4j-cli is not installed. If the user wants Seed4J, suggest: npm install -g seed4j-cli (requires Java 25+). Do not install it yourself."
  exit 0
fi

echo "[seed4j] seed4j-cli is available. Use the seed4j skill for any Seed4J request."

if [ -d .seed4j ]; then
  echo "[seed4j] Seed4J project detected (.seed4j/)."
fi

if [ -f .agents/skills/seed4j-cli/SKILL.md ]; then
  echo "[seed4j] seed4j-cli skill installed: .agents/skills/seed4j-cli/SKILL.md"
else
  echo "[seed4j] seed4j-cli skill not installed in this project: suggest 'seed4j skill install' before using Seed4J."
fi

if [ -f .agents/context.md ]; then
  echo "[seed4j] ai-context applied: read .agents/context.md before writing business code."
fi

exit 0
