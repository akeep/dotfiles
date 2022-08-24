" allow :e to move away from modified file
set hidden

" indentation options
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set autoindent
set smartindent

" search options
set incsearch
set hlsearch

" syntax options
set ruler
set showcmd
set showmatch
set nocompatible

" alert option
set novisualbell
set noerrorbells
set vb t_vb=

syntax on
filetype plugin indent on
let c_comment_strings=1

set backspace=indent,eol,start

" wrapping options
set nowrap

" set our preferences for wildmode
set wildmode=list:longest,full
set wildmenu

" Key mappings
inoremap jk <esc>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>n :nohl<cr>

" plugin configuration
let g:is_chezscheme=1

" make the minibuffer behave like shell/emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" set the color scheme
let g:rehash256 = 1
colorscheme molokai


