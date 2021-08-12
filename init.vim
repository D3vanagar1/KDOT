""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => General
"       -> File management
"   => Text and tab options
"   => Plugins
"       -> Onedark
"       -> Telescope
"       -> vim-airline
"       -> Ack
"       -> NERDTree
"       -> Quickscope
"   => Leader mappings
"   => Additional helpful remaps
"   => Functions
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""

" auto-source init.vim
nnoremap <C-s> :source $MYVIMRC<CR>
" source onedark theme
source ~/.config/nvim/colors/onedark.vim

if has('autocmd')
    " Remove all trailing whitespace when saving file
    autocmd BufWritePre * :%s/\s\+$//e
    if exists('*matchaddpos')
        autocmd BufEnter,FocusGained,Vimenter,WinEnter * call Focus_window()
        autocmd FocusLost,WinLeave * call Blur_window()

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

:set foldmethod=indent

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

" Quickscope (highlight for a unique character in every word on a line)
Plug 'unblevable/quick-scope'

" Auto-Focusing
Plug 'beauwilliams/focus.nvim'

call plug#end()

filetype plugin indent on   " required

""""""""""""""""""""""""""""""""
" -> Onedark
""""""""""""""""""""""""""""""""
colorscheme onedark
let g:onedark_termcolors=256
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
" -> Ack
""""""""""""""""""""""""""""""""

cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<Space>


""""""""""""""""""""""""""""""""
" -> NERDTree
""""""""""""""""""""""""""""""""

map <silent> <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""
" -> Quickscope
""""""""""""""""""""""""""""""""

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

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

" Making new splits
nnoremap <leader>nh :new<space>
nnoremap <leader>nv :vnew<space>

" Moving between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resizing window
nnoremap <leader>h+ :resize +5<CR>
nnoremap <leader>h- :resize -5<CR>
nnoremap <leader>v+ :vertical resize +5<CR>
nnoremap <leader>v- :vertical resize -5<CR>

" Behave like the rest of vim
nnoremap Y y$

" make paste always on next line
nmap p :pu<CR>

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

""""""""""""""""""""""""""""""""""""""""
" ==> Functions
""""""""""""""""""""""""""""""""""""""""


" From wincent's github
" https://github.com/wincent/wincent/blob/4578e56cc23/roles/dotfiles/files/.vim/autoload/autocmds.vim#L39-L76

" E171: missing endif -- can't find error, think it is add(() or matchdelete()
" is not returning
" Blur window
function Blur_window() abort
    if !exists('w:karan_matches')
        let w:karan_matches=[]
    endif
    let l:height=&lines
    let l:slop=l:height / 2
    let l:start=max([1,line('w0')-l:slop])
    let l:end=min([line('$'),line('w$')+l:slop])
    while l:start <= l:end
        let l:next=l:start+8
        let l:id=matchaddpos(
                \   'StatusLine',
                \   range(l:start, min([l:end, l:next])),
                \   1000
                \ )
        call add(w:karan_matches, l:id)
        let l:start=l:next
    endwhile
endfunction

function Focus_window() abort
    if exists('w:karan_matches')
        for l:match in w:karan_matches
            try
                call matchdelete(l:match)
            catch /.*/
                " Test
            endtry
        endfor
        let w:karan_matches=[]
    endif
endfunction
