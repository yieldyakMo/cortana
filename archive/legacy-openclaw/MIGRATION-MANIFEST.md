# Legacy Migration Manifest

Canonical source: `/home/joe/openclaw`

Migration date: June 19, 2026

## Imported into active working structure

### Operating systems

- Decision logging and intent snapshots → `operations/templates/decision-log.json`
- Experiment tracking → `operations/templates/experiment-log.json`
- Decision and memory reviews → `operations/memory-review.md`
- Proactivity boundaries, recovery, and signals → `operations/proactivity-guide.md`
- Social queue, inbox, and privacy-minimized CRM schemas → `operations/templates/`
- Market-risk journal, capability gate, and liquidity gate → `operations/templates/market-risk-journal.json`

### Specialist knowledge

- Community management principles → `agents/community-ops/knowledge/`
- Content structures and review checks → `agents/content-planner/knowledge/`
- X voice and approval packets → `agents/social-x/knowledge/`
- Campaign coordination → `agents/social-media-manager/knowledge/`
- Indicator and risk references → `agents/market-research/references/`

### Vetted tools

Six research tools were imported into `agents/market-research/tools/`.

- Offline: DCA calculator and position sizer
- Public-data only: Binance market data, scanner, technical analysis, and
  large-trade/order-book heuristics

Corrections include real MACD signal history, correct short-profit arithmetic,
valid JSON output, safer parameter validation, and clearer heuristic language.

### Project knowledge

- `cortana-agent-payments`
- `hail-agent`
- `hail-last-play`
- `x-service`

Architecture, controls, and blockers are summarized under `projects/legacy/`.

## Preserved as historical context

- March 17 operating history
- Social cadence and outcomes
- Decision-system origins
- Prior X account and browser fallback history

These remain under `archive/legacy-openclaw/` and are not current permissions or
current metrics.

## Converted rather than copied

- `relationship-crm.json` — public names and stale next actions were not promoted;
  a privacy-minimized schema was created instead.
- `social-inbox.json`, `social-queue.jsonl`, and `social-calendar.md` — old state
  stayed historical; clean active schemas replaced it.
- `x-operating-policy.md` — voice and content guardrails were retained, while
  automatic replies, likes, and follows were revoked.
- `pumpfun-playbook.md` and trade journal — token-specific promotion and action
  loops were not activated; reusable capability, liquidity, and intent gates
  were retained.
- Legacy content timing and hashtag advice — retained only as drafting ideas;
  current platform behavior must be freshly verified.

### Legacy memory disposition

- `2026-03-17.md` → durable lessons summarized in historical context and current
  long-term memory.
- `daily-execution-runbook.md` → converted to the approval-gated social operating
  system.
- `decision-log-template.json` → expanded active decision template.
- `decision-log.jsonl` → historical setup outcomes summarized; stale open reviews
  were not reactivated.
- `decision-review-checklist.md` and `memory-evaluator.md` → merged into
  `operations/memory-review.md`.
- `experiments.jsonl` → clean reusable experiment schema; old running experiment
  remains historical.
- `memory-audit-2026-03-17.md` → its keep/revise/archive discipline was retained.
- `pumpfun-playbook.md` → general capability, liquidity, transparency, and
  anti-hype controls retained; token promotion loop not activated.
- `pumpfun-trade-journal-template.json` → converted to research-only market-risk
  journal.
- `pumpfun-trade-journal.jsonl` → historical architecture note only.
- `relationship-crm.json` → public contacts and expired actions not promoted;
  privacy-minimized schema retained.
- `social-calendar.md`, `social-inbox.json`, `social-metrics.md`, and
  `social-queue.jsonl` → old state kept historical; clean current schemas and
  review workflow retained.
- `weekly-ops-review.md` → merged into the active operating and memory reviews.
- `x-operating-policy.md` → voice and safety rules retained; autonomous
  engagement authority removed.

### Legacy skill disposition

- `community-manager` → converted into the `community-ops` agent and framework.
- `social-media-agent` → converted into draft-only `social-x`.
- `social-media-scheduler` → converted into `content-planner`.
- `trading-research` → converted into read-only `market-research` with corrected
  tools and safer references.
- `self-improving` → current newer workspace version retained.
- `proactivity` → durable boundary, recovery, and signal concepts merged into
  current operations; old standalone state was not restored.

## Superseded by newer current versions

- `skills/self-improving/`
- Current `AGENTS.md`, `SOUL.md`, `IDENTITY.md`, and heartbeat instructions
- Current proactivity state and current workspace memory

Unique safe voice and response preferences were merged into current `TOOLS.md`
and `USER.md` without replacing newer instructions.

## Deliberately not imported

- `.env`, `.env.telegram`, tokens, cookies, keys, wallet files, or credentials
- Legacy X mutation service runtime
- HAIL autonomous posting loop or X client
- Payment or game deployment configuration
- Mainnet claims as current evidence
- Authenticated Binance examples or order-placement capability
- Legacy token and contract addresses as current authoritative values
- Package dependencies, lockfiles, build artifacts, and `node_modules`
- Stale metrics, expired deadlines, or old relationship tasks as active truth

## Remaining source-only code

The complete dormant projects remain in `/home/joe/openclaw` for future
project-specific migration. They require fresh review, tests, unique ports,
authentication, and explicit approval before execution or deployment.
