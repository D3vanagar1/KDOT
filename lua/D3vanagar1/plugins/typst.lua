return {
  'kaarmu/typst.vim',
  ft = 'typst',
  lazy = false,
  config = function()
    vim.g.typst_pdf_viewer = 'sioyek'
  end,
}
-- TODO:
--  -- keymap for :TypstWatch (maybe linked to typst-preview)
--  -- fix nvim-cmp ghost-text error when in math mode
