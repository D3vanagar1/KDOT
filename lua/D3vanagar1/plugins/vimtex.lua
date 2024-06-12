return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'sioyek'
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = 'sioyek'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmgs'
    vim.g.indentLine_setConceal = 0
    require('cmp').setup.buffer {
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            omni = (vim.inspect(vim_item.menu):gsub('%"', '')),
            buffer = '[Buffer]',
            -- formatting for other sources
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = 'omni' },
        { name = 'buffer' },
        -- other sources
      },
    }

    -- mappings

    -- counts words in text
    vim.keymap.set('n', '<leader>cw', '<Cmd>VimtexCountWords<CR>', { silent = true })
  end,
}
