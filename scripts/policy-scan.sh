#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-.}"

echo "[policy] disallow builders, external scripts, heavy libs"
! grep -RiqE "elementor|divi|wpbakery" "$ROOT" || (echo "❌ builders found" && exit 1)
! grep -RiqE "<script[^>]+src=\"http" "$ROOT/n1hub-theme" || (echo "❌ external <script> found" && exit 1)
! grep -RiqE "slick\.js|swiper\.js|gtag\(|google-analytics.com" "$ROOT" || (echo "❌ heavy/tracking script found" && exit 1)

echo "[policy] required files"
test -f "$ROOT/n1hub-theme/theme.json" || (echo "❌ missing theme.json" && exit 1)
test -f "$ROOT/n1hub-theme/style.css" || (echo "❌ missing style.css" && exit 1)
test -f "$ROOT/n1hub-theme/functions.php" || (echo "❌ missing functions.php" && exit 1)

echo "[policy] php lint"
php -l "$ROOT/n1hub-theme/functions.php" >/dev/null

echo "[policy] screenshot size limit (<= 400KB)"
SZ=$(wc -c < "$ROOT/n1hub-theme/screenshot.png" | tr -d ' ')
([ "$SZ" -le 409600 ] || (echo "❌ screenshot too large: $SZ bytes" && exit 1)) && echo "OK"

echo "✅ policy OK"


