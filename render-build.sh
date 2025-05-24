#!/usr/bin/env bash
set -e

echo "→ Instalando dependencias del proyecto"
corepack enable
corepack prepare pnpm@10.2.1 --activate
pnpm install --no-frozen-lockfile
pnpm run build

echo "→ Descargando yt-dlp estático"
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
  -o /usr/local/bin/yt-dlp
chmod a+rx /usr/local/bin/yt-dlp

echo "→ Descargando FFmpeg estático"
curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
  | tar -Jx
cp ffmpeg-*/ffmpeg /usr/local/bin/
chmod a+rx /usr/local/bin/ffmpeg
rm -rf ffmpeg-*

echo "→ Binarios listos en /usr/local/bin"
