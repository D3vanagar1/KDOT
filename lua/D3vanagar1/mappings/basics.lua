-- Rest of the general mappings

-- Shift+Tab unindents a line in insert mode
vim.keymap.set('i', '<S-Tab>', '<Esc><<i', { silent = true })
-- While in normal mode, open and close current fold with Tab
vim.keymap.set('n', '<Tab>', 'za')

-- Keep screen centered for these vim motions
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '%', '%zzzv')

-- Set default search to be "very magic" mode for reg exprs
-- TODO: doesn't work in lua
-- vim.keymap.set("n", "/", "/\v")
-- vim.keymap.set("v", "/", "/\v")

-- Moving text (move text up/down with k/j)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('i', '<C-j>', '<esc>:m .+1<CR>==i')
vim.keymap.set('i', '<C-k>', '<esc>:m .-2<CR>==i')
vim.keymap.set('n', '<Leader>j', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<Leader>k', ':m .-2<CR>==', { desc = 'Move line up' })

-- enter new project without leaving vim
-- TODO: If opening new project, should open in vim
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tms<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- correct spelling of most recent mistake in file
vim.keymap.set('i', '<C-s>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { desc = 'fix spelling' })

-- basic saving and quitting file shortcuts
vim.keymap.set('n', ';w', ':w<CR>', { desc = 'Write current file' })
vim.keymap.set('n', ';q', ':wq<CR>', { desc = 'Exit current file' })
vim.keymap.set('n', ';Q', ':q!<CR>', { desc = 'Exit without saving' })
