---------------------------------------
-- ==> General
---------------------------------------

--
-- filetype off

local opt = vim.opt

opt.compatible = false
opt.linebreak = false
-- Don't wrap on word boundary
opt.smartcase = true
-- Ignore lower case for the whole pattern
opt.ignorecase = true
-- Ignore case letters when search
opt.inccommand = "split"
-- Preview of replacements
opt.autoindent = true
opt.cursorline = true
-- Highlights text of current line. False in visual mode
opt.smartindent = true
-- Auntoindent new lines
opt.showmatch = true
-- Highlight matching parenthesis
opt.number = true
-- Show line numbers
opt.relativenumber = true
-- Show relative line numbers
opt.splitright = true
-- Vertical split to the right
opt.splitbelow = true
-- Horizontal split to the bottom
opt.foldmethod = "indent"
-- Enable folding on indentation
opt.hlsearch = false
-- Remove highlight when searching
opt.mouse = "a"
-- Enable mouse support
opt.showmode = false
-- Don't display current mode in last line
opt.scrolloff = 8
-- Minimal number of screen lines to keep above and below the cursor
opt.title = true
-- Title of window set to filename
opt.clipboard = "unnamedplus"
-- Have access to system clipboard. Using the + register for all yank, delete, change and put operations
opt.showbreak = "⤷ "
-- nice display for break lines
opt.breakindent = true
-- Indent wrapped lines to match start
opt.termguicolors = true
-- Enable colours if available
opt.iskeyword:append("-")
-- Treat dash separated words as a word text object
opt.conceallevel = 2
-- Concealed text is completely hidden unless it has a custom replacement character defined
opt.lazyredraw = true
-- The screen will not be redrawn while executing macros, registers and other commands that have not been typed.
opt.list = true
-- Show invisible characters that are in listchars
opt.listchars = {
    tab = "▷⋯",
    trail = "•"
}
-- Characters to show for invisible characters
opt.fillchars = {
    diff = "∙",
    eob = " ",
    fold = "·",
    vert = "┃",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}
-- Characters to use for certain UI elements
opt.signcolumn = "number"
-- Show signcolumns in place of relative line number where appropriate
opt.spelllang = { "en_gb" }
opt.jumpoptions = "view"
-- Restore mark-view where action occured in jumplist
opt.timeoutlen = 500
-- Time in milisecconds to wait for a mapped sequence to complete
opt.laststatus = 2
-- Always show status line
opt.pumblend = 10
-- pseudo-transparency for popup menu
opt.winblend = 10
-- pseudo-transparency for floating windows
opt.switchbuf = "usetab"
-- try to reuse existing tab pages when switching buffers
opt.synmaxcol = 200
-- Don't syntax highlight long lines
opt.equalalways = true
-- always keep windows equal after closing or opening a window

-- Important Defaults
-- *   belloff      -> all
-- *   compatible   -> disabled
-- *   backspace    -> indent,eol,start (which allows unrestricted backspace in insert mode)
-- *   joinspaces   -> disabled
-- *   background   -> dark

-----------------------------
-- -> General file management
-----------------------------

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
-- Automatically save undo history to undofile

-- Important Defaults
-- *    backup       -> off
---------------------------------------
-- ==> Text and Tab options
---------------------------------------
local indent = 4
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.expandtab = true
---------------------------------------
-- ==> Non-opt settings
---------------------------------------

local g = vim.g

g.mapleader = " "
-- Set Space as leader key
g.maplocalleader = ","
-- Set comma as local leader key
g.markdown_fenced_languages = { "python", "lua", "vim", "html", "cpp" }
-- Allow fenced codeblocks ('''<language> --code--''') for given languages
g.loaded_matchparen = 0
-- Disable matchparen plugin
vim.o.whichwrap = vim.o.whichwrap .. "<,>"
-- Wrap movenemnt between lines in N/V modes
