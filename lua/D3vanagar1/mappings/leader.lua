
local opts = {noremap=true, silent=true}
local keymap = vim.api.nvim_set_keymap

-- Set Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
--      normal_mode == "n"
--      insert_mode == "i"
--      visual_mode == "v"
--      visual_block_mode == "x"
--      term_mode == "t"
--      command_mode == "c"

-- Normal--

-- save current file
keymap("n", "<Leader>w", ":w<CR>", opts)
-- Quit from current file
keymap("n", "<Leader>q", ":q<CR>", opts)
-- Quit from current file w/o saving
keymap("n", "<Leader>Q", ":Q<CR>", opts)

-- Making new splits
keymap("n", "<Leader>nh", ":new<space>", opts)
keymap("n", "<Leader>nv", ":vnew<space>", opts)

-- Resizing window
keymap("n", "<Leader>h+", ":resize +5<CR>", opts)
keymap("n", "<Leader>h-", ":resize -5<CR>", opts)
keymap("n", "<Leader>v+", ":vertical resize +5<CR>", opts)
keymap("n", "<Leader>v-", ":vertical resize -5<CR>", opts)

-- Close current buffer tab
keymap("n", "<C-w>", ":bd<CR>", {silent=true})
-- Go to previous buffer
keymap("n", "<Leader>1", ":bp<CR>", {silent=true})
-- Go to next buffer
keymap("n", "<Leader>2", ":bn<CR>", {silent=true})
