local opts = { silent = true }

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

-- Making new splits
vim.keymap.set("n", "<Leader>_", ":sp ./<CR>", opts)
vim.keymap.set("n", "<Leader>|", ":vsp ./<CR>", opts)

-- Resizing window
vim.keymap.set("n", "<Leader>h+", ":resize +5<CR>", opts)
vim.keymap.set("n", "<Leader>h-", ":resize -5<CR>", opts)
vim.keymap.set("n", "<Leader>v+", ":vertical resize +5<CR>", opts)
vim.keymap.set("n", "<Leader>v-", ":vertical resize -5<CR>", opts)

-- Close current buffer tab
vim.keymap.set("n", "<C-x>", ":bd<CR>", opts)
-- Go to previous buffer
vim.keymap.set("n", "<Leader>1", ":bp<CR>", opts)
-- Go to next buffer
vim.keymap.set("n", "<Leader>2", ":bn<CR>", opts)

-- Open file in zathura (pdf viewer)
vim.keymap.set("n", "<leader>z", ":!zathura %:r.pdf &<CR>")

-- paste over without loosing current paste buffer
vim.keymap.set("x", "<Leader>p", '"_dP')
