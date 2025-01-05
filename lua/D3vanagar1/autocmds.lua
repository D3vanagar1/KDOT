-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('YankHighlght', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace on save',
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

-- Resets pane sizes if vim window dimensions are changed
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'resets pane sizes when window dimensions are changed',
  callback = function()
    vim.cmd 'wincmd ='
  end,
})

-- Set relative line number only in focused pane
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = { '*' },
  callback = function()
    vim.wo.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd('WinLeave', {
  pattern = { '*' },
  callback = function()
    vim.wo.relativenumber = false
  end,
})

-- only show ghost text for nvim-cmp at word boundaries
-- not inside keyword
-- source: https://github.com/hrsh7th/nvim-cmp/issues/2035#issuecomment-2347186210
local config = require 'cmp.config'
local toggoel_ghost_text = function()
  if vim.api.nvim_get_mode().mode ~= 'i' then
    return
  end
  local cursor_col = vim.fn.col '.'
  local current_lin_contents = vim.fn.getline '.'
  local char_after_cursor = current_lin_contents:sub(cursor_col, cursor_col)

  local should_enable_ghost_text = char_after_cursor == '' or vim.fn.match(char_after_cursor, [[\k]]) == -1

  local current = config.get().experimental.ghost_text
  if current ~= should_enable_ghost_text then
    config.set_global {
      experimental = {
        ghost_text = should_enable_ghost_text,
      },
    }
  end
end

vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMovedI' }, {
  callback = toggoel_ghost_text,
})

-- Enabled/Disable Focus depending on selected pane
-- Inspired by Greg Hurrell's focus/unfocusing

-- Function to set highlights
local function set_highlights()
  local fg_colour = '#5c6370'
  local bg_colour = '#1e1e1e'
  local cmt_colour = '#4b5363'
  local highlight_groups = {
    { name = 'WinBlindsNormal', bg = bg_colour, fg = fg_colour },
    { name = 'WinBlindsComment', bg = bg_colour, fg = cmt_colour },
    { name = 'WinBlindsIdentifier', bg = bg_colour, fg = fg_colour },
    { name = 'WinBlindsString', bg = bg_colour, fg = fg_colour },
    { name = 'WinBlindsFunction', bg = bg_colour, fg = #fg_colour },
    { name = 'WinBlindsKeyword', bg = bg_colour, fg = fg_colour },
    -- Add more as needed
  }

  for _, group in ipairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group.name, { bg = group.bg, fg = group.fg })
  end
end

-- Function to apply 'blinds' effect to unfocused windows
local function apply_blinds()
  set_highlights() -- Ensure highlights are set
  local current_win = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= current_win then
      vim.api.nvim_win_call(win, function()
        vim.wo.winhighlight = table.concat({
          'Normal:WinBlindsNormal',
          'Comment:WinBlindsComment',
          'Identifier:WinBlindsIdentifier',
          'String:WinBlindsString',
          'Function:WinBlindsFunction',
          'Keyword:WinBlindsKeyword',
          -- Add more as needed
        }, ',')
      end)
    else
      vim.api.nvim_win_call(win, function()
        vim.wo.winhighlight = 'Normal:Normal'
      end)
    end
  end
end

-- Autocommand for when a window gains focus
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  callback = apply_blinds,
})

-- Autocommand for when a window loses focus
vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  callback = apply_blinds,
})

-- Initial application of 'blinds' effect to set it up on startup
apply_blinds()
