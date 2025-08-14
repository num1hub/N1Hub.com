#!/usr/bin/env bash
set -euo pipefail
VER="${1:-0.1.0}"
zip -r "n1hub.theme.v${VER}.zip" n1hub-theme


