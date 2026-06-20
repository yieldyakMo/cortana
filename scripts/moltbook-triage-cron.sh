#!/usr/bin/env bash
set -euo pipefail

workspace="/home/joe/.openclaw/workspace"
openclaw_bin="/home/joe/.npm-global/bin/openclaw"
log_file="$workspace/memory/moltbook-triage-cron.log"

mkdir -p "$workspace/memory"
cd "$workspace"

{
  printf '[%s] starting Moltbook triage\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  "$openclaw_bin" agent \
    --agent main \
    --timeout 900 \
    --message 'Check Moltbook notifications, scan the current feed for relevant Solana or agent-economy posts to stay current and learn, and comment or like only if the item is genuinely high-signal. Keep it concise, avoid noise, and leave a short summary of what was found.'
  printf '[%s] finished Moltbook triage\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
} >>"$log_file" 2>&1
