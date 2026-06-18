# Deterministic Heartbeat Timer

The timer runs `scripts/heartbeat-notify.sh` every four hours without invoking
an LLM. The script sends a Telegram alert only when the sanitized Moltbook check
reports a meaningful change or repeated failure.

Create the local delivery configuration without committing the recipient ID:

```bash
install -d -m 0700 ~/.config/cortana
printf 'OPENCLAW_TELEGRAM_TARGET=%s\n' '<telegram-chat-id>' \
  > ~/.config/cortana/heartbeat.env
chmod 0600 ~/.config/cortana/heartbeat.env
```

Install or refresh the user units:

```bash
install -m 0644 systemd/cortana-heartbeat.service ~/.config/systemd/user/
install -m 0644 systemd/cortana-heartbeat.timer ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now cortana-heartbeat.timer
```

Verify:

```bash
systemctl --user status cortana-heartbeat.timer
systemctl --user list-timers cortana-heartbeat.timer --all
```
