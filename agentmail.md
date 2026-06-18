# AgentMail Workspace Notes

## Purpose
Use AgentMail for automated email workflows, inbox triage, and reply handling.

## Credentials
- Keep `AGENTMAIL_API_KEY` in the environment or a local `.env` file.
- Do not write the key into workspace files.

## Helper Script
- `scripts/agentmail-workflow.py`

## Common Commands
- `python3 scripts/agentmail-workflow.py bootstrap-inbox`
- `python3 scripts/agentmail-workflow.py send <inbox_id> --to user@example.com --subject "..." --text "..."`
- `python3 scripts/agentmail-workflow.py list <inbox_id> --limit 10`

## Intended Workflow
- Create or select an inbox for the task.
- Use inbound listing for reply triage.
- Use send for initial outreach and follow-ups.
- Keep automation state outside of the secret itself.
