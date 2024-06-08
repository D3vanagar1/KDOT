local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "help", "python", "cpp", "c", "lua", "markdown", "go" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "latex" },
        additional_vim_regex_highlighting = { "latex", "markdown" },
    },
    indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines
        -- colors = {}, -- table of hex strings
        -- -- termcolors = {} -- table of colour name strings
    },
})
