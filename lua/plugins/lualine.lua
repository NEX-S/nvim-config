
local symbol_node = require "lspsaga.symbolwinbar".get_symbol_node

require "lualine".setup {
    globalstatus = true,
    options = {
        icons_enabled = true,
        -- theme = 'palenight',
        theme = {
            normal = {
                a = { fg = '#767676', bg = '#404040', gui = 'bold' },
                b = { fg = '#595959', bg = '#303030', gui = 'NONE' },
                c = { fg = '#525252', bg = '#292929', gui = 'NONE' },
                x = { fg = '#646464', bg = '#292929', gui = 'NONE' },
                y = { fg = '#666666', bg = '#323232', gui = 'italic' },
                z = { fg = '#888888', bg = '#444444', gui = 'bold,italic' },
            },
            insert = {
                b = { fg = '#707070', bg = '#303030', gui = 'NONE' },
                c = { fg = '#525252', bg = '#292929', gui = 'NONE' },
                x = { fg = '#646464', bg = '#292929', gui = 'NONE' },
                y = { fg = '#777777', bg = '#343434', gui = 'italic' },
                z = { fg = '#BBE73D', bg = '#444444', gui = 'italic' },
            },
            visual = {
                b = { fg = '#707070', bg = '#303030', gui = 'NONE' },
                c = { fg = '#525252', bg = '#292929', gui = 'NONE' },
                x = { fg = '#646464', bg = '#292929', gui = 'NONE' },
                y = { fg = '#777777', bg = '#343434', gui = 'italic' },
                z = { fg = '#C53B82', bg = '#444444', gui = 'italic' },
            },
            replace  = { z = { fg = '#6C5B9E', bg = '#424242', gui ='bold,italic' }, },
            inactive = { a = { fg = '#8f8f8f', bg = '#323232', gui = 'NONE' }, },
        },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '|' },

        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '\\' },

        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = '\\' },
        disabled_filetypes = {
            "dashboard",
        },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                "branch",
                -- TODO: ADD DOT
                show_modified_status = true,
                symbols = {
                    modified = ' ',
                    alternate_file = ' o',
                    directory = ' z',
                },
            },
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "hint", "info" },
                symbols = {
                    error = ' ',
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
                colored = true, -- Displays a colored diff status if set to true
                symbols = {
                    added = '+ ',
                    modified = ' ',
                    removed = '- '
                }, -- Changes the symbols used by the diff.
                source = nil,
            },
        },
        lualine_c = {{'[ %F -  %p%% ]', type = 'stl' }},
        lualine_x = { { symbol_node }, 'os.date("%H:%M %a")', },
        lualine_y = { '%c -  %B' },
        lualine_z = { '%l - %L' },
    },
}

vim.api.nvim_set_hl(0, "lualine_a_diagnostics_hint_normal", { bg = "#404040", fg = "#C7EB61" })

vim.api.nvim_set_hl(0, "LspSagaWinbarSep",   { bg = "#292929", fg = "#555555" })
vim.api.nvim_set_hl(0, "LspSagaWinbarKey",   { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarEnum",  { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarFile",  { bg = "#292929", fg = "#AF87D7" })
vim.api.nvim_set_hl(0, "LspSagaWinbarNull",  { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarArray", { bg = "#292929", fg = "#9EB73D" })
vim.api.nvim_set_hl(0, "LspSagaWinbarClass", { bg = "#292929", fg = "#C53B82" })
vim.api.nvim_set_hl(0, "LspSagaWinbarEvent", { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarField", { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarMacro", { bg = "#292929", fg = "#686868" })

vim.api.nvim_set_hl(0, "LspSagaWinbarMethod",   { bg = "#292929", fg = "#C53B82" })
vim.api.nvim_set_hl(0, "LspSagaWinbarModule",   { bg = "#292929", fg = "#C7EB61" })
vim.api.nvim_set_hl(0, "LspSagaWinbarNumber",   { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarObject",   { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarString",   { bg = "#292929", fg = "#585858", bold = false, italic = true })
vim.api.nvim_set_hl(0, "LspSagaWinbarStruct",   { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarBoolean",  { bg = "#292929", fg = "#C53B82" })
vim.api.nvim_set_hl(0, "LspSagaWinbarPackage",  { bg = "#292929", fg = "#686868" })

vim.api.nvim_set_hl(0, "LspSagaWinbarConstant",   { bg = "#292929", fg = "#D1771B" })
vim.api.nvim_set_hl(0, "LspSagaWinbarFunction",   { bg = "#292929", fg = "#C53B82", bold = true, italic = true })
vim.api.nvim_set_hl(0, "LspSagaWinbarOperator",   { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarProperty",   { bg = "#292929", fg = "#8567A3" })
vim.api.nvim_set_hl(0, "LspSagaWinbarVariable",   { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarInterface",  { bg = "#292929", fg = "#D1771B" })
vim.api.nvim_set_hl(0, "LspSagaWinbarNamespace",  { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarParameter",  { bg = "#292929", fg = "#6C5B9E" })
vim.api.nvim_set_hl(0, "LspSagaWinbarTypeAlias",  { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarEnumMember", { bg = "#292929", fg = "#686868" })

vim.api.nvim_set_hl(0, "LspSagaWinbarConstructor",   { bg = "#292929", fg = "#686868" })
vim.api.nvim_set_hl(0, "LspSagaWinbarStaticMethod",  { bg = "#292929", fg = "#C53B82" })
vim.api.nvim_set_hl(0, "LspSagaWinbarTypeParameter", { bg = "#292929", fg = "#6C5B9E" })
