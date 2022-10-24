
local dap = require "dap"

-- vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint', linehl = 'DapBreakpointLine', numhl = 'DapBreakpointNr' })
vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint', linehl = 'DapBreakpointLine', numhl = 'DapBreakpointNr' })
vim.fn.sign_define('DapStopped',    { text = ' ', texthl = 'DapStopped',    linehl = 'DapStoppedLine',    numhl = 'DapStoppedNr' })
vim.fn.sign_define('DapLogPoint',   { text = 'x',  texthl = 'DapLogPoint',   linehl = 'DapLogPointLine',   numhl = 'DapLogPointNr' })

vim.fn.sign_define('DapBreakpointCondition', { text = 'x', texthl = 'DapBreakpointCondition', linehl = 'DapBreakpointConditionLine', numhl = 'DapBreakpointConditionNr' })
vim.fn.sign_define('DapBreakpointRejected',  { text = 'x', texthl = 'DapBreakpointRejected',  linehl = 'DapBreakpointRejectedLine',  numhl = 'DapBreakpointRejectedNr' })

vim.api.nvim_set_hl(0, "DapLogPoint", { bg = "NONE", fg = "#9EB73D", })

vim.api.nvim_set_hl(0, "DapBreakpoint",     { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "DapBreakpointNr",   { bg = "#232323", fg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "DapBreakpointLine", { bg = "#232323", fg = "NONE", })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapBreakpointRejected",  { bg = "NONE", fg = "#9EB73D", })

vim.api.nvim_set_hl(0, "DapStopped",     { bg = "#292929", fg = "#AFC460", })
vim.api.nvim_set_hl(0, "DapStoppedNr",   { bg = "#292929", fg = "#AFC460", italic = true })
vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#292929", fg = "NONE", })

-- dap.adapters.python = {
--     type = 'executable';
--     command = '/usr/bin/env python';
--     args = { '-m', 'debugpy.adapter' };
-- }

-- dap.configurations.python = {
--     {
--         -- The first three options are required by nvim-dap
--         type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
--         request = 'launch';
--         name = "Launch file";
--
--         -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--
--         program = "${file}"; -- This configuration will launch the current file if used.
--         pythonPath = function()
--             -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--             -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--             -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--             local cwd = vim.fn.getcwd()
--             if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
--                 return cwd .. '/venv/bin/python'
--             elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
--                 return cwd .. '/.venv/bin/python'
--             else
--                 return '/usr/bin/python'
--             end
--         end;
--     },
-- }

-- dap.adapters.codelldb = {
--     type = 'server',
--     port = "${port}",
--     host = "127.0.0.1",
--     executable = {
--         -- ABSOLUTE PATH!!!
--         command = '/home/nex/.local/share/nvim/mason/bin/codelldb',
--         args = {"--port", "${port}"},
--     }
-- }
--
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "codelldb",
--         request = "launch",
--         program = function()
--             vim.cmd ":w"
--
--             local dir = vim.fn.expand("%:p:h")
--             local fileName = vim.fn.expand("%:t")
--             local fileNameWithoutExt = vim.fn.expand("%:t:r")
--
--             vim.fn.system("cd "..dir.." && clang -std=gnu2x -g "..fileName.." -I ./ ".."-o ./bin/"..fileNameWithoutExt)
--
--             return vim.fn.expand("%:p:h") .. '/bin/' .. vim.fn.expand("%:t:r")
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = true,
--     },
-- }
--
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

-- dap.adapters.cppdbg = {
--     id = 'cppdbg',
--     type = 'executable',
--     command = '/home/nex/.local/share/nvim/mason/bin/OpenDebugAD7',
-- }
--
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "cppdbg",
--         request = "launch",
--         program = function()
--             vim.cmd ":w"
--
--             local dir = vim.fn.expand("%:p:h")
--             local fileName = vim.fn.expand("%:t")
--             local fileNameWithoutExt = vim.fn.expand("%:t:r")
--
--             vim.fn.system("cd "..dir.." && clang -std=gnu2x -g "..fileName.." -I ./ ".."-o ./bin/"..fileNameWithoutExt)
--
--             return vim.fn.expand("%:p:h") .. '/bin/' .. vim.fn.expand("%:t:r")
--         end,
--         cwd = '${workspaceFolder}',
--         stopAtEntry = true,
--     },
--     {
--         name = 'Attach to gdbserver :1234',
--         type = 'cppdbg',
--         request = 'launch',
--         MIMode = 'gdb',
--         miDebuggerServerAddress = 'localhost:1234',
--         miDebuggerPath = '/usr/bin/gdb',
--         cwd = '${workspaceFolder}',
--         program = function()
--             vim.cmd ":w"
--
--             local dir = vim.fn.expand("%:p:h")
--             local fileName = vim.fn.expand("%:t")
--             local fileNameWithoutExt = vim.fn.expand("%:t:r")
--
--             vim.fn.system("cd "..dir.." && clang -std=gnu2x -g "..fileName.." -I ./ ".."-o ./bin/"..fileNameWithoutExt)
--
--             return vim.fn.expand("%:p:h") .. '/bin/' .. vim.fn.expand("%:t:r")
--         end,
--     },
-- }
--
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function ()
            local dir = vim.fn.expand("%:p:h")
            local fileName = vim.fn.expand("%:t")
            local fileNameWithoutExt = vim.fn.expand("%:t:r")

            vim.cmd ":w"
            vim.fn.system("cd "..dir.." && clang -std=gnu2x -g "..fileName.." -I ./ ".."-o ./bin/"..fileNameWithoutExt)

            -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            -- return vim.fn.input('Path to executable: ', vim.fn.expand("%:p:h") .. '/bin/' .. vim.fn.expand("%:t:r"), 'file')
            return vim.fn.expand("%:p:h") .. '/bin/' .. vim.fn.expand("%:t:r")
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}

require "dap.ext.vscode".load_launchjs(nil, { cppdbg = {'c', 'cpp'} })

dap.configurations.c = dap.configurations.cpp

-- dap.configurations.lua = {
--     {
--         type = 'nlua',
--         request = 'attach',
--         name = "Attach to running Neovim instance",
--         host = '127.0.0.1',
--         port = 8088,
--     }
-- }
--
-- dap.adapters.nlua = function (callback, config)
--     callback({ type = 'server', host = config.host, port = config.port })
-- end
--
-- vim.keymap.set('n', '<F3>', require "osv".run_this, { noremap = true, silent = true })

vim.keymap.set('n', '<C-d>', dap.continue,  { noremap = true, silent = true, buffer = true })
-- vim.keymap.set('n', '<A-o>', dap.step_out,  { noremap = true, silent = true, buffer = true })
-- vim.keymap.set('n', '<A-i>', dap.step_into, { noremap = true, silent = true, buffer = true })
-- vim.keymap.set('n', '<C-s>', dap.terminate, { noremap = true, silent = true, buffer = true })
-- vim.keymap.set('n', '<A-j>', dap.step_over, { noremap = true, silent = true, buffer = true })
-- vim.keymap.set('n', '<TAB>', dap.step_over, { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', ';;'   , dap.toggle_breakpoint, { noremap = true, silent = true, buffer = true })

dap.listeners.after.event_initialized['dap.keys'] = function()
    vim.keymap.set("n", "j", dap.step_over, { noremap = true, silent = true })
    vim.keymap.set("n", "o", dap.step_out,  { noremap = true, silent = true })
    vim.keymap.set("n", "i", dap.step_into, { noremap = true, silent = true })
    vim.keymap.set("n", "s", dap.terminate, { noremap = true, silent = true })
    vim.keymap.set("n", "q", dap.terminate, { noremap = true, silent = true })
    vim.keymap.set("n", "c", dap.continue,  { noremap = true, silent = true })
    -- vim.keymap.set("n", "H", "<C-w>h", { noremap = true, silent = true })
    -- vim.keymap.set("n", "J", "<C-w>j", { noremap = true, silent = true })
    -- vim.keymap.set("n", "K", "<C-w>k", { noremap = true, silent = true })
    -- vim.keymap.set("n", "L", "<C-w>l", { noremap = true, silent = true })
end
local reset_keys = function()
    pcall(vim.keymap.del, "n", "j")
    pcall(vim.keymap.del, "n", "q")
    pcall(vim.keymap.del, "n", "o")
    pcall(vim.keymap.del, "n", "i")
    pcall(vim.keymap.del, "n", "s")
    pcall(vim.keymap.del, "n", "c")
    -- pcall(vim.keymap.del, "n", "H")
    -- pcall(vim.keymap.del, "n", "J")
    -- pcall(vim.keymap.del, "n", "K")
    -- pcall(vim.keymap.del, "n", "L")
end

dap.listeners.after.event_terminated['dap.keys'] = reset_keys
dap.listeners.after.disconnected['dap.keys'] = reset_keys
