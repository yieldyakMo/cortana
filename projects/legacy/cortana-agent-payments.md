# Cortana Agent Payments

Source: `/home/joe/openclaw/cortana-agent-payments`

## Architecture

- TypeScript/Express and Next.js prototypes for payment-gated agent services.
- Server creates an unsigned Solana payment transaction.
- The user signs through a wallet.
- Server verifies the payment before unlocking service functionality.
- Original price default was 0.1 SOL with a one-hour invoice window.

## Reusable design

- Keep signing in the user's wallet; never custody private keys.
- Verify payment server-side before granting access.
- Validate wallet addresses, amounts, memo values, and time windows.
- Treat invoice creation and verification as separate operations.

## Blockers before reuse

- Legacy port `8787` conflicts with the current Cortana dashboard.
- Express prototype uses broad CORS and does not explicitly bind loopback.
- Authentication, replay protection, abuse limits, idempotency, and durable
  invoice state require review.
- Mainnet dependencies and SDK behavior must be freshly verified.
- No deployment or payment flow is approved by this import.

