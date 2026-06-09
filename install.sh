#!/bin/bash

set -euo pipefail

PLUGIN_DIR="$HOME/.vim/pack/vendor/start"
VIMRC_SRC="$(pwd)/.vimrc"
VIMRC_DEST="$HOME/.vimrc"
BACKUP_DIR="$HOME/.vim_backup"

echo "======================================="
echo "  VIM INSTALLER (FORCE MODE)"
echo "======================================="

# ----------------------------
# BACKUP + OVERWRITE VIMRC
# ----------------------------
mkdir -p "$BACKUP_DIR"

if [ -f "$VIMRC_DEST" ]; then
    echo "[*] Backup de .vimrc existente"
    cp "$VIMRC_DEST" "$BACKUP_DIR/vimrc.$(date +%Y%m%d_%H%M%S)"
fi

echo "[+] Copiando nuevo .vimrc"
cp -f "$VIMRC_SRC" "$VIMRC_DEST"

# VERIFICACIÓN (esto es clave)
echo "[✓] .vimrc instalado desde repo:"
tail -n 5 "$VIMRC_DEST"

# ----------------------------
# PLUGINS
# ----------------------------
mkdir -p "$PLUGIN_DIR"

install_plugin() {
    local name="$1"
    local repo="$2"

    if [ -d "$PLUGIN_DIR/$name" ]; then
        echo "[OK] $name ya existe"
    else
        echo "[+] Instalando $name..."
        git clone --depth=1 "$repo" "$PLUGIN_DIR/$name"
    fi
}

echo ""
echo "==> Instalando plugins..."

install_plugin fzf https://github.com/junegunn/fzf.git
install_plugin fzf.vim https://github.com/junegunn/fzf.vim.git
install_plugin nerdtree https://github.com/preservim/nerdtree.git
install_plugin vim-airline https://github.com/vim-airline/vim-airline.git
install_plugin vim-airline-themes https://github.com/vim-airline/vim-airline-themes.git
install_plugin vim-vinegar https://github.com/tpope/vim-vinegar.git
install_plugin gruvbox https://github.com/morhetz/gruvbox.git
install_plugin vim-colors-solarized https://github.com/altercation/vim-colors-solarized.git
install_plugin vim-surround https://github.com/tpope/vim-surround.git
install_plugin vim-commentary https://github.com/tpope/vim-commentary.git
install_plugin vim-fugitive https://github.com/tpope/vim-fugitive.git
install_plugin emmet-vim https://github.com/mattn/emmet-vim.git



echo ""
echo "======================================="
echo " INSTALACIÓN COMPLETA"
echo "======================================="
echo ""

echo "✔ Vim listo."
echo
echo "======================================="
echo " RESUMEN DE PLUGINS INSTALADOS"
echo "======================================="
echo
echo "F2                -> NERDTree (mostrar/ocultar explorador)"
echo "Ctrl+P            -> FZF Files (buscar archivos)"
echo "Ctrl+F            -> FZF Ripgrep (buscar texto)"
echo "Ctrl+B            -> FZF Buffers"
echo "Ctrl+L            -> FZF Lines"
echo
echo "vim-surround"
echo "  ysiw<p>         -> rodea palabra con <p></p>"
echo "  yss<div>        -> rodea línea completa"
echo "  cs\"'            -> cambia \" por '"
echo "  ds\"             -> elimina comillas"
echo
echo "emmet-vim"
echo "  div>ul>li*5"
echo "  Ctrl+Y ,        -> expandir abreviatura"
echo "  Visual + Ctrl+Y ,"
echo "                   -> envolver selección"
echo
echo "vim-commentary"
echo "  gcc             -> comentar línea"
echo "  gc + selección  -> comentar bloque"
echo
echo "vim-fugitive"
echo "  :Git status"
echo "  :Git blame"
echo "  :Git commit"
echo
echo "vim-airline"
echo "  Barra de estado mejorada"
echo
echo "======================================="
echo
