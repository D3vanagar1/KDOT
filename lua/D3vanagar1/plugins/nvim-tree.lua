


-- Default Actions
--- `<CR>` or `o` on `..` will cd in the above directory
-- `<C-]>` will cd in the directory under the cursor
-- `<BS>` will close current opened directory or parent
-- type `a` to add a file. Adding a directory requires leaving a leading `/` at the end of the path.
-- > you can add multiple directories by doing foo/bar/baz/f and it will add foo bar and baz directories and f as a file
-- type `r` to rename a file
-- type `<C-r>` to rename a file and omit the filename on input
-- type `x` to add/remove file/directory to cut clipboard
-- type `c` to add/remove file/directory to copy clipboard
-- type `y` will copy name to system clipboard
-- type `Y` will copy relative path to system clipboard
-- type `gy` will copy absolute path to system clipboard
-- type `p` to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
-- type `d` to delete a file (will prompt for confirmation)
-- type `]c` to go to next git item
-- type `[c` to go to prev git item
-- type `-` to navigate up to the parent directory of the current file/directory
-- type `s` to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see `:h nvim-tree.setup` under `system_open`)
-- if the file is a directory, `<CR>` will open the directory otherwise it will open the file in the buffer near the tree
-- if the file is a symlink, `<CR>` will follow the symlink (if the target is a file)
-- `<C-v>` will open the file in a vertical split
-- `<C-x>` will open the file in a horizontal split
-- `<C-t>` will open the file in a new tab
-- `<Tab>` will open the file as a preview (keeps the cursor in the tree)
-- `I` will toggle visibility of folders hidden via |g:nvim_tree_ignore|
-- `H` will toggle visibility of dotfiles (files/folders starting with a `.`)
-- `R` will refresh the tree
-- Double left click acts like `<CR>`
-- Double right click acts like `<C-]>`


-- mapping
local opts = {noremap=true, silent=true}
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>"}, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
}
