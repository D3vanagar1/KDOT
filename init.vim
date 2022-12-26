"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => Source files
"   => General
"   => Plugins
"       -> Everblush
"       -> Treesitter
"       -> Telescope
"       -> vim-airline
"       -> tcomment_vim
"       -> vim-sneak
"       -> Nvm-cmp
"       -> nvim-dap
"       -> vim-slime
"       -> indentLine
"       -> vimux
"       -> vim-markdown
"       -> vimtex
"       -> LSP
"       -> LuaSnip
"       -> IPython-cell
"       -> gitsigns
"   => Leader mappings
"   => Additional helpful remaps
"   => Autocmds
"   => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
call plug#begin('~/.config/nvim/plugged')

" Colorscheme
Plug 'mangeshrex/everblush.vim'
" Undotree
Plug 'mbbill/undotree'
" Git
" Great Git wrapper
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
" Tree explorer
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
" Universal commenter, handles filetypes
Plug 'tomtom/tcomment_vim'
" Fuzzy finder (C-p to activate)
" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Tmux statusline generator
Plug 'edkolev/tmuxline.vim'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.0'}
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" vim-sneak (ump to any location specified by two characters)
Plug 'justinmk/vim-sneak'
" Replacing all instances of word throughout file
" <leader>e enter new word and y/n for each word you want to replace
Plug 'wincent/scalpel'
" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" Autocompletion
" All the plugins for nvm-cmp with LuaSnip"
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" helpful lsp setup
Plug 'VonHeikemen/lsp-zero.nvim'

" syntax-checker with lsp support
Plug 'dense-analysis/ale'

Plug 'ThePrimeagen/harpoon'
" Debugger all for nvim-dap
Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Avoid reloading code by sending it to a live REPL
Plug 'jpalardy/vim-slime'
" Show indentation level
Plug 'Yggdroot/indentLine'
" Interact with tmux from vim
Plug 'preservim/vimux'
" Run python code from Vim in IPython. Similoar to Jupyter notebook
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
" insert or delete brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'
" For LaTeX files
Plug 'lervag/vimtex'

" Plugins for different languages
" Vim support for mathematica
Plug 'voldikss/vim-mma'
" Fennel syntax highlight
Plug 'mnacamura/vim-fennel-syntax'
" Solidity syntax highlight
Plug 'thesis/vim-solidity'
" vim mmarkdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" OpenQASM syntax highlight
Plug 'Qiskit/openqasm', {'rtp': 'plugins/vim/'}
call plug#end()

filetype plugin indent on   " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Everblush
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme everblush
let g:everblushNR=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('D3vanagar1.settings.general')
EOF
set spell

" have to write as when init.vim is sourced this settings are lost
:highlight Visual cterm=reverse guibg=Purple
:highlight Folded guibg=lightblack guifg=lightgrey
:highlight Foldedcolumn guibg=darkgrey guifg=white
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
nnoremap <leader>ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({winblend=10}))<cr>
nnoremap <leader>fs :lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({winblend=10}))<cr>
nnoremap <leader>fh :lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown({winblend=10}))<cr>
nnoremap <leader>fb <cmd>Telescope buffers<CR>

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
" -> nvim-dap and related plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('D3vanagar1.plugins.nvim-dap')
require('D3vanagar1.plugins.telescope-dap')
EOF

" nvim-dap
nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>dl :lua require'dap'.run_last()<CR>

" telescope-dap
nnoremap <leader>df :Telescope dap frames<CR>
nnoremap <leader>dc :Telescope dap commands<CR>
nnoremap <leader>db :Telescope dap list_breakpoints<CR>

" Maximizes selected window. Run again to toggle off
nnoremap <leader>m :MaximizerToggle!<CR>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>vp :call VimuxRunCommand("clear; python3 " . bufname("%"))<CR>


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
" ->vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.plugins.vimtex')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->LSP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
-- all lsp configuration
require('D3vanagar1.lspconfig')
require('D3vanagar1.plugins.mason')
require('D3vanagar1.plugins.lsp')
require('D3vanagar1.plugins.harpoon')
EOF
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->LuaSnip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->IPython-cell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start IPython
" nnoremap <leader>s :SlimeSend1 ipython --matplotlib<CR>
" " run script
" nnoremap <leader>x


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ->gitsigns
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.plugins.gitsigns')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.mappings.leader')
EOF

" quit vim
nnoremap <leader>q :q<CR>

" Source init.vim
nnoremap <C-s> :source $MYVIMRC<CR>

" Open undotree
nnoremap <leader>u :UndotreeShow<CR>

" toggle paren match highlighting
" (mnemonic: [p]aren match)
" nnoremap <silent> <Leader>p :execute (exists('g:loaded_matchparen') ? 'No' : 'Do') . 'MatchParen'<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Additional helpful remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('D3vanagar1.mappings.rest')
EOF
" " set default search to be on "very magic" mode for reg exprs
nnoremap / /\v
vnoremap / /\v

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
