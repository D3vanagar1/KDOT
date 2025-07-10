return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    local lsp_kinds = {
      Class = ' ',
      Color = ' ',
      Constant = ' ',
      Constructor = ' ',
      Enum = ' ',
      EnumMember = ' ',
      Event = ' ',
      Field = ' ',
      File = ' ',
      Folder = ' ',
      Function = ' ',
      Interface = ' ',
      Keyword = ' ',
      Method = ' ',
      Module = ' ',
      Operator = ' ',
      Property = ' ',
      Reference = ' ',
      Snippet = ' ',
      Struct = ' ',
      Text = ' ',
      TypeParameter = ' ',
      Unit = ' ',
      Value = ' ',
      Variable = ' ',
    }

    -- insert vs replace completion text
    -- inspired by: https://github.com/wincent/wincent/blob/64947cd9efc70844ee6f1a1d44dd381a3ec6569a/aspects/nvim/files/.config/nvim/after/plugin/nvim-cmp.lua#L192
    -- Until https://github.com/hrsh7th/nvim-cmp/issues/1716
    -- (cmp.ConfirmBehavior.MatchSuffix) gets implemented, use this local wrapper
    -- to choose between `cmp.ConfirmBehavior.Insert` and
    -- `cmp.ConfirmBehavior.Replace`:
    local confirm = function(entry)
      local behavior = cmp.ConfirmBehavior.Replace
      if entry then
        local completion_item = entry.completion_item
        local newText = ''
        if completion_item.textEdit then
          newText = completion_item.textEdit.newText
        elseif type(completion_item.insertText) == 'string' and completion_item.insertText ~= '' then
          newText = completion_item.insertText
        else
          newText = completion_item.word or completion_item.label or ''
        end

        --safely retrieve the cursor and context info
        local after_line = entry.context.cursor_after_line or ''

        -- How many characters will be different after the cursor position if we replace?
        -- calculate text difference
        if completion_item.textEdit and completion_item.textEdit.range then
          local range = completion_item.textEdit.range
          local start_char = range.start.character + 1
          local end_char = range['end'].character + 1
          local diff_after = end_char - start_char

          -- Does the text that will be replaced after the cursor match the suffix
          -- of the 'newText' to be inserted? If not, we should 'Insert' instead.
          if after_line:sub(1, diff_after) ~= newText:sub(-diff_after) then
            behavior = cmp.ConfirmBehavior.Insert
          end
        end
      end
      cmp.confirm { select = true, behavior = behavior }
    end

    luasnip.config.setup {}

    cmp.setup {
      experimental = {
        ghost_text = true,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s %s', lsp_kinds[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            nvim_lua = '[Lua]',
            latex_symbols = '[Latex]',
          })[entry.source.name]
          return vim_item
        end,
      },
      window = {
        completion = cmp.config.window.bordered {
          border = 'single',
          col_offset = -1,
          scrollbar = false,
          scrolloff = 3,
          -- Default for bordered() is 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
          -- Default for non-bordered, which we'll use here, is:
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        },
        documentation = cmp.config.window.bordered {
          border = 'solid',
          scrollbar = false,
          -- Default for bordered() is 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
          -- Default for non-bordered is 'FloatBorder:NormalFloat'
          -- Suggestion from: https://github.com/hrsh7th/nvim-cmp/issues/2042
          -- is to use 'NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
          -- but this also seems to suffice:
          winhighlight = 'CursorLine:Visual,Search:None',
        },
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            confirm(entry)
          else
            fallback()
          end
        end, { 'i', 's' }),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'neorg' },
        { name = 'vimtex' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 4 },
      },

      cmdline = {
        { '/', mapping = cmp.mapping.preset.cmdline(), sources = {
          name = 'buffer',
        } },
        {
          ':',
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' },
          }, {
            { name = 'cmdline' },
          }),
        },
      },
    }
  end,
}
