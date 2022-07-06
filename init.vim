"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => Source files
"   => General
"       -> File management
"   => Text and tab options
"   => Plugins
"       -> Everblush
"       -> Treesitter
"       -> Telescope
"       -> vim-airline
"       -> Nvim-Tree
"       -> tcomment_vim
"       -> vim-sneak
"       -> Nvm-cmp
"       -> Vimspector
"       -> Firenvim
"       -> vim-slime
"       -> indentLine
"       -> vimux
"       -> UltiSnips
"       -> IPython-cell
"   => Leader mappings
"   => Additional helpful remaps
"   => Autocmds
"   => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Source files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('D3vanagar1.settings.general')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set spell
set undodir=~/.config/nvim/undodir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" Colorscheme
Plug 'mangeshrex/everblush.vim'
" Undotree
Plug 'mbbill/undotree'
" Great Git wrapper
Plug 'tpope/vim-fugitive'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
" Tree explorer
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'meanindra/nvim-tree.lua'
" Universal commenter, handles filetypes
Plug 'tomtom/tcomment_vim'
" Fuzzy finder (C-p to activate)
Plug 'ctrlpvim/ctrlp.vim'
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
" All the plugins for nvm-cmp with ultisnips"
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Debugger
Plug 'puremourning/vimspector'
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
Plug 'dense-analysis/ale'
" insert or delete brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'
" Vim support for mathematica
Plug 'voldikss/vim-mma'
" Fennel syntax highlight
Plug 'mnacamura/vim-fennel-syntax'
" vim mmarkdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" Nvim lsp configuration
Plug 'neovim/nvim-lspconfig'

" UltiSnips
" Track the engine
Plug 'SirVer/ultisnips'
" Snippets for engine
Plug 'honza/vim-snippets'

" Run python code from Vim in IPython. Similoar to Jupyter notebook
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
" OpenQASM syntax highlight
Plug 'Qiskit/openqasm', {'rtp': 'plugins/vim/'}

call plug#end()

filetype plugin indent on   " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Everblush
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme everblush
let g:everblushNR=1

" visual highlight
hi Visual term=reverse cterm=reverse guibg=Purple

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.plugins.treesitter')
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable smarter tab line
let g:airline#extensions#tabline#enabled = 1
" Define "straight" tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" set path formatter to unique_tail_improved
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Set theme
let g:airline_theme='base16_dracula'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Nvim-tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('D3vanagar1.plugins.nvim-tree')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> tcomment_vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notes:
"   Normal mode:
"       gcc : Toggle comment current line
"       g<c : Uncomment the current line
"   Visual mode:
"       gc : Toggles comments
"       g> : Comment selected text

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Ctrl P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1

map f <Plug>Sneak_s
map F <Plug>Sneak_S

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Nvm-cmp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.plugins.nvim-cmp')

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vimspector (and maximizer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Firenvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vim-slime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make tmux default
let g:slime_target = "tmux"
" enable tmux to accept input from STDIN with a filename of our choice
let g:slime_paste_file = tempname()
" when running vim and tmux split
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
" fix paste issues in ipython
let g:slime_python_ipython = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_BufNameExclude=['nvim-tree.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>vr :call VimuxRunCommand("clear; unittest " . bufname("%"))<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_math = 1

" Mappings
" gx: open link under cursor (doesn't work for links spanning multiple lines)
" ge: opeln link under curosr in vim
" ]]: move to next header
" [[: move to previous header
" ][: move to sibling header
" []: move to previous sibling header
" ]h: move to current header
" ]u: move to parent header

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->nvim-lspconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.lspconfig')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->IPython-cell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start IPython
" nnoremap <leader>s :SlimeSend1 ipython --matplotlib<CR>
" " run script
" nnoremap <leader>x


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.mappings.leader')
EOF

" " Open undotree
nnoremap <leader>u :UndotreeShow<CR>

" toggle paren match highlighting
" (mnemonic: [p]aren match)
nnoremap <silent> <Leader>p :execute (exists('g:loaded_matchparen') ? 'No' : 'Do') . 'MatchParen'<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Additional helpful remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

    " Enabled/Disable Focus depending on selected pane
    if exists('*matchaddpos')
        autocmd BufEnter,FocusGained,Vimenter,WinEnter * call Focus_window()
        autocmd FocusLost,WinLeave * call Blur_window()
    endif

    " Apply "blinds" to non-selected panes (improved focus)
    if (exists("g:loaded_blinds") && g:loaded_blinds) || &cp
        finish
    endif
    let g:loaded_blinds= 1

    if !exists("g:blinds_guibg")
        let g:blinds_guibg = "Black"
    endif

    function! s:SetBlinds()
        exec "hi Blinds guibg=".g:blinds_guibg
    endfun

    augroup blinds
        au!
        au WinEnter,BufWinEnter * setlocal winhighlight=

        au WinLeave * if &bl == 1 | setlocal winhighlight=ColorColumn:Blinds,CursorColumn:Blinds,CursorLine:Blinds,EndOfBuffer:Blinds,LineNr:Blinds,NonText:Blinds,Normal:Blinds,FoldColumn:Blinds,SignColumn:Blinds,VertSplit:Blinds,Whitespace:Blinds | endif
        au ColorScheme * call s:SetBlinds()
    augroup END

    call s:SetBlinds()

    " Use TextYankPost
    if exists('##TextYankPost')
        augroup highlight_yank
    autocmd!

    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END
endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
                \   'Normal',
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
