syntax on           " Colorea la sintaxis
set number          " Muestra números de línea
set relativenumber  " Muestra números relativos (¡combínalo con number!)
set tabstop=4       " Tamaño de tabulación
set shiftwidth=4    " Tamaño para autoindentación
set expandtab       " Convierte tabs en espacios
set ignorecase      " Ignora mayúsculas en búsquedas...
set smartcase       " ...a menos que la búsqueda tenga mayúsculas
set incsearch       " Muestra resultados de búsqueda mientras escribes
set hlsearch        " Resalta resultados de búsqueda
set mouse=a         " Habilita el ratón (útil para principiantes, pero luego lo desactivas)
set clipboard=unnamedplus " Usa el portapapeles del sistema

" Crear el directorio de undo si no existe (previene errores)
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p", 0700)
endif

" Configuración completa de undo
set undodir=~/.vim/undo     " Directorio para archivos de undo
set undofile                 " Activar undo persistente
set undolevels=1000          " Número máximo de cambios que se pueden deshacer
set undoreload=10000         " Guardar todo el buffer al recargar un archivo

" Mapear la tecla F2 para abrir/cerrar NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" ----- FZF: Agregar ambos plugins a la ruta -----
set rtp+=~/.vim/pack/misplugins/start/fzf
set rtp+=~/.vim/pack/misplugins/start/fzf.vim

" ----- Atajos de teclado para fzf.vim -----
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-l> :Lines<CR>
" Configurar acciones dentro de fzf (Ctrl+t, Ctrl+x, Ctrl+v)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Personalizar la ventana de fzf
let g:fzf_layout = { 'down': '40%' }

" ----- Airline (barra de estado) -----
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline\ 10

" ----- Colores (ELIGE UNO: gruvbox o solarized) -----
set termguicolors               " Colores de 24 bits

" Opción 1: gruvbox (recomendado, más moderno)
" colorscheme gruvbox

" Opción 2: solarized (descomenta esta línea y comenta la de arriba)
colorscheme solarized
set background=dark
