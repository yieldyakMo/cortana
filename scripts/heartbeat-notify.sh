#!/usr/bin/env bash
set -u

workspace="/home/joe/.openclaw/workspace"
result="$("$workspace/scripts/heartbeat-check.sh")"
telegram_target="${OPENCLAW_TELEGRAM_TARGET:-}"

if [[ "$result" == ALERT:* ]]; then
  if [ "${OPENCLAW_HEARTBEAT_DRY_RUN:-0}" = "1" ]; then
    printf '%s\n' "$result"
    exit 0
  fi
  if [ -z "$telegram_target" ]; then
    echo "Heartbeat alert was not delivered: OPENCLAW_TELEGRAM_TARGET is unset." >&2
    exit 1
  fi
  openclaw message send \
    --channel telegram \
    --account default \
    --target "$telegram_target" \
    --message "$result" >/dev/null
fi
