#!/usr/bin/env bash
set -e
npm ci          # instala TODO, incluidas devDependencies
npm run build
