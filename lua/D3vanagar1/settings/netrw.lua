-- Netrw configuration

vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"

-- Open Netrw of current directory in a "Project Drawer" style on the right side
vim.keymap.set("n", "<Leader>nf", ":20Lexplore!<CR>", { silent = true })
