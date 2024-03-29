-- Rest of the general mappings

-- Shift+Tab unindents a line in insert mode
vim.keymap.set("i", "<S-Tab>", "<Esc><<i", { silent = true })
-- While in normal mode, open and close current fold with Tab
vim.keymap.set("n", "<Tab>", "za")

-- Keep screen centered for these vim motions
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- Set default search to be "very magic" mode for reg exprs
-- TODO: doesn't work in lua
-- vim.keymap.set("n", "/", "/\v")
-- vim.keymap.set("v", "/", "/\v")

-- Moving text (move text up/down with k/j)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==i")
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==i")
vim.keymap.set("n", "<Leader>j", ":m .+1<CR>==")
vim.keymap.set("n", "<Leader>k", ":m .-2<CR>==")

-- enter new project without leaving vim
-- TODO: If opening new project, should open in vim
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")
