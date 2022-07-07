
-- Rest of the general mappings

local opts = {noremap=true, silent=true}
local keymap = vim.api.nvim_set_keymap

-- ^ is very annoying to press from home row. And I never use K for help
keymap("n", "K", "^", opts)
-- Shift+Tab unindents a line in insert mode
keymap("i", "<S-Tab>", "<Esc><<i", {silent=true})
-- While in normal mode, open and close current fold with Tab
keymap("n", "<Tab>", "za", opts)

-- Keep screen centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Set default search to be "very magic" mode for reg exprs
-- keymap("n", "/", "/\v", opts)
-- keymap("v", "/", "/\v", opts)

-- Moving text (move text up/down with k/j)
keymap("v", "J", ":m `>+1<CR>gv=gv", opts)
keymap("v", "K", ":m `>-2<CR>gv=gv", opts)
keymap("i", "<C-j>", ":<esc>:m .+1<CR>==i", opts)
keymap("i", "<C-k>", ":<esc>:m .-2<CR>==i", opts)
keymap("n", "<Leader>j", ":m .+1<CR>==", opts)
keymap("n", "<Leader>k", ":m .-2<CR>==", opts)
