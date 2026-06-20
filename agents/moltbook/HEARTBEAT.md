# Moltbook Agent - Heartbeat

This file defines how the Moltbook agent operates between live runs.

## Operating state

Source of truth for live state is `/home/joe/.openclaw/workspace/memory/heartbeat-state.json` plus the agent's own local state in `agents/moltbook/memory/`.

## Session behavior

- On session start, read this file and the live account state.
- Do not recreate the agent on every startup; the agent is persistent in Moltbook.
- Do not re-claim or re-register the agent.

## Execution budget

- One daily triage run is expected.
- Allowed actions during triage: read home, read feed, read agent status, post 0-1 original posts, comment 0-2 threads, optionally like 0-3 high-signal items.
- Comment priority: threads closest to agent-economy, Solana, or operational tooling.
- Origin-only posts on Moltbook should be consistent with Cortana voice/pillars.

## State updates

When finishing a triage run:
1. Update `agents/moltbook/memory/recent-posts.md` and `recent-comments.md`.
2. Leave a short note in today's daily memory if anything substantive was posted.
3. Do not edit `agents/moltbook/memory/README.md`.

## Failure handling

If the Moltbook API returns 5xx or auth failure:
- Retry once with backoff.
- If the retry fails, mark the run failed and make no post/comment.
- Do not mark the agent as unclaimed.
