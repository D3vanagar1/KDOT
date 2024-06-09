local opts = { silent = true }

-- Making new splits
vim.keymap.set('n', '<Leader>_', ':sp ./<CR>', opts)
vim.keymap.set('n', '<Leader>|', ':vsp ./<CR>', opts)

-- Resizing window
vim.keymap.set('n', '<Leader>h+', ':resize +5<CR>', opts)
vim.keymap.set('n', '<Leader>h-', ':resize -5<CR>', opts)
vim.keymap.set('n', '<Leader>v+', ':vertical resize +5<CR>', opts)
vim.keymap.set('n', '<Leader>v-', ':vertical resize -5<CR>', opts)

-- paste over without loosing current paste buffer
vim.keymap.set('x', '<Leader>p', '"_dP')

-- Open file in zathura (pdf viewer)
vim.keymap.set('n', '<leader>z', ':!zathura %:r.pdf &<CR>')
