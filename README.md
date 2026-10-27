# seed4j-plugin

Claude Code plugin that makes [Seed4J](https://github.com/seed4j/seed4j) agent-first.

It relies on the [`seed4j-cli`](https://github.com/seed4j/seed4j-cli) npm package and adds no generation logic of its own:

- a `SessionStart` hook tells the agent, read-only, whether the CLI is available, whether the project is a Seed4J
  project, and whether the `seed4j-cli` skill and the `ai-context` files are installed;
- a `seed4j` skill routes each request: technical capabilities go to the skill installed by `seed4j skill install`,
  business features go to the `ai-context` module and its `hexagonal-feature` skill.

Claude Code does not discover skills under `.agents/skills/`; this plugin bridges them.

## Prerequisites

```bash
npm install -g seed4j-cli   # requires Java 25+
```

## Install

```text
/plugin marketplace add vmartowicz/seed4j-plugin
/plugin install seed4j@seed4j-plugin
```

## Local development

```bash
claude plugin validate .
claude --plugin-dir /path/to/seed4j-plugin
```

## Typical session

1. Start a session: the hook reports the Seed4J state.
2. "Create a Maven, Spring Boot and PostgreSQL project": modules are planned and applied through `seed4j-cli`.
3. "Add book loans with limits and fines": `ai-context` is proposed and applied, then `hexagonal-feature` is followed.
