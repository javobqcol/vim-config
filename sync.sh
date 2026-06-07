#!/bin/bash

set -e

echo "==> Sincronizando plugins desde Vim a GitHub..."

VIM_PACK="$HOME/.vim/pack/vendor/start"
OUTPUT="plugins.txt"

rm -f "$OUTPUT"

for d in "$VIM_PACK"/*; do
  [ -d "$d" ] || continue
  name=$(basename "$d")
  echo "$name" >> "$OUTPUT"
done

sort -u -o "$OUTPUT" "$OUTPUT"

echo "✔ plugins.txt actualizado:"
cat "$OUTPUT"

git add plugins.txt
git commit -m "sync: plugins actualizados desde vim"
git push
