# Cron Jobs

Canonical schedule for Cortana automation.

| Job ID | Name | Schedule | Tools |
|--------|------|----------|-------|
| `08d4234a3c5c` | Cortana X Research Sweep | every 6h at minute 4 (`4 */6 * * *`) | terminal, file |
| `20f96cb4355d` | HTTPS/HAIL Market Snapshot | every 6h at minute 0 (`0 */6 * * *`) | terminal, file, web |
| `891b486a2390` | Cortana Auto Reply — One Reply Per Engagement Window | every 6h at minute 2 (`2 */6 * * *`) | terminal, file |

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
