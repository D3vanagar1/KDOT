-- vim API settings

-- visual highlight colour
vim.api.nvim_set_hl(0, 'Visual', { cterm = { reverse = true }, bg = '#800080' })
-- close fold cololurs
vim.api.nvim_set_hl(0, 'Folded', { bg = '#000000', fg = '#C0C0C0' })
vim.api.nvim_set_hl(0, 'FoldedColumn', { bg = '#696969', fg = '#FFFFFF' })
