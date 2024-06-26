return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<Leader>a', mark.add_file, { desc = 'Harpoon: add file' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Harpoon: file menu' })

    vim.keymap.set('n', '<C-b>', function()
      ui.nav_file(1)
    end)
    vim.keymap.set('n', '<C-n>', function()
      ui.nav_file(2)
    end)
    vim.keymap.set('n', '<C-m>', function()
      ui.nav_file(3)
    end)
    vim.keymap.set('n', '<C-,>', function()
      ui.nav_file(4)
    end)
  end,
}
