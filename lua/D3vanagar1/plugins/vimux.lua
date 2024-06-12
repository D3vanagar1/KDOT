return {
  'preservim/vimux',
  config = function()
    vim.keymap.set('n', '<Leader>vm', ':VimuxRunCommand("clear; python3 ". bufname("%"))<CR>')
  end,
}
