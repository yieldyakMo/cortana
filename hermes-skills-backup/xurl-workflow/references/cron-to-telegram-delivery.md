# cron-to-telegram delivery

Apply for any briefing or watch job whose output must reach Telegram.

## Chat ID

- Source of truth: `/home/joe/.openclaw/credentials/telegram-default-allowFrom.json`
- Target value: a chat ID from the allowlist.

## Job definition

When scheduling a cron job with Hermes:
- job_id: unique id for the briefing
- schedule: cron expression for exact delivery timing
- deliver: `telegram:<chat_id>` to push results to Telegram; keep `local` for debugging
- enabled_toolsets: terminal, file, web
- prompt: concise structured briefing instructions with explicit no-guarantees/no-trade framing

## Telegram config guardrail

Hermes config should have `telegram` registered with an `_token` secret. Do not read, print, or echo that token. If a new session cannot deliver to Telegram, resolve bot/token state first and only then create the cron job.

## Test pattern

After creating, verify with `cronjob -action run -job_id <ID>` if supported, then confirm delivery in Telegram rather than only checking local cache.
