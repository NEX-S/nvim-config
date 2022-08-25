
-- local navic = require('nvim-navic')

require "lualine".setup {
    globalstatus = true,
    options = {
        icons_enabled = true,
        -- theme = 'palenight',
        theme = {
            normal = {
                a = { fg = '#888888', bg = '#444444', gui = 'bold' },
                b = { fg = '#797979', bg = '#323232', gui = 'NONE' },
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

        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = '\\' },

        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '|' },
        disabled_filetypes = {
            "dashboard",
        },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {  'windows',
                show_modified_status = true,
                symbols = {
                    modified = ' ',
                    alternate_file = ' o',
                    directory = ' z',
                },
            }
        },
        lualine_b = { 'branch',
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
                update_in_insert = false,
                always_visible = false,
            }
        },
        lualine_c = {{'[ %F -  %p%% ]', type = 'stl' }},
        lualine_x = { 'os.date("%H:%M %a")', },
        lualine_y = { '%c -  %B' },
        lualine_z = { '%l - %L' },
    },
}

