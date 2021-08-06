""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""

" source onedark theme
source ~/.config/nvim/colors/onedark.vim

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

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tmux statusline generator
Plug 'edkolev/tmuxline.vim'

call plug#end()

filetype plugin indent on   " required

""""""""""""""""""""""""""""""""
" -> Onedark
""""""""""""""""""""""""""""""""
colorscheme onedark


""""""""""""""""""""""""""""""""
" -> vim-airline
""""""""""""""""""""""""""""""""

" Enable smarter tab line
let g:airline#extensions#tabline#enabled = 1
" Define "straight" tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" set path formatter to unique_tail_improved
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


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

