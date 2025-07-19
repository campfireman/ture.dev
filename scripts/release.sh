#!/bin/bash

#!/usr/bin/env bash
set -euo pipefail

# Directory to process (default ./public)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"
TARGET_DIR="${PROJECT_DIR}/public"

# Ensure avifenc is available
if ! command -v avifenc >/dev/null 2>&1; then
  echo "Error: avifenc not found. Install libavif first." >&2
  exit 1
fi

echo "Deleting unwanted files"
find "${TARGET_DIR}" -name '.DS_Store' -delete

echo "→ Converting images to AVIF…"
find "$TARGET_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | \
while IFS= read -r img; do
  avif="${img%.*}.avif"
  if [ -f "$avif" ]; then
    echo "   • Skipping (already exists): $avif"
  else
    echo "   • $img → $avif"
    # -q 50 for quality, --speed 4 for moderate encode speed
    avifenc -q 50 --speed 4 "$img" "$avif"
  fi
done

echo "→ Updating HTML references…"
find "$TARGET_DIR" -type f -iname '*.html' | \
while IFS= read -r html; do
  tmp="$(mktemp)"
  perl -0777 -pe '
    s{<img\s+([^>]*?)src=(["'\''])(.+?)\.(png|jpe?g)\2([^>]*?)>}
     { my ($pre,$q,$base,$ext,$post)=($1,$2,$3,$4,$5);
       qq|<img $pre src=$q$base.avif$q type="image/avif"$post>|
     }gse
  ' "$html" > "$tmp" && mv "$tmp" "$html"
done

echo "→ Deleting original images…"
find "$TARGET_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) -delete

echo "✅ All done."
