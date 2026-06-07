#!/bin/bash

set -e

echo "==> Instalando Vim config..."

REPO="https://github.com/javobqcol/vim-config.git"

if [ ! -d "$HOME/vim-config" ]; then
  git clone "$REPO" "$HOME/vim-config"
fi

cd "$HOME/vim-config"

bash install.sh

echo "✔ Vim configurado"
