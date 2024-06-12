return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'sioyek'
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = 'sioyek'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmgs'
    vim.g.indentLine_setConceal = 0

    -- mappings

    -- counts words in text
    vim.keymap.set('n', '<leader>cw', '<Cmd>VimtexCountWords<CR>', { silent = true })
  end,
}
