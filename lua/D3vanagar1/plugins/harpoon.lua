local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<Leader>a", mark.add_file)
vim.keymap.set("n", "©", ui.toggle_quick_menu) -- © is the mac key code for alt+g

vim.keymap.set("n", "˙", function() -- ˙ is the mac key code for alt+h
	ui.nav_file(2)
end)

vim.keymap.set("n", "∆", function() -- ∆ is the mac key code for alt+j
	ui.nav_file(2)
end)
vim.keymap.set("n", "˚", function() -- ˚ is the mac key code for alt+k
	ui.nav_file(3)
end)
vim.keymap.set("n", "¬", function() -- ¬ is the mac key code for alt+l
	ui.nav_file(4)
end)
