
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
                c = { fg = '#484848', bg = 'NONE', gui = 'NONE' },
                x = { fg = '#585858', bg = 'NONE', gui = 'NONE' },
                y = { fg = '#777777', bg = '#323232', gui = 'italic' },
                z = { fg = '#AF87d7', bg = '#444444', gui = 'italic' },
            },
            visual = {
                b = { fg = '#707070', bg = '#323232', gui = 'NONE' },
                c = { fg = '#484848', bg = 'NONE', gui = 'NONE' },
                x = { fg = '#585858', bg = 'NONE', gui = 'NONE' },
                y = { fg = '#666666', bg = '#323232', gui = 'italic' },
                z = { fg = '#BBE73D', bg = '#444444', gui = 'bold,italic' },
            },
            replace  = { z = { fg = '#C53B82', bg = '#424242', gui ='bold,italic' }, },
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
        -- lualine_c = {{'[ %F -  %p%% ]', type = 'stl' }},
        lualine_x = { { symbol_node }, 'os.date("%H:%M %a")', },
        lualine_y = { '%c -  %B' },
        lualine_z = { '%l - %L' },
    },
}

vim.api.nvim_set_hl(0, "lualine_a_diagnostics_hint_normal", { bg = "#404040", fg = "#C7EB61" })

