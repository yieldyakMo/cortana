#!/usr/bin/env bash
set -u

workspace="/home/joe/.openclaw/workspace"
credentials="$HOME/.config/moltbook/credentials.json"
state_file="$workspace/memory/heartbeat-state.json"
now="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

if ! command -v curl >/dev/null || ! command -v jq >/dev/null; then
  echo "ALERT: Heartbeat check requires curl and jq."
  exit 0
fi

if [ ! -r "$credentials" ]; then
  echo "ALERT: Moltbook credentials are unavailable."
  exit 0
fi

api_key="$(jq -r '.api_key // empty' "$credentials")"
if [ -z "$api_key" ]; then
  echo "ALERT: Moltbook API key is missing."
  exit 0
fi

home_json="$(mktemp)"
status_json="$(mktemp)"
next_state="$(mktemp)"
trap 'rm -f "$home_json" "$status_json" "$next_state"' EXIT

if ! home_code="$(curl --silent --show-error --max-time 20 \
  --output "$home_json" --write-out '%{http_code}' \
  --header "Authorization: Bearer $api_key" \
  https://www.moltbook.com/api/v1/home 2>/dev/null)"; then
  home_code="000"
fi
if ! status_code="$(curl --silent --show-error --max-time 20 \
  --output "$status_json" --write-out '%{http_code}' \
  --header "Authorization: Bearer $api_key" \
  https://www.moltbook.com/api/v1/agents/status 2>/dev/null)"; then
  status_code="000"
fi

previous_failures=0
previous_unread=""
if [ -r "$state_file" ]; then
  previous_failures="$(jq -r '.moltbookFailureCount // 0' "$state_file" 2>/dev/null || printf '0')"
  previous_unread="$(jq -r '.moltbookUnreadCount // empty' "$state_file" 2>/dev/null || true)"
fi

if [ "$home_code" != "200" ] || [ "$status_code" != "200" ]; then
  failures=$((previous_failures + 1))
  jq -n \
    --arg checked "$now" \
    --argjson failures "$failures" \
    --arg homeCode "$home_code" \
    --arg statusCode "$status_code" \
    '{
      lastMoltbookCheck: $checked,
      moltbookFailureCount: $failures,
      moltbookLastHomeCode: $homeCode,
      moltbookLastStatusCode: $statusCode
    }' >"$next_state"
  if [ -r "$state_file" ]; then
    jq -s '.[0] * .[1]' "$state_file" "$next_state" >"$next_state.merged" &&
      mv "$next_state.merged" "$state_file"
  else
    mv "$next_state" "$state_file"
  fi
  if [ "$failures" -ge 2 ]; then
    echo "ALERT: Moltbook checks failed twice consecutively (home $home_code, status $status_code)."
  else
    echo "HEARTBEAT_OK"
  fi
  exit 0
fi

unread="$(jq -r '.your_account.unread_notification_count // 0' "$home_json")"
karma="$(jq -r '.your_account.karma // 0' "$home_json")"
account="$(jq -r '.your_account.name // "unknown"' "$home_json")"
claim_status="$(jq -r '.status // "unknown"' "$status_json")"

jq -n \
  --arg checked "$now" \
  --arg account "$account" \
  --arg claimStatus "$claim_status" \
  --argjson unread "$unread" \
  --argjson karma "$karma" \
  '{
    lastMoltbookCheck: $checked,
    moltbookFailureCount: 0,
    moltbookAccount: $account,
    moltbookClaimStatus: $claimStatus,
    moltbookUnreadCount: $unread,
    moltbookKarma: $karma,
    moltbookLastHomeCode: "200",
    moltbookLastStatusCode: "200"
  }' >"$next_state"

if [ -r "$state_file" ]; then
  jq -s '.[0] * .[1]' "$state_file" "$next_state" >"$next_state.merged" &&
    mv "$next_state.merged" "$state_file"
else
  mv "$next_state" "$state_file"
fi

if [ "$claim_status" != "claimed" ]; then
  echo "ALERT: Moltbook account status changed to $claim_status."
elif [ -n "$previous_unread" ] && [ "$unread" -gt "$previous_unread" ]; then
  new_count=$((unread - previous_unread))
  echo "ALERT: Moltbook has $new_count new unread notification(s); $unread total."
else
  echo "HEARTBEAT_OK"
fi
