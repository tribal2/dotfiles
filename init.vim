" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim.
Plug 'tomasiser/vim-code-dark' " Dark color scheme inspired by Dark+ in Visual Studio Code
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'vim-airline/vim-airline' " lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'airblade/vim-rooter'
Plug 'Yggdroot/indentLine'

call plug#end()


" CONFIGURACIÓN
" ----------------------------------------------------------

set encoding=utf-8

" Tabs a 2 espacios
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab " reemplaza tabs por espacios

" Muestra números de línea 'híbridos' (absoluto en modo insertar y relativo en modo normal)
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
highlight LineNr ctermfg=Darkgrey

" Permite la integración del mouse (seleccionar texto, mover el cursor)
set mouse=a

" No dividir la línea si es muy larga
set nowrap

" Resalta la línea actual
set cursorline
highlight cursorline cterm=NONE ctermbg=Darkgrey ctermfg=NONE

" Muestra la columna límite a 80 caracteres
set textwidth=80
set colorcolumn=+1

" Permitir cambiar de buffers sin tener que guardarlos
set hidden

" Mostrar siempre dos líneas alrededor del cursor
set scrolloff=2

" Búsqueda
" Resaltar resultados mientras se busca
set incsearch
" Resaltar resultados de búsqueda
set hlsearch
" Ignorar mayúsculas al hacer una búsqueda
set ignorecase
" No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set smartcase

" Resaltar espacios en blanco al final de una línea
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()



" CONFIGURACIÓN de plugins
" ----------------------------------------------------------

" Airline
" Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#enabled = 1
" Mostrar sólo el nombre del archivo
let g:airline#extensions#tabline#fnamemod = ':t'
" Cargar fuente Powerline y símbolos
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" No mostrar el modo actual (ya lo muestra la barra de estado)
set noshowmode

" Indentline
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" NERDtree
" Cambia el directorio actual al nodo padre actual
let g:NERDTreeChDirMode = 2
" Abrir/cerrar con F2
map <F2> :NERDTreeToggle<CR>


" MAPPINGS
" ----------------------------------------------------------

" Usar ii para alternar entre modos insert/normal
inoremap ii <esc>
cnoremap ii <C-C>

" Guardar con CTRL+S
nnoremap <C-s> :w<CR>

" Definir espacio como la tecla líder
let g:mapleader = ' '

" Clipboard en modo visual
vmap <leader>c "+yi
vmap <leader>x "+c

" Moverse al buffer siguiente con <líder> + j
nnoremap <leader>j :bnext<CR>

" Moverse al buffer anterior con <líder> + k
nnoremap <leader>k :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

" Listar buffers on <líder> + b
nnoremap <leader>b :ls<CR>:b

" Mover líneas hacia abajo (ALT+j) o arriba (ALT+k)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Generar splits
nnoremap <silent> <Leader>wv <C-w>v
nnoremap <silent> <Leader>wh <C-w>s

" Movimiento rápido entre ventanas (splits) con CTRL+<mov>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

