""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/themes/onedark.vim

syntax on

set nocompatible
filetype off
set nowrap
set smartcase
set smartindent
set showmatch
set ignorecase
set mouse=v
set hlsearch
set autoindent
set nu
set relativenumber
set background=dark
set noerrorbells


""""""""""""""""""""""""""""""""""""""""
" ==> Text and Tab options
""""""""""""""""""""""""""""""""""""""""

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab


""""""""""""""""""""""""""""""""""""""""
" ==> Plugins
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" Undotree
Plug 'mbbill/undotree'
" Great Git wrapper
Plug 'tpope/vim-fugitive'
" Tree explorer
Plug 'preservim/nerdtree'
" Fuzzy finder (C-p to activate)
Plug 'ctrlpvim/ctrlp.vim'
" Syntax highlighting
Plug 'neoclide/coc.nvim',{'branch':'release'}

" Theme
Plug 'joshdick/onedark.vim'

call plug#end()

filetype plugin indent on   " required

""""""""""""""""""""""""""""""""
" -> Onedark
""""""""""""""""""""""""""""""""

colorscheme onedark

""""""""""""""""""""""""""""""""
" -> NERDTree mappings
""""""""""""""""""""""""""""""""

map <silent> <C-n> :NERDTreeFocus<CR>

""""""""""""""""""""""""""""""""""""""""
" ==> Leader remaps
""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>u :UndotreeShow<CR>
" Remove search highlighting
nnoremap <silent> <leader><CR> :noh<CR>

