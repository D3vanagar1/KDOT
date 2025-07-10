return {
  'nvim-neorg/neorg',
  dependencies = { 'luarocks.nvim' },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = { -- Adds pretty icons to documents
          config = {
            icon_preset = 'varied',
            icons = {
              todo = {
                done = { icon = '✓' },
                pending = { icon = '▶' },
                uncertain = { icon = '⁇' },
                on_hold = { icon = '⏸' },
                cancelled = { icon = '⏏' },
                undone = { icon = 'x' },
              },
            },
            init_open_folds = 'auto',
          },
        },
        ['core.highlights'] = {}, -- Manage highlight groups
        ['core.export'] = { -- Exports Neorg docs into any other supported filetype
          config = {
            export_dir = '~/Documents/notes/neorg-export',
          },
        },
        ['core.integrations.treesitter'] = { -- integrate treesitter with neorg
          config = {
            configure_parsers = true,
            install_package = true,
          },
        },
        ['core.completion'] = { -- Wrapper for completion engines
          config = {
            engine = 'nvim-cmp',
          },
        },
        ['core.integrations.nvim-cmp'] = {}, -- integrating nvm-cmp with neorg
        ['core.integrations.telescope'] = {}, -- integrating nvm-cmp with neorg
        ['core.dirman'] = { -- Manages Neorg workspace directories
          config = {
            workspaces = {
              notes = '~/Documents/notes',
              lecture_notes = '~/Documents/class/FALL_2023/CMNS258/lecture_notes',
            },
          },
        },
      },

      require('neorg.core.callbacks').on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode('norg', {
          n = { -- Bind keys in normal mode
            { '<C-s>', 'core.integrations.telescope.find_linkable' },
          },

          i = { -- Bind in insert mode
            { '<C-p>', 'core.integrations.telescope.insert_link' },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end),
    }
  end,
}
