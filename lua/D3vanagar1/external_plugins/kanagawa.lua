return {
  'rebelot/kanagawa.nvim',
  config = function()
    require('kanagawa').setup {
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      variablebuiltinStyle = { italic = true },
      specialReturn = true, -- special highlight for the return keyword
      specialException = true, -- special highlight for exception handling keywords
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      globalStatus = false, -- adjust window separators highlight for laststatus=3
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none', -- remove gutter background
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- transparent floating windows
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          MasonNormal = { bg = theme.ui.big_m3, fg = theme.ui.fg_dim },

          -- borderless telescope
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          -- uniform colours for popup menu
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
      theme = 'wave', -- Load "default" theme or the experimental "light" theme
      background = {
        dark = 'wave',
        light = 'dragon',
      },
    }
  end,
}
