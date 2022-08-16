
local dapui = require "dapui"

dapui.setup {
    icons = { expanded = "+", collapsed = "-" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open   = 'o',
        remove = 'x',
        edit   = 'e',
        repl   = 'r',
        toggle = 't',
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    }
}

local dap = require "dap"

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.api.nvim_set_hl(0, "NvimDapVirtualText", { bg = "NONE", fg = "#484848", })
vim.api.nvim_set_hl(0, "NvimDapVirtualTextChanged", { bg = "NONE", fg = "#484848", })
    vim.api.nvim_set_hl(0, "NvimDapVirtualTextError", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "NvimDapVirtualTextInfo", { bg = "NONE", fg = "#9EB73D", })

vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = "#232323", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "DapBreakpointNr", { bg = "#232323", fg = "#6F6F6F", italic = true })
vim.api.nvim_set_hl(0, "DapBreakpointLine", { bg = "#232323", fg = "NONE", })

vim.api.nvim_set_hl(0, "DapStopped", { bg = "#292929", fg = "#D0EE7A", })
vim.api.nvim_set_hl(0, "DapStoppedNr", { bg = "#292929", fg = "#D0EE7A", })
vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#292929", fg = "NONE", })

vim.api.nvim_set_hl(0, "DapLogPoint", { bg = "NONE", fg = "#9EB73D", })

vim.api.nvim_set_hl(0, "DapUILineNumber", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapUIDecoration", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapUIFrameName", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapUIFloatBorder", { bg = "NONE", fg = "#353535", })

vim.api.nvim_set_hl(0, "DapUIType", { bg = "NONE", fg = "#C53B82", bold = true, italic = true })
vim.api.nvim_set_hl(0, "DapUIScope", { bg = "NONE", fg = "#AF87D7", bold = true, italic = true })
vim.api.nvim_set_hl(0, "DapUIValue", { bg = "NONE", fg = "#AF87D7", })
vim.api.nvim_set_hl(0, "DapUISource", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "DapUIThread", { bg = "NONE", fg = "#008FBF", italic = true })
vim.api.nvim_set_hl(0, "DapUIVariable", { bg = "NONE", fg = "#9EB73D", italic = true })

vim.api.nvim_set_hl(0, "DapUIWatchesEmpty", { bg = "NONE", fg = "#AF87D7", })
vim.api.nvim_set_hl(0, "DapUIWatchesError", { bg = "NONE", fg = "#AF87D7", })
vim.api.nvim_set_hl(0, "DapUIWatchesValue", { bg = "NONE", fg = "#AF87D7", })
vim.api.nvim_set_hl(0, "DapUIModifiedValue", { bg = "NONE", fg = "#AF87D7", })
vim.api.nvim_set_hl(0, "DapUIStoppedThread", { bg = "NONE", fg = "#AF87D7", })

vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapUIBreakpointsLine", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { bg = "NONE", fg = "#9EB73D", })

vim.api.nvim_set_hl(0, "DapBreakpointCondition", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { bg = "NONE", fg = "#9EB73D", })

vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "DapUIBreakpointsDisabledLine", { bg = "NONE", fg = "#9EB73D", })

