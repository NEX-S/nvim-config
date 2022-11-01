
local sym_node = require "lspsaga.symbolwinbar".get_symbol_node

require "lualine".setup {
    globalstatus = true,
    options = {
        icons_enabled = true,
        -- theme = 'palenight',
        theme = {
            normal = {
                a = { fg = '#828282', bg = '#404040', gui = 'bold' },
                b = { fg = 'NONE', bg = '#313131', gui = 'NONE' },
                c = { fg = '#525252', bg = '#292929', gui = 'NONE' },
                x = { fg = '#545454', bg = '#292929', gui = 'NONE' },
                y = { fg = '#727272', bg = '#313131', gui = 'italic' },
                z = { fg = '#8c72d9', bg = '#393939', gui = 'bold,italic' },
            },
            insert = {
                b = { fg = 'NONE', bg = '#313131', gui = 'NONE' },
                c = { fg = '#525252', bg = '#292929', gui = 'NONE' },
                x = { fg = '#545454', bg = '#292929', gui = 'NONE' },
                y = { fg = '#727272', bg = '#313131', gui = 'italic' },
                z = { fg = '#AFC460', bg = '#393939', gui = 'bold,italic' },
            },
            visual = {
                b = { fg = 'NONE', bg = '#303030', gui = 'NONE' },
                c = { fg = '#525252', bg = '#292929', gui = 'NONE' },
                x = { fg = '#545454', bg = '#292929', gui = 'NONE' },
                y = { fg = '#727272', bg = '#313131', gui = 'italic' },
                z = { fg = '#C53B82', bg = '#393939', gui = 'bold,italic' },
            },
            replace  = { z = { fg = '#6C5B9E', bg = '#424242', gui ='bold,italic' }, },
            inactive = { a = { fg = '#767676', bg = '#323232', gui = 'NONE' }, },
        },
        -- component_separators = { left = '', right = '\\' },
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '\\', right = '\\' },
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            "dashboard",
        },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                "filename",
                file_stauts = true,
                show_modified_status = true,
                newfile_stauts = true,
                path = 0,
                symbols = {
                    modified = ' ',
                    readonly = ' -',
                    newfile = ' +',
                    unnamed = ' x',
                },
            },
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "hint", "info" },
                symbols = {
                    error = '✕ ',
                    warn = ' ',
                    hint = ' ',
                    info = ' ',
                },
                colored = true,
                update_in_insert = true,
                always_visible = false,
            }
        },
        lualine_b = {
            {
                'diff',
                colored = true,
                symbols = {
                    added = '+ ',
                    modified = ' ',
                    removed = '- '
                },
                source = nil,
            },
        },
        lualine_c = {
            { '[ %F -  %p%% ]', type = 'stl' },
        },
        lualine_x = { { sym_node }, "os.date('%H:%M %a')", { test } },
        lualine_y = { '%c -  %B' },
        lualine_z = { '%l - %L' },
    },
}

-- vim.api.nvim_set_hl(0, "lualine_a_diagnostics_hint_normal", { bg = "#404040", fg = "#AFC460" })
-- vim.api.nvim_set_hl(0, "lualine_a_diagnostics_hint_visual", { bg = "#404040", fg = "#AFC460" })
-- vim.api.nvim_set_hl(0, "lualine_a_diagnostics_hint_insert", { bg = "#404040", fg = "#AFC460" })

-- vim.api.nvim_set_hl(0, "LspSagaWinbarSep",   { bg = "#292929", fg = "#555555" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarKey",   { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarEnum",  { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarFile",  { bg = "#292929", fg = "#AF87D7" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarNull",  { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarArray", { bg = "#292929", fg = "#9EB73D" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarClass", { bg = "#292929", fg = "#C53B82" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarEvent", { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarField", { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarMacro", { bg = "#292929", fg = "#686868" })

-- vim.api.nvim_set_hl(0, "LspSagaWinbarMethod",   { bg = "#292929", fg = "#C53B82" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarModule",   { bg = "#292929", fg = "#C7EB61" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarNumber",   { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarObject",   { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarString",   { bg = "#292929", fg = "#585858", bold = false, italic = true })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarStruct",   { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarBoolean",  { bg = "#292929", fg = "#C53B82" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarPackage",  { bg = "#292929", fg = "#686868" })

-- vim.api.nvim_set_hl(0, "LspSagaWinbarConstant",   { bg = "#292929", fg = "#D1771B" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarFunction",   { bg = "#292929", fg = "#C53B82", bold = true, italic = true })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarOperator",   { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarProperty",   { bg = "#292929", fg = "#6a5a9d" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarVariable",   { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarInterface",  { bg = "#292929", fg = "#D1771B" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarNamespace",  { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarParameter",  { bg = "#292929", fg = "#6C5B9E" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarTypeAlias",  { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarEnumMember", { bg = "#292929", fg = "#686868" })

-- vim.api.nvim_set_hl(0, "LspSagaWinbarConstructor",   { bg = "#292929", fg = "#686868" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarStaticMethod",  { bg = "#292929", fg = "#C53B82" })
-- vim.api.nvim_set_hl(0, "LspSagaWinbarTypeParameter", { bg = "#292929", fg = "#6C5B9E" })
