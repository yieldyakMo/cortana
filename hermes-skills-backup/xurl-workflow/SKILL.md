---
name: xurl-workflow
description: "Cortana-tested xurl auth and posting workflow for X (Twitter) on Linux, including OAuth 1.0a and OAuth 2.0 setups, 403 debugging, and filter-safe posting guardrails."
version: "1.0.0"
author: openclaw + Hermes Agent
license: MIT
platforms: [linux, macos]
prerequisites:
  commands: [xurl]
metadata:
  hermes:
    tags: [twitter, x, social-media, xurl, workflow]
---

# xurl Workflow

Cortana/OpenClaw-tested workflow for installing xurl, authenticating a fresh X developer app, and using it from Hermes-managed sessions.

---

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/xdevplatform/xurl/main/install.sh | bash
```

Preferred install location: `~/.local/bin`.

---

## Path 1: OAuth 2.0 (preferred)

### 1. Register the app (user runs outside session)

```bash
xurl auth apps add bluefire --client-id YOUR_CLIENT_ID --client-secret YOUR_CLIENT_SECRET
```

### 2. Authenticate

If port 8080 is free:

```bash
xurl auth oauth2 --app bluefire cortanabluefire.ai
```

If `/2/users/me` errors with `UsernameNotFound`, the explicit handle form fixes binding:

```bash
xurl auth oauth2 --app bluefire cortanabluefire.ai
```

### 3. Set default (both app and user)

```bash
xurl auth default bluefire
```

If auth still fails from cron or agent context, explicitly bind the user too:

```bash
xurl auth default bluefire CortanaBlueFire
```

**Critical:** OAuth can succeed while default remains the empty built-in profile. Always verify with `xurl auth status` and `xurl whoami`. If `auth status` shows the app with OAuth 2.0 under the named app but `default` remains empty, re-run the full `xurl auth default bluefire CortanaBlueFire` command.

### 4. Verify

```bash
xurl auth status
xurl whoami
```

---

## Path 2: OAuth 1.0a fallback (when port 8080 is stuck)

```bash
xurl auth apps add bluefire --client-id YOUR_CLIENT_KEY --client-secret YOUR_CLIENT_SECRET
xurl auth oauth1 --app bluefire \
  --consumer-key YOUR_CONSUMER_KEY \
  --consumer-secret YOUR_CONSUMER_SECRET \
  --access-token YOUR_ACCESS_TOKEN \
  --token-secret YOUR_TOKEN_SECRET
xurl auth default bluefire CortanaBlueFire
xurl auth status
```

Note: xurl `oauth1` flag names are:
- `--consumer-key`
- `--consumer-secret`
- `--access-token`
- `--token-secret`

Do NOT use `--access-token-secret`.

---

## Verify read access

```bash
xurl mentions -n 10
xurl timeline -n 20
xurl following -n 20
xurl user CortanaBlueFire
```

If reads work, auth is good.

---

## Verify write access

```bash
xurl post "test from xurl workflow"
xurl delete <returned_id>
```

If 403 after test post succeeds earlier, the app likely moved to Development/Production inconsistency. Re-check portal settings:
- App → Settings → App permissions = Read and Write
- Environment = Production

---

## 403 debugging checklist

Use this order when `xurl post` or `xurl reply` returns 403:
1. Verify written text does not trigger platform content filters for crypto/markets.
2. Check X developer portal: App permissions include Read and Write.
3. Check Environment = Production, not Development.
4. Check billing/credits are active on the X developer account.
5. Check whether rate limits were hit (429 means back off; if writes fail at same minute as reads, back off and retry).
6. If 403 is text-specific, rewrite shorter, avoid token names, contract tickers, or venue keywords combined with promotional framing.

---

## X content filter guardrails

Avoid phrases that trigger X’s post filters when mentioning crypto/markets:
- token names, project tickers, token addresses
- references to specific venues/mechanisms tied to token activity (DAMM v2, DLMM)
- excessive emphasis on price, yield, or return without explicit observational framing

Safe posting style:
- strategic/operational observation about systems and behavior
- remove project-specific identifiers when possible
- keep claims general, factual, and non-promotional

---

## Agent workflow rules

1. Never read, print, parse, or echo `~/.xurl` contents to chat.
2. Never ask the user to paste credentials/tokens into chat.
3. Only use `xurl auth status` and `xurl whoami` to verify credentials.
4. Before write actions, confirm the exact copy, target, objective, and risks with the user.
5. Always set default app + default user if multiple apps exist.
6. In Docker/Hermes containerized sessions, verify `HOME` because `~/.xurl` must land under the same `HOME` used by tool subprocesses.

---

## Telegram delivery pattern (from cron)

Morning briefings and alerts can be delivered directly to Telegram if the chat ID is known.

```bash
cronjob -action update \
  --job_id morning-market-briefing \
  --deliver "telegram:7934320102"
```

Verified chat ID for Joseph: `7934320102`, from `/home/joe/.openclaw/credentials/telegram-default-allowFrom.json`.

---

## Cron run verification pitfall

`cronjob run <job_id>` returning `success: true` does NOT mean the job executed. Always verify:

```bash
cronjob -action list
```

Expected after a successful run:
- `last_run_at: <timestamp>`
- `last_status: ok`

If `last_run_at` is still `null`, the scheduler did not run the job. Do not assume delivery from the API response alone.

---

## Cron scheduling pitfall: staggered offsets

When scheduling multiple recurring jobs, do not stagger with cron offsets that drift, such as `4 */6 * * *` mistakenly written. Use explicit hour lists instead to keep spacing exact:

```bash
0 0,6,12,18 * * *    # every 6h at minute 0
0 2,8,14,20 * * *    # every 6h at minute 2
0 4,10,16,22 * * *   # every 6h at minute 4
```

This avoids rate-limit collision and keeps scheduling predictable.

---

## Docker / Hermes HOME pitfall

Hermes tool subprocesses may use a different `HOME` than your interactive shell. Symptoms:
- your shell: `xurl whoami` works
- Hermes terminal: same command 401s

Diagnostic:

```bash
echo HOME=$HOME
xurl auth status
xurl whoami
```

If the Hermes shell sees no default app even when your shell does, re-authenticate with the same `HOME` Hermes uses:

```bash
HOME=/opt/data/home xurl auth oauth2 --app bluefire CortanaBlueFire
HOME=/opt/data/home xurl auth default bluefire CortanaBlueFire
```