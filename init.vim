""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => Source files
"   => General
"       -> File management
"   => Text and tab options
"   => Plugins
"       -> Onedark
"       -> Telescope
"       -> vim-airline
"       -> NERDTree
"       -> tcomment_vim
"       -> vim-sneak
"       -> Deoplete
"       -> Vimspector
"       -> Firenvim
"       -> vim-slime
"       -> indentLine
"       -> vimux
"   => Leader mappings
"   => Additional helpful remaps
"   => Autocmds
"   => Functions
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" ==> Source files
""""""""""""""""""""""""""""""""""""""""

" source onedark theme
source ~/.config/nvim/colors/onedark.vim

""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off
set nowrap
set smartcase
set smartindent
set showmatch
set ignorecase
set clipboard=unnamed           " Have access to system clipboard
set mouse=a
set nohlsearch                  " Remove highlight when searching
set autoindent
set backspace=indent,start,eol  " Allows unrestricted backspace in insert mode
set nu rnu                      " relative line number
set splitbelow splitright       " opens new splits below and right
set background=dark
set noerrorbells
set spell                       " Turns on spell checking
set cursorline
set nojoinspaces
set title

set foldmethod=indent

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
" Universal commenter, handles filetypes
Plug 'tomtom/tcomment_vim'
" Fuzzy finder (C-p to activate)
Plug 'ctrlpvim/ctrlp.vim'
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
" vim-sneak (ump to any location specified by two characters)
Plug 'justinmk/vim-sneak'
" Replacing all instances of word throughout file
" <leader>e enter new word and y/n for each word you want to replace
Plug 'wincent/scalpel'
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Debugger
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
" Nvim in browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Solidity syntax highlight
Plug 'thesis/vim-solidity'
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Avoid reloading code by sending it to a live REPL
Plug 'jpalardy/vim-slime'
" Show indentation level
Plug 'Yggdroot/indentLine'
" Interact with tmux from vim
Plug 'preservim/vimux'
" syntax-checker with lsp support
" Plug 'dense-analysis/ale'
" insert or delete brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'
" Vim support for mathematica
Plug 'voldikss/vim-mma'
" Fennel syntax highlight
Plug 'mnacamura/vim-fennel-syntax'
" Zen mode programming removes all distractions
Plug 'folke/zen-mode.nvim'
call plug#end()

filetype plugin indent on   " required

" Zen-Mode stuff
lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
EOF

""""""""""""""""""""""""""""""""
" -> Onedark
""""""""""""""""""""""""""""""""
colorscheme onedark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
highlight CursorLineNr term=bold cterm=NONE ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=LightGreen guibg=NONE

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
" -> NERDTree
""""""""""""""""""""""""""""""""
map <silent> <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""
" -> tcomment_vim
""""""""""""""""""""""""""""""""
" Notes:
"   Normal mode:
"       gcc : Toggle comment current line
"       g<c : Uncomment the current line
"   Visual mode:
"       gc : Toggles comments
"       g> : Comment selected text

""""""""""""""""""""""""""""""""
" -> vim-sneak
""""""""""""""""""""""""""""""""
let g:sneak#label = 1

map f <Plug>Sneak_s
map F <Plug>Sneak_S

""""""""""""""""""""""""""""""""
" -> Deoplete
""""""""""""""""""""""""""""""""
" Use deoplete
let g:deoplete#enable_at_startup = 1

" completion with Tab
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()

""""""""""""""""""""""""""""""""
" -> Vimspector (and maximizer)
""""""""""""""""""""""""""""""""
" Maximizes selected window. Run again to toggle off
nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dtp :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>

" movement
nnoremap <leader>dl <Plug>VimspectorStepInto
nnoremap <leader>dj <Plug>VimspectorStepOver
nnoremap <leader>dh <Plug>VimspectorStepOut
nnoremap <leader>dR <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
nnoremap <leader>drc <Plug>VimspectorRunToCursor
nnoremap <leader>dbp <Plug>VimspectorToggleBreakpoint
nnoremap <leader>dtbp <Plug>VimspectorToggleConditionalBreakpoint


" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

""""""""""""""""""""""""""""""""""""""""
" -> Firenvim
""""""""""""""""""""""""""""""""""""""""
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://messenger.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://twitter.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://facebook.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://twitch.tv'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://www.pythonanywhere.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://trinket.io/'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://http://localhost:8888/'] = { 'takeover': 'never', 'priority': 1 }

""""""""""""""""""""""""""""""""""""""""
" -> vim-slime
""""""""""""""""""""""""""""""""""""""""
" make tmux default
let g:slime_target = "tmux"
" enable tmux to accept input from STDIN with a filename of our choice
let g:slime_paste_file = tempname()
" when running vim and tmux split
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}


""""""""""""""""""""""""""""""""""""""""
" -> indentLine
""""""""""""""""""""""""""""""""""""""""
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_BufNameExclude=['NERD_tree.*']


""""""""""""""""""""""""""""""""""""""""
" -> vimux
""""""""""""""""""""""""""""""""""""""""
" map <leader>vr :call VimuxRunCommand("clear; unittest " . bufname("%"))<CR>

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
" Remove search highlighting
nnoremap <silent> <leader><CR> :noh<CR>

" Making new splits
nnoremap <leader>nh :new<space>
nnoremap <leader>nv :vnew<space>

" Resizing window
nnoremap <leader>h+ :resize +5<CR>
nnoremap <leader>h- :resize -5<CR>
nnoremap <leader>v+ :vertical resize +5<CR>
nnoremap <leader>v- :vertical resize -5<CR>

" Tabs
" go to first buffer tab
nmap <leader>1 :bp<CR>
" go to second buffer tab
nmap <leader>2 :bn<CR>

" toggle paren match highlighting
" (mnemonic: [p]aren match)
nnoremap <silent> <Leader>p :execute (exists('g:loaded_matchparen') ? 'No' : 'Do') . 'MatchParen'<CR>

""""""""""""""""""""""""""""""""""""""""
" ==> Additional helpful remaps
""""""""""""""""""""""""""""""""""""""""

" auto-source init.vim
nnoremap <C-s> :source $MYVIMRC<CR>

" ^ is so annoying to press from home row and I never use K for help.
nnoremap K ^

" Shift+Tab unindents a line in insert mode
imap <S-Tab> <Esc><<i
" Open and close current fold with Tab in normal mode
nnoremap <Tab> za

" Keep screen centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" set default search to be on "very magic" mode for reg exprs
nnoremap / /\v
vnoremap / /\v

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
" ==> Autocmds
""""""""""""""""""""""""""""""""""""""""

if has('autocmd')
    " set relativenumber only if it is the focused split
    augroup numbertoggle
        autocmd!
        autocmd BufEnter, FocusGained, InsertLeave * set relativenumber
        autocmd BufEnter, FocusLost, InsertLeave * set norelativenumber
    augroup END

    " Resets pane sizes if vim window dimensions are changed
    autocmd VimResized * execute "normal! \<c-w>="

    " Remove all trailing whitespace when saving file
    autocmd BufWritePre * :%s/\s\+$//e
    if exists('*matchaddpos')
        " Enabled/Disable Focus depending on selected pane
        autocmd BufEnter,FocusGained,Vimenter,WinEnter * call Focus_window()
        autocmd FocusLost,WinLeave * call Blur_window()
    endif
    " Use TextYankPost
    if exists('##TextYankPost')
        augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END
    endif
endif

""""""""""""""""""""""""""""""""""""""""
" ==> Functions
""""""""""""""""""""""""""""""""""""""""

" From Greg Hurrell's github
" https://github.com/wincent/wincent/blob/4578e56cc23/roles/dotfiles/files/.vim/autoload/autocmds.vim#L39-L76

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

" needed for deoplete to use <Tab> for completion
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
