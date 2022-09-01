
require "scrollbar".setup {
    show = true,
    show_in_active_only = true,
    set_highlight = true,
    handle = {
        text = " ",
        color = '#303030',
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true,
    },
    marks = {
        Search = {
            text = { "-", "=" },
            priority = 6,
            color = '#C53B82',
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 10,
            color = "#C53B82",
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 8,
            color = "#FF9E64",
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 2,
            color = "#AFC460",
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 4,
            color = "#1ABC9C",
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 1,
            color = "9D7CD8",
            cterm = nil,
            highlight = "Normal",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "NvimTree",
    },
    autocmd = {
        render = {
            "CursorMoved",
            "CursorHold",
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        diagnostic = true,
        search = true,
    },
}

-- vim.api.nvim_set_hl(0, "ScrollbarHandle",       { bg = "#323232", fg = "NONE" })
--
-- vim.api.nvim_set_hl(0, "ScrollbarInfo",         { bg = "NONE", fg = "#1ABC9C" })
-- vim.api.nvim_set_hl(0, "ScrollbarWarn",         { bg = "NONE", fg = "#FF9E64" })
-- vim.api.nvim_set_hl(0, "ScrollbarSearch",       { bg = "NONE", fg = "#BBE73D" })
-- vim.api.nvim_set_hl(0, "ScrollbarHint",         { bg = "NONE", fg = "#777777" })
-- vim.api.nvim_set_hl(0, "ScrollbarMisc",         { bg = "NONE", fg = "#9D7CD8" })
-- vim.api.nvim_set_hl(0, "ScrollbarError",        { bg = "NONE", fg = "#C53B82" })
--
-- vim.api.nvim_set_hl(0, "ScrollbarHintHandle",   { bg = "NONE", fg = "#777777" })
-- vim.api.nvim_set_hl(0, "ScrollbarInfoHandle",   { bg = "NONE", fg = "#1ABC9C" })
-- vim.api.nvim_set_hl(0, "ScrollbarWarnHandle",   { bg = "NONE", fg = "#FF9E64" })
-- vim.api.nvim_set_hl(0, "ScrollbarErrorHandle",  { bg = "NONE", fg = "#C53B82" })
-- vim.api.nvim_set_hl(0, "ScrollbarMiscHandle",   { bg = "NONE", fg = "#9D7CD8" })
-- vim.api.nvim_set_hl(0, "ScrollbarSearchHandle", { bg = "NONE", fg = "#BBE73D" })
