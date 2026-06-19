# Specialist-Agent Orchestration

## Purpose

Coordinate Cortana and the five isolated specialists as one team without
granting autonomous external authority.

The operating model is hub-and-spoke:

- Cortana is the intake owner, router, integrator, and final reviewer.
- Social Command coordinates social campaigns and consolidates social outputs.
- Narrative Architect owns editorial structure, sequencing, and adaptation.
- X Signal owns X-specific conversation research and exact drafts.
- Community Steward owns community health, onboarding, and moderation planning.
- Market Intelligence owns read-only market facts, calculations, scenarios, and
  risk validation.

Specialists do not compete for control, independently contact Joseph, or take
external action.

## Standard workflow

1. **Intake**
   - Cortana identifies the objective, audience, scope, constraints, freshness
     requirements, approval boundary, and success condition.
   - Cortana creates a work packet under `operations/agent-jobs/<job-id>/`.

2. **Routing**
   - Delegate only when specialist expertise materially improves the result.
   - Run independent assignments in parallel.
   - Keep dependent assignments sequential. For example, market facts may need
     verification before a social draft can safely use them.
   - Social Command is included for campaign-level work, not every isolated
     draft or research request.

3. **Specialist work**
   - Each specialist receives the same canonical brief plus a bounded
     assignment.
   - Specialists return the standard handoff format.
   - They identify conflicts, missing evidence, and blocked dependencies rather
     than silently inventing context.

4. **Integration**
   - Social Command consolidates campaign outputs when social strategy is in
     scope.
   - Cortana resolves conflicting recommendations, verifies critical claims,
     removes duplication, and preserves dissent when uncertainty is material.

5. **Approval**
   - Cortana returns one compact approval packet to Joseph.
   - Exact external copy, destination, timing, assumptions, and risks must be
     visible.
   - Drafts remain drafts until Joseph explicitly approves them.

6. **Outcome review**
   - After an approved action is performed elsewhere, record the observable
     outcome and lesson in the work packet.
   - Update durable agent memory only when the result is concrete and reusable.

## Routing matrix

| Work type | Lead | Supporting specialists |
| --- | --- | --- |
| Social campaign | Social Command | Narrative Architect, X Signal, Community Steward, Market Intelligence when claims require validation |
| Editorial calendar | Narrative Architect | Social Command for priorities, X Signal for X adaptations |
| X post or reply | X Signal | Market Intelligence for market claims, Social Command for campaign alignment |
| Community plan or incident | Community Steward | Social Command for public positioning |
| Market or liquidity research | Market Intelligence | Cortana for synthesis; social specialists only after facts are validated |
| Mixed strategic request | Cortana | Any specialists whose expertise materially changes the answer |

## Conflict rules

- Evidence beats confidence.
- Fresh verified data beats stale memory.
- Security, privacy, and approval boundaries beat speed.
- Platform fit may change presentation but not factual meaning.
- When specialists disagree materially, Cortana reports the disagreement and
  its practical consequence instead of manufacturing consensus.

## Authority boundaries

This protocol authorizes internal analysis, drafting, and workspace records
only. It does not authorize publishing, messaging, moderation, scheduling,
credential access, financial transactions, wallet activity, or trade execution.
