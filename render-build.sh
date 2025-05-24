#!/usr/bin/env bash
set -e

echo "→ Activando Corepack y la versión de pnpm declarada…"
corepack enable
corepack prepare pnpm@10.2.1 --activate

echo "→ Instalando TODAS las dependencias (incluidas dev)…"
pnpm install --frozen-lockfile    # sin --prod

echo "→ Construyendo monorepo…"
pnpm run build
