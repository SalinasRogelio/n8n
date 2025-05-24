#!/usr/bin/env bash
set -e

# 1) Habilita Corepack y pnpm 10.2.1
corepack enable
corepack prepare pnpm@10.2.1 --activate

# 2) Instala TODAS las dependencias
#    ⚠️  OJO: SIN --frozen-lockfile
pnpm install --no-frozen-lockfile

# 3) Compila el monorepo
pnpm run build
