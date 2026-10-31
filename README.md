# ANTI-GARDE Store

Cloudflare Worker + D1 starter for the ANTI-GARDE Taiwan storefront.

## Structure
- `src/index.js`: Worker API and signed HttpOnly admin session.
- `schema.sql`: D1 database schema.
- `public/admin/index.html`: private admin UI (API-protected).
- `public/index.html`: storefront.

## Setup (do not skip)
1. Create a Cloudflare D1 database named `anti-garde-db`.
2. Replace the placeholder `database_id` in `wrangler.toml`.
3. Apply schema: `npx wrangler d1 execute anti-garde-db --remote --file=./schema.sql`.
4. Set secrets: `npx wrangler secret put ADMIN_PASSWORD` and `npx wrangler secret put SESSION_SECRET` (use a long random value for the latter).
5. Deploy with `npx wrangler deploy`.
6. Visit `/admin/` and sign in.

## Important limitations
This is the first backend/admin foundation, not a live checkout. Public order creation, stock reservation, ECPay, COD settlement, SMS OTP, carrier APIs, tracking webhooks and waybill printing are intentionally not enabled yet. Do not accept customer payments until these are implemented and tested. Protect the Worker deployment and keep secrets out of Git.
