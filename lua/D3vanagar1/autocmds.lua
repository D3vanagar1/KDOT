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

-- FIX: some lines keep black background on refocus

-- Enabled/Disable Focus depending on selected pane
-- From Greg Hurrell's github
-- https://github.com/wincent/wincent/blob/4578e56cc23/roles/dotfiles/files/.vim/autoload/autocmds.vim#L39-L76
--
-- Apply "blinds" to non-selected panes (improved focus)
if (vim.g.loaded_blinds and vim.g.loaded_blinds ~= 0) or vim.o.cp then
  return
end
vim.g.loaded_blinds = 1

if vim.g.blinds_guibg == nil then
  vim.g.blinds_guibg = 'Black'
end

local function SetBlinds()
  vim.cmd('hi Blinds guibg=' .. vim.g.blinds_guibg)
end

local blinds_augroup = vim.api.nvim_create_augroup('blinds', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = function()
    vim.wo.winhighlight = ''
    Focus_window()
  end,
  group = blinds_augroup,
})

vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  callback = function()
    if vim.bo.buflisted then
      vim.wo.winhighlight =
        'Normal:Blinds,ColorColumn:Blinds,CursorColumn:Blinds,CursorLine:Blinds,EndOfBuffer:Blinds,LineNr:Blinds,NonText:Blinds,FoldColumn:Blinds,SignColumn:Blinds,VertSplit:Blinds,Whitespace:Blinds'
      Blur_window()
    end
  end,
  group = blinds_augroup,
})

vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', callback = SetBlinds, group = blinds_augroup })

SetBlinds()

-- Blur window
function Blur_window()
  if vim.w.karan_matches == nil then
    vim.w.karan_matches = {}
  end
  local height = vim.api.nvim_win_get_height(0)
  local slop = math.floor(height / 2)
  local start = math.max(1, vim.fn.line 'w0' - slop)
  local _end = math.min(vim.fn.line '$', vim.fn.line 'w$' + slop)
  while start <= _end do
    local next = start + 8
    local id = vim.fn.matchaddpos('Blinds', { { start, 0 }, { math.min(_end, next), 0 } }, 1000)
    table.insert(vim.w.karan_matches, id)
    start = next
  end
end

-- Focus window
function Focus_window()
  if vim.w.karan_matches ~= nil then
    for _, match in ipairs(vim.w.karan_matches) do
      pcall(vim.fn.matchdelete, match)
    end
    vim.w.karan_matches = {}
  end
end
