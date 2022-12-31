-- press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- -1 for jumping backwards.
vim.keymap.set("i", "<silent> <S-Tab>", require("luasnip").jump(-1))

vim.keymap.set("s", "<silent> <Tab>", require("luasnip").jump(1))
vim.keymap.set("s", "<silent> <S-Tab>", require("luasnip").jump(-1))

-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
