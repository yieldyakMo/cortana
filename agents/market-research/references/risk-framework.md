# Research and Risk Framework

## Position-sizing calculation

For paper analysis:

`risk amount = account balance × risk percentage`

`units = risk amount ÷ absolute(entry − invalidation)`

This arithmetic does not authorize a trade. Account size and risk tolerance are
user-specific and must not be inferred.

## DCA analysis

DCA spreads timing risk but does not remove asset, custody, liquidity, or
drawdown risk. Compare schedules using transparent assumptions and avoid
presenting scenario outputs as forecasts.

## Capability gate

Before discussing any consequential action:

- confirm the task is research-only
- confirm data freshness and source
- identify missing permissions or context
- default to no action if state is stale or ambiguous

## Liquidity gate

For market-impact research, estimate exit slippage at the hypothetical size and
compare it with the expected edge. If liquidity cannot support the size, the
research conclusion is `skip` or `resize`, never execution.

## Heuristic language

Recent large trades and order-book imbalance indicate short-lived observable
pressure. They do not identify wallets, intent, manipulation, or future price.

