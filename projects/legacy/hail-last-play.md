# HAIL — The Last Play

Source: `/home/joe/openclaw/hail-last-play`

## Architecture snapshot

- Solana Anchor game scaffold with instant and weekly modes.
- Economic split recorded as 33% burn and 67% pot funding.
- Main-pot buffer and payout caps were designed to constrain instant payouts.
- Weekly resolution used a committed participant PDA, VRF authority checks,
  fixed winner count, claim bitmap, and per-wallet payout cap.
- UI included wallet connection, play/claim flows, stats, and periodic reads.

## Durable controls

- Admin and upgrade authority should be multisig-controlled.
- VRF authority must be independently protected and rotatable.
- Participant snapshots must be committed and locked before resolution.
- Claims need duplicate/default-address rejection and double-claim protection.
- Monitoring should cover pot balances, burn deltas, unresolved requests,
  delayed rounds, claims, and unauthorized authority attempts.
- Incident response starts by halting UI actions, snapshotting state, and
  auditing instructions.

## Unresolved readiness items

- Mainnet evidence is dated February 18, 2026 and must be rerun.
- Multisig and upgrade-authority controls were incomplete.
- Incident response had not been rehearsed.
- Weekly entry-limit, wrong-week, and concurrency tests remained incomplete.
- UI documentation reported placeholder/final-IDL wiring concerns.

This project is historical and not approved for deployment or value transfer.

