# Cron Jobs

Canonical schedule for Cortana automation.

| Job ID | Name | Schedule | Tools |
|--------|------|----------|-------|
| `08d4234a3c5c` | Cortana X Research Sweep | every 6h at minute 4 (`0 4,10,16,22 * * *`) | terminal, file |
| `20f96cb4355d` | HTTPS/HAIL Market Snapshot | every 6h at minute 0 (`0 0,6,12,18 * * *`) | terminal, file, web |
| `891b486a2390` | Cortana Auto Reply — One Reply Per Engagement Window | every 6h at minute 2 (`0 2,8,14,20 * * *`) | terminal, file |
| `b1b30b3a0bc0` | Morning Market Briefing | daily at 08:00 EST (`0 13 * * *`) | terminal, file, web |

All jobs:
- are approval-gated for any consequential action unless explicitly noted
- output to local storage by default
- are staggered to reduce rate-limit collision

## Management

List: `cronjob -action list`
Pause: `cronjob -action pause -job_id <ID>`
Resume: `cronjob -action resume -job_id <ID>`
Remove: `cronjob -action remove -job_id <ID>`
Run manually: `cronjob -action run -job_id <ID>`
