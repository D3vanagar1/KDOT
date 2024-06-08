vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmgs"
vim.g.indentLine_setConceal = 0

local opts = { silent = true }

-- nvim-cmp setup
  require('cmp').setup.buffer {
    formatting = {
      format = function(entry, vim_item)
          vim_item.menu = ({
            omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
            buffer = "[Buffer]",
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
vim.keymap.set("n", "<leader>cw", "<Cmd>VimtexCountWords<CR>", opts)

-- Import default vimtex mappings
--
-- <localleader> mappings [Note: <localleader> is ,]:
--
-- <localleader>ll  |<plug>(vimtex-compile)
-- <localleader>lL  |<plug>(vimtex-compile-selected)
-- <localleader>lo  |<plug>(vimtex-compile-output)
-- <localleader>lc  |<plug>(vimtex-clean)
--
-- deleting/chainging content:
-- dse  |<plug>(vimtex-env-delete) -> deletes surrounding environment
-- cse  |<plug>(vimtex-env-change) -> changes surrounding environment
--
-- dsc  |<plug>(vimtex-arg-delete) -> deletes surrounding command
-- csc  |<plug>(vimtex-arg-change) -> deletes surrounding command
--
-- toggling content:
-- ts$  |<plug>(vimtex-env-toggle-math) -> toggle between inline and display math
--
-- navigation:
-- % -> move between matching delimiters, inline-math delimiters, and environments
-- ]] -> move to next section
-- [[ -> move to previous section
