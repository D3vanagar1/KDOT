
local dap = require('dap')

--intialize adapters

dap.adapters.python = {
    type = 'executable';
    command = '~/Library/Application Support/virtualenv/debugpy/bin/python';
    args = {'-m', 'debugpy.adapter'};
}
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/usr/local/bin/codelldb/extension/adapter/codelldb',
        args = {"--port", "${port}"},
    }
}

-- adapter configuration

dap.configurations.python = {
    {
        -- first 3 are required by nvim-dap
        type = 'python'; -- establishes link to adapter definition
        request = 'launch';
        name = "Launch file";

        --options for debugpy
        program = "${file}"; -- launch current file
        pythonPath = function()
            -- code below looks for a 'venv' or '.venv' folder in current directory and uses the python within
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. 'venv/bin/python'
            elseif vim.fun.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return 'usr/local/bin/python3'
            end
        end;
    },
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


-- dap symbols
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})


-- keymappings
-- vim.keymap.set('n', "<leader>dh", function() dap.toggle_breakpoint() end)
-- vim.keymap.set('n', "<leader>dk", function() dap.continue() end)
-- vim.keymap.set('n', "<leader>dl", function() dap.run_last() end)
