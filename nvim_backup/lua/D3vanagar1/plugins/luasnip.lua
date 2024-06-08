local ls = require("luasnip")
-- expand current item or jump to next item within snippet
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-g>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
