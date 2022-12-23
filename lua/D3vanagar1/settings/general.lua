
---------------------------------------
-- ==> General
---------------------------------------

--
-- filetype off
-- set spell                       -- Turns on spell checking

local opt = vim.opt

opt.compatible = false
opt.linebreak = false               -- Don't wrap on word boundary
opt.smartcase = true                -- Ignore lower case for the whole pattern
opt.ignorecase = true               -- Ignore case letters when search
opt.autoindent = true
opt.cursorline = true               -- Highlights text of current line. False in visual mode
opt.smartindent = true              -- Auntoindent new lines
opt.showmatch = true                -- Highlight matching parenthesis
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Show relative line numbers
opt.splitright = true               -- Vertical split to the right
opt.splitbelow = true               -- Horizontal split to the bottom
opt.foldmethod = 'indent'           -- Enable folding on indentation
opt.hlsearch = false                -- Remove highlight when searching
opt.mouse = 'a'                     -- Enable mouse support
opt.showmode = false                -- Don't display current mode in last line
opt.scrolloff = 8                   -- Minimal number of screen lines to keep above and below the cursor
opt.title = true                    -- Title of window set to filename
opt.clipboard = "unnamedplus"       -- Have access to system clipboard. Using the + register for all yank, delete, change and put operations
opt.showbreak = "⤷ "                -- nice display for break lines
opt.breakindent = true              -- Indent wrapped lines to match start
opt.termguicolors = true            -- Enable colours if available
opt.iskeyword:append('-')           -- Treat dash separated words as a word text object
opt.conceallevel = 2                -- Concealed text is completely hidden unless it has a custom replacement character defined

-- Defaults
-- belloff      -> all
-- compatible   -> disabled
-- backspace    -> indent,eol,start (which allows unrestricted backspace in insert mode)
-- joinspaces   -> disabled
-- background   -> dark

-----------------------------
-- -> General file management
-----------------------------

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true                -- Automatically save undo history to undofile

-- Defaults
-- backup       -> off

---------------------------------------
-- ==> Text and Tab options
---------------------------------------

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- visual highlight colour
vim.api.nvim_set_hl(0, 'Visual', {cterm={reverse=true}, bg="#800080"})
-- close fold cololurs
vim.api.nvim_set_hl(0, 'Folded', {bg="#000000", fg="#C0C0C0"})
vim.api.nvim_set_hl(0, 'FoldedColumn', {bg="#696969", fg="#FFFFFF"})
