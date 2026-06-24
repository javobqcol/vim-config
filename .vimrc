" =============================================================================
" 1. CONFIGURACIÓN BÁSICA E INTERFAZ VISUAL
" =============================================================================
syntax on                  " Colorea la sintaxis
set number                 " Muestra números de línea
set relativenumber         " Muestra números relativos (¡combínalo con number!)
set mouse=a                " Habilita el ratón
set laststatus=2           " Muestra siempre la barra de estado
set noshowmode             " Oculta el modo nativo (Airline ya lo maneja)
set scrolloff=3            " Mantiene un margen de 3 líneas al hacer scroll

" =============================================================================
" 2. INDENTACIÓN Y ESPACIOS
" =============================================================================
set tabstop=4              " Tamaño de tabulación
set shiftwidth=4           " Tamaño para autoindentación
set expandtab              " Convierte tabs en espacios
set backspace=indent,eol,start " Corrección de comportamiento de Backspace

" =============================================================================
" 3. BÚSQUEDA INTELIGENTE
" =============================================================================
set ignorecase             " Ignora mayúsculas en búsquedas...
set smartcase              " ...a menos que la búsqueda tenga mayúsculas
set incsearch              " Muestra resultados de búsqueda mientras escribes
set hlsearch               " Resalta resultados de búsqueda

" =============================================================================
" 4. RENDIMIENTO, PORTAPAPELES Y UNDO PERSISTENTE
" =============================================================================
set clipboard=unnamedplus  " Usa el portapapeles del sistema
set ttyfast                " Optimiza el renderizado de la terminal

" Crear el directorio de undo si no existe (previene errores)
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p", 0700)
endif

set undodir=~/.vim/undo     " Directorio para archivos de undo
set undofile                " Activar undo persistente
set undolevels=1000         " Número máximo de cambios que se pueden deshacer
set undoreload=10000        " Guardar todo el buffer al recargar un archivo

" =============================================================================
" 5. CONFIGURACIÓN DE COLORES
" =============================================================================
set termguicolors           " Colores de 24 bits

" Opción 1: gruvbox (Descomenta esta línea y comenta la de abajo si prefieres cambiar)
" colorscheme gruvbox

" Opción 2: solarized
colorscheme solarized
set background=dark

" =============================================================================
" 6. PLUGINS EXISTENTES (NERDTree, FZF, Airline)
" =============================================================================
" Mapear la tecla F2 para abrir/cerrar NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" Atajos de teclado para fzf.vim
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <C-b> :Buffers<CR>
" Nota: remapeamos <C-l> para mantenerlo libre para la navegación de ventanas nativa
nnoremap <silent> <leader>l :Lines<CR>

" Configurar acciones dentro de fzf (Ctrl+t, Ctrl+x, Ctrl+v)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Personalizar la ventana de fzf
let g:fzf_layout = { 'down': '40%' }

" Configuración de Airline (barra de estado)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline\ 10

" =============================================================================
" 7. MEJORAS NATIVAS EXTRAÍDAS DE VIM-BOOTSTRAP (0 Plugins)
" =============================================================================
" Definir la tecla líder por defecto (Coma)
let mapleader=','

" Limpiar el resaltado de la última búsqueda con <Líder> + Espacio (, + espacio)
nnoremap <silent> <leader><space> :noh<cr>

" Centrado automático vertical al navegar por las búsquedas
nnoremap n nzzzv
nnoremap N Nzzzv

" Cambiar entre ventanas divididas (splits) usando Ctrl + fila de inicio
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Mantener el bloque seleccionado en modo visual después de indentar con > o <
vmap < <gv
vmap > >gv

" Corregir errores comunes de mayúsculas al guardar o salir en la línea de órdenes
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev W w
cnoreabbrev Q q

" Explorador de archivos nativo alternativo en árbol (Se activa con F3)
let g:netrw_banner = 0       " Ocultar banner de ayuda superior
let g:netrw_liststyle = 3    " Vista en formato de árbol
let g:netrw_winsize = 25     " Ancho fijo al abrir a la izquierda
nnoremap <silent> <F3> :Lexplore<CR>

" =============================================================================
" 8. REGLAS AUTOMÁTICAS (AUTOCOMMANDS)
" =============================================================================
augroup vimrc-nativos
  autocmd!
  " Recuerda la última posición del cursor al reabrir cualquier archivo
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  
  " Sincronización de sintaxis fluida sin congelar archivos grandes
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
