return {
  'kaarmu/typst.vim',
  ft = 'typst',
  lazy = false,
  config = function()
    vim.g.typst_pdf_viewer = 'sioyek'
    vim.g.typst_folding = 1
    vim.g.typst_foldnested = 1
  end,
}
-- TODO:
--  -- keymap for :TypstWatch (maybe linked to typst-preview)
