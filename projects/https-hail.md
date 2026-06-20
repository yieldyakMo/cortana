# HTTPS / HAIL Research Focus

Status: primary market-research focus.

## Assets

- HTTPS
  - Name: had to take profits sir
  - Mint: `7sGdNQSvUGpahh6qyXB3g5gsdK9FAzZM299KyCXspump`
- HAIL
  - Name: Hail Mary
  - Mint: `CZV1Z24oDCDodMUA5saUfDy7T2kE7YxSid2JEbDopump`

## Primary pool

- Meteora DAMM v2:
  `HJW8UpHGTNsiSzkYRTZd5pyRMqJqn26c1oFk2sSTbQ9h`
- URL:
  `https://www.meteora.ag/dammv2/HJW8UpHGTNsiSzkYRTZd5pyRMqJqn26c1oFk2sSTbQ9h?referrer=portfolio`

Joseph reports a large position in this pair. Do not infer or store its wallet,
position address, size, cost basis, or fee totals unless Joseph explicitly
provides them.

## Joseph's public wallet and market views

- Public wallet:
  `26zpgxSgGEd73KSNZzbfmBKPjLskYvZLBt6RdYPaCwum`
- HTTPS/HAIL Birdeye pool view:
  `https://birdeye.so/solana/token/CZV1Z24oDCDodMUA5saUfDy7T2kE7YxSid2JEbDopump/HJW8UpHGTNsiSzkYRTZd5pyRMqJqn26c1oFk2sSTbQ9h?tab=trades&trades_layout=table`
- HAIL/SOL Birdeye pool view:
  `https://birdeye.so/solana/token/CZV1Z24oDCDodMUA5saUfDy7T2kE7YxSid2JEbDopump/9vqnh13X4DzMq8evJps5XZaELqg8E7V7S92efmgo1J5B?tab=trades&trades_layout=table`
- HTTPS/SOL Birdeye token view:
  `https://birdeye.so/solana/token/7sGdNQSvUGpahh6qyXB3g5gsdK9FAzZM299KyCXspump?tab=trades&trades_layout=table`

The HTTPS/SOL URL does not pin a pool account in its path. Treat it as a
token-level/default-market view until a specific HTTPS/SOL pool address is
identified. Do not combine its trades or liquidity with a specific pool
without confirming Birdeye's selected market.

## Research priorities

1. Relative price: HTTPS per HAIL and HAIL per HTTPS.
2. Independent SOL/USD markets for each token to detect pool divergence.
3. Pool reserves, active liquidity, fee rate, volume, fees, and position share
   when reliable Meteora data is available.
4. LP inventory drift and impermanent-loss scenarios versus holding both assets.
5. Exit-liquidity and slippage at several hypothetical position sizes.
6. Holder concentration, mint/freeze authorities, token-account changes, and
   suspicious liquidity movements.
7. Trading activity, volatility, market depth, and cross-venue arbitrage gaps.
8. Project developments, social traction, contract/address claims, and material
   security events for HTTPS and HAIL.

## Current safety posture

- Research, scenario analysis, and public commentary are permitted.
- No swaps, deposits, withdrawals, rebalancing, claims, or wallet connections.
- No price or return guarantees.
- Timestamp every live snapshot and identify unavailable fields.
- Distinguish DAMM v2 pool data from DLMM terminology and mechanics.

## Verified baseline — 2026-06-19 20:12 UTC

- Pool account owner:
  `cpamdpZCGKUy5JxQXB4dcpGPiikHawvSWAd6mEn1sGG`
- Meteora's official DAMM v2 source declares the same CP-AMM program ID.
- Both mints use Token-2022.
- HTTPS:
  - decimals: 6
  - supply: `999,462,168.108326`
  - mint authority: none
  - freeze authority: none
  - metadata update authority: none
- HAIL:
  - decimals: 6
  - supply: `838,855,762.363488`
  - mint authority: none
  - freeze authority: none
  - metadata update authority: none
- Dexscreener snapshot:
  - pool ratio: approximately `13.6175 HAIL per HTTPS`
  - HTTPS/SOL reference price: approximately `$0.0001136`
  - HAIL/SOL reference price: approximately `$0.000008326`
  - HTTPS primary PumpSwap liquidity: approximately `$40,967`
  - HAIL primary PumpSwap liquidity: approximately `$6,840`

Dexscreener showed transactions for the DAMM v2 pool but reported zero volume
and no liquidity value. Treat its DAMM v2 pool accounting as incomplete; do not
use those missing fields to estimate Joseph's position or fee yield.

## Address verification — 2026-06-19 20:18 UTC

Public Solana RPC at slot `427577356` returned:

- Wallet `26zpg...Cwum`: system-owned, zero-data account.
- HTTPS/HAIL pool `HJW8...bQ9h`: owned by DAMM v2 program
  `cpamdpZCGKUy5JxQXB4dcpGPiikHawvSWAd6mEn1sGG`.
- HAIL/SOL pool `9vqnh...1J5B`: owned by program
  `pAMMBay6oceH9fJKBRHGP5D4bD4sWpmSwMn52FMfXEA`.

## Data-source order

1. Solana account state and official Meteora interfaces/documentation.
2. Meteora pool UI/API data.
3. Independent market aggregators such as Dexscreener for cross-checking.
4. Project-owned public channels for announcements, treated as claims until
   independently verified.
