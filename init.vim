""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""


" Remove all trailing whitespace when saving file
autocmd BufWritePre * :%s/\s\+$//e
" auto-source init.vim
nnoremap <C-s> :source $MYVIMRC<CR>
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
set nu rnu
set background=dark
set noerrorbells
set spell
set spelllang=en_us,fr_ch

""""""""""""""""""""""""""""
" -> General file management
""""""""""""""""""""""""""""
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

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

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Ack
Plug 'mileszs/ack.vim'

call plug#end()

filetype plugin indent on   " required

""""""""""""""""""""""""""""""""
" -> Onedark
""""""""""""""""""""""""""""""""
colorscheme onedark
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

""""""""""""""""""""""""""""""""
" -> Telescope
""""""""""""""""""""""""""""""""

" Find files using telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>


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
" Set theme
let g:airline_theme='ayu_mirage'


""""""""""""""""""""""""""""""""
" ==> Ack
""""""""""""""""""""""""""""""""

cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<Space>



""""""""""""""""""""""""""""""""
" -> NERDTree mappings
""""""""""""""""""""""""""""""""

map <silent> <C-n> :NERDTreeFocus<CR>

""""""""""""""""""""""""""""""""""""""""
" ==> Leader mappings
""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

" Save current file
nnoremap <leader>w :w<CR>
" Quit from current file
nnoremap <leader>q :q<CR>
" Quit from current file w/o saving
nnoremap <leader>Q :q!<CR>
" Open undotree
nnoremap <leader>u :UndotreeShow<CR>
" Show path of current file
nnoremap <leader>p :echo expand('%')<CR>
" Remove search highlighting
nnoremap <silent> <leader><CR> :noh<CR>


""""""""""""""""""""""""""""""""""""""""
" ==> Additional helpful remaps
""""""""""""""""""""""""""""""""""""""""

" Behave like the rest of vim
nnoremap Y y$

" Keep screen centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . 'j'

" Moving text (move text up and down with j and k
vnoremap J :m `>+1<CR>gv=gv
vnoremap K :m `>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

