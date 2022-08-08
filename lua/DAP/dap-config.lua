
local dap = require "dap"

vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint', linehl = 'DapBreakpointLine', numhl = 'DapBreakpointNr' })
vim.fn.sign_define('DapStopped',    { text = ' ', texthl = 'DapStopped',    linehl = 'DapStoppedLine',    numhl = 'DapStoppedNr' })
vim.fn.sign_define('DapLogPoint',   { text = 'x',  texthl = 'DapLogPoint',   linehl = 'DapLogPointLine',   numhl = 'DapLogPointNr' })

vim.fn.sign_define('DapBreakpointCondition', { text = 'x', texthl = 'DapBreakpointCondition', linehl = 'DapBreakpointConditionLine', numhl = 'DapBreakpointConditionNr' })
vim.fn.sign_define('DapBreakpointRejected',  { text = 'x', texthl = 'DapBreakpointRejected',  linehl = 'DapBreakpointRejectedLine',  numhl = 'DapBreakpointRejectedNr' })

dap.adapters.python = {
    type = 'executable';
    command = '/usr/bin/env python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file";

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end;
    },
}

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
            vim.fn.system("cd "..dir.." && clang -g "..fileName.." -I ./ ".."-o ./bin/"..fileNameWithoutExt)

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

vim.keymap.set('n', '<C-d>', dap.continue, { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', '<C-o>', dap.step_out, { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', '<C-i>', dap.step_into, { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', '<C-s>', dap.terminate, { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', '<C-j>', dap.step_over, { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', '<TAB>', dap.step_over, { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', ';;', dap.toggle_breakpoint, { noremap = true, silent = true, buffer = true })

