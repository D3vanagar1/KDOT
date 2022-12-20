
local opts = {silent=true}

-- Set Space as leader key
-- vim.keymap.set("", "<Space>", "<Nop>", opts)
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
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
-- Quit from current file
vim.keymap.set("n", "<Leader>q", ":q<CR>", opts)
-- Quit from current file w/o saving
vim.keymap.set("n", "<Leader>Q", ":Q<CR>", opts)

-- Making new splits
vim.keymap.set("n", "<Leader>nh", ":new<space>", opts)
vim.keymap.set("n", "<Leader>nv", ":vnew<space>", opts)

-- Resizing window
vim.keymap.set("n", "<Leader>h+", ":resize +5<CR>", opts)
vim.keymap.set("n", "<Leader>h-", ":resize -5<CR>", opts)
vim.keymap.set("n", "<Leader>v+", ":vertical resize +5<CR>", opts)
vim.keymap.set("n", "<Leader>v-", ":vertical resize -5<CR>", opts)

-- Close current buffer tab
vim.keymap.set("n", "<C-w>", ":bd<CR>", opts)
-- Go to previous buffer
vim.keymap.set("n", "<Leader>1", ":bp<CR>", opts)
-- Go to next buffer
vim.keymap.set("n", "<Leader>2", ":bn<CR>", opts)

-- Open Netrw of current directory
vim.keymap.set("n", "<Leader>nf", vim.cmd.Ex, opts)

-- Open file in zathura (pdf viewer)
vim.keymap.set("n", "<leader>z", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>", opts)

-- paste over without loosing current paste buffer
vim.keymap.set("x", "<Leader>p", "\"_dP")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
