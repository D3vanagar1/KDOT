-- autocommands saved here
local api = vim.api
local o = vim.o
local fn = vim.fn
local cmd = vim.cmd

--------------------------
-- Functions
--------------------------

-- trim trailing whitespaces
function _G.trim_trailing_whitespaces()
	if not o.binary and o.filetype ~= "diff" then
		local current_view = fn.winsaveview()
		cmd([[keeppatterns %s/\s\+$//e]])
		fn.winrestview(current_view)
	end
end

--------------------------
-- Autocommands
--------------------------

-- highlight on yank
local yankGroup = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGroup,
})

-- Remove trailing whitespace on save
api.nvim_create_autocmd("BufWritePre", {
	command = "lua trim_trailing_whitespaces()",
})

-- Resets pane sizes if vim window dimensions are changed
api.nvim_create_autocmd("VimResized", {
	command = "execute 'normal! <c-w>='",
})
