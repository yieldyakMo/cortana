# HAIL Persona Agent

Source: `/home/joe/openclaw/hail-agent`

## Architecture

- Python persona engine with policy validation, simple interaction memory,
  optional LLM drafting, and an X client.
- Dry-run mode existed, but the main loop scheduled two-hour posts and
  ten-minute mention scans.
- Policy blocked guaranteed-return language and unverified contract addresses.

## Reusable knowledge

- Separate persona, policy, drafting, memory, and platform transport.
- Validate exact copy after generation and before any proposed publication.
- Treat official-address claims as security-sensitive and freshly verify them.
- Keep low-signal bait ignorable and preserve transparent uncertainty.

## Current disposition

The autonomous loop and X client are not imported or active. Useful persona and
policy concepts belong in the social agents, where every external action remains
approval-gated.

