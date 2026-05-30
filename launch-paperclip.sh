#!/bin/bash
# Launch Paperclip server for launchd
# Runs the dev server (tsx) with auto-migration, no watch mode

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export HOME="/srv/nanobot/paperclip"
export NODE_ENV="production"
export PAPERCLIP_MIGRATION_PROMPT="never"
export BETTER_AUTH_TRUSTED_ORIGINS="https://paperclip.andersontechsolutions.com,http://localhost:3100"

cd /srv/nanobot/paperclip/source/server

exec /usr/bin/node \
  --require /srv/nanobot/paperclip/source/node_modules/.pnpm/tsx@4.21.0/node_modules/tsx/dist/preflight.cjs \
  --import 'file:///srv/nanobot/paperclip/source/node_modules/.pnpm/tsx@4.21.0/node_modules/tsx/dist/loader.mjs' \
  src/index.ts
