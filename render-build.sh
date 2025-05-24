#!/usr/bin/env bash
set -euo pipefail

echo "→ Instalando dependencias del proyecto"
corepack enable
corepack prepare pnpm@10.2.1 --activate
pnpm install --no-frozen-lockfile
pnpm run build

# --- carpeta bin local (queda dentro del proyecto) ---
BIN_DIR="$PWD/bin"
mkdir -p "$BIN_DIR"

echo "→ Descargando yt-dlp estático"
curl -sSL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
     -o "$BIN_DIR/yt-dlp"
chmod a+rx "$BIN_DIR/yt-dlp"

echo "→ Descargando FFmpeg estático"
curl -sSL https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
  | tar -xJ --wildcards --strip-components=1 -C "$BIN_DIR" 'ffmpeg-*/ffmpeg'
chmod a+rx "$BIN_DIR/ffmpeg"

echo "→ Binarios listos en $BIN_DIR"
