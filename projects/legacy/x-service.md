# Legacy X Service

Source: `/home/joe/openclaw/x-service`

## Intended role

A local Node service exposed endpoints for X posts, replies, likes, follows, and
mentions.

## Current disposition

Do not run or copy the runtime unchanged.

Known blockers:

- Legacy credentials are considered compromised.
- Mutation endpoints lacked authentication and an approval layer.
- No rate limiting or durable audit controls.
- The service loaded credentials from the parent environment.
- Its listener was not explicitly loopback-only.
- Port `8787` is already used by the current Cortana dashboard.

Reusable concept: a future integration should separate read-only retrieval from
mutations and require exact-action approval, authenticated local requests,
idempotency, rate limits, audit logs, fresh credentials, and a unique
loopback-only port.

