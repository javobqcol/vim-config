#!/bin/bash

set -e

echo "==> Instalando Vim desde vim-config..."

VIM_PACK="$HOME/.vim/pack/vendor/start"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$VIM_PACK"

install_plugin () {
  NAME=$1
  REPO=$2

  if [ -d "$VIM_PACK/$NAME" ]; then
    echo "✔ $NAME ya existe"
  else
    echo "⬇ Instalando $NAME"
    git clone --depth=1 "$REPO" "$VIM_PACK/$NAME"
  fi
}

echo "==> Leyendo plugins.txt..."

while read -r plugin; do
  case "$plugin" in
    fzf)
      install_plugin fzf https://github.com/junegunn/fzf.git
      ;;
    fzf.vim)
      install_plugin fzf.vim https://github.com/junegunn/fzf.vim.git
      ;;
    nerdtree)
      install_plugin nerdtree https://github.com/preservim/nerdtree.git
      ;;
    vim-airline)
      install_plugin vim-airline https://github.com/vim-airline/vim-airline.git
      ;;
    vim-airline-themes)
      install_plugin vim-airline-themes https://github.com/vim-airline/vim-airline-themes.git
      ;;
    vim-surround)
      install_plugin vim-surround https://github.com/tpope/vim-surround.git
      ;;
    vim-commentary)
      install_plugin vim-commentary https://github.com/tpope/vim-commentary.git
      ;;
    vim-fugitive)
      install_plugin vim-fugitive https://github.com/tpope/vim-fugitive.git
      ;;
    vim-vinegar)
      install_plugin vim-vinegar https://github.com/tpope/vim-vinegar.git
      ;;
    gruvbox)
      install_plugin gruvbox https://github.com/morhetz/gruvbox.git
      ;;
    vim-colors-solarized)
      install_plugin vim-colors-solarized https://github.com/altercation/vim-colors-solarized.git
      ;;
    emmet-vim)
      install_plugin emmet-vim https://github.com/mattn/emmet-vim.git
      ;;
    *)
      echo "⚠ plugin desconocido: $plugin"
      ;;
  esac
done < "$REPO_DIR/plugins.txt"

echo ""
echo "✔ Vim listo."
