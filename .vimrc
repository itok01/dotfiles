"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Load TOML
  call dein#load_toml('~/.vim/dein.toml', {'lazy': 0})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts------------------------

set autoread
set clipboard=unnamedplus
set expandtab
set fenc=utf-8
set hidden
set hlsearch
set nobackup
set noswapfile
set number
set shiftwidth=2
set showmatch
set smartindent
set tabstop=2
set termguicolors
set wrapscan
noremap j gj
noremap k gk
inoremap jj <Esc>

let mapleader = "\<Space>"
nnoremap <Leader>a ggVG<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
