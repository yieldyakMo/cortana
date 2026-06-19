# Vetted Market Research Tools

These tools are read-only research utilities imported from the previous
OpenClaw setup.

## Offline-only

- `dca_calculator.py`
- `position_sizer.py`

## Public-data network access

- `binance_market.py`
- `market_scanner.py`
- `technical_analysis.py`
- `whale_tracker.py`

Network tools use fixed Binance public endpoints and do not read credentials or
place orders. Availability and jurisdictional restrictions may vary.

Corrections made during import:

- Proper MACD signal-line history and JSON-only output
- Correct short-position profit calculations
- Positive-input validation for DCA calculations
- Symbol, interval, limit, depth, and percentile validation
- Correct bid/ask table columns
- Clear heuristic language for large-trade and order-book analysis

Outputs are research artifacts, not financial advice or execution instructions.

