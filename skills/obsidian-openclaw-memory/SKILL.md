---
name: "obsidian-openclaw-memory"
description: "Set up Obsidian and OpenClaw memory workflows for this workspace."
---

# Obsidian + OpenClaw Memory System

Use when setting up or maintaining the OpenClaw workspace as a durable memory system. The goal is to keep current context in files, make it easy to browse in Obsidian, and keep the agent’s proactive memory maintenance lightweight and reproducible.

## Workspace Layout

Treat `/home/joe/.openclaw/workspace` as the source of truth.

Core files:
- `MEMORY.md` for curated long-term memory
- `memory/YYYY-MM-DD.md` for raw daily logs
- `proactivity/session-state.md` for current objective, blocker, and next move
- `proactivity/memory.md` for durable proactive rules
- `HEARTBEAT.md` for short recurring checks
- `AGENTS.md`, `SOUL.md`, `USER.md`, `IDENTITY.md`, `TOOLS.md` for operating context
- `second-brain/` for structured notes, journal entries, and documents

## Obsidian Setup

1. Open `/home/joe/.openclaw/workspace` as the vault.
2. Keep the memory files at the vault root so Graph View can connect them naturally.
3. Use `memory/` for daily notes.
4. Use `second-brain/` for durable topic notes and project docs.
5. Add wiki-links between related notes when a stable connection matters.

Suggested daily note template:
```md
# <% tp.date.now("YYYY-MM-DD") %>

## Session Log

## Decisions Made

## Things to Remember
```

Suggested Dataview query:
```dataview
LIST FROM "memory" SORT file.name DESC LIMIT 7
```

## Memory Maintenance Workflow

1. Read the newest `memory/YYYY-MM-DD.md` files.
2. Distill only durable facts into `MEMORY.md`.
3. Keep `MEMORY.md` short and current.
4. Put reusable workflow lessons into `proactivity/memory.md` or a focused `second-brain/` note.
5. Update `proactivity/session-state.md` with the current blocker and next move when a task is active.

## Optional Semantic Search

If `qmd` is installed, index the workspace and use it to find older notes quickly.

Example:
```bash
qmd collection add /home/joe/.openclaw/workspace --name openclaw-workspace
qmd embed
```

If `qmd` is not available, fall back to direct file reads and `rg` searches.

## Best Practices

- Write important things to files, not just chat.
- Keep daily logs raw and cheap.
- Keep `MEMORY.md` curated and high-signal.
- Use `second-brain/` for anything that should outlive the current session.
- Prefer deterministic scripts for repeatable maintenance.
- Avoid hardcoding `~/clawd`; this workspace already has its own path and structure.

## Suggested Validation

- Confirm the vault opens on `/home/joe/.openclaw/workspace`.
- Confirm `MEMORY.md`, `memory/`, and `HEARTBEAT.md` are visible in Obsidian.
- Confirm the agent can read and update the files it depends on.
- If using `qmd`, confirm the workspace index returns the expected notes.
