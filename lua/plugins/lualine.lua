
-- local navic = require('nvim-navic')

require "lualine".setup {
    globalstatus = true,
    options = {
        icons_enabled = true,
        -- theme = 'palenight',
        theme = {
            normal = {
                a = { fg = '#1e1e1e', bg = '#AF87D7', gui = 'bold' },
                b = { fg = '#797979', bg = '#323232', gui = 'NONE' },
                c = { fg = '#525252', bg = '#292929', gui = 'NONE' },
                x = { fg = '#646464', bg = '#292929', gui = 'NONE' },
                y = { fg = '#AF87D7', bg = '#323232', gui = 'italic' },
                z = { fg = '#1e1e1e', bg = '#AF87D7', gui = 'bold,italic' },
            },
            insert = {
                b = { fg = '#626262', bg = '#303030', gui = 'NONE' },
                c = { fg = '#464646', bg = '#272727', gui = 'NONE' },
                x = { fg = '#464646', bg = '#272727', gui = 'NONE' },
                y = { fg = '#D0EE7A', bg = '#313131', gui = 'italic' },
                z = { fg = '#1e1e1e', bg = '#D0EE7A', gui = 'bold,italic' },
            },
            visual = {
                b = { fg = '#828282', bg = '#353535', gui = 'NONE' },
                c = { fg = '#5c5c5c', bg = '#2c2c2c', gui = 'NONE' },
                x = { fg = '#7e7e7e', bg = '#2c2c2c', gui = 'NONE' },
                y = { fg = '#c53b82', bg = '#343434', gui = 'italic' },
                z = { fg = '#1e1e1e', bg = '#c53b82', gui = 'bold,italic' },
            },
            replace  = { z = { fg = '#1e1e1e', bg = '#614F97', gui ='bold,italic' }, },
            inactive = { a = { fg = '#8f8f8f', bg = '#323232', gui = 'NONE' }, },
        },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '|' },

        -- section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},

        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = '|' },
        disabled_filetypes = {},
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
        lualine_x = { 'os.date("%H:%M %a")', 'filetype' },
        lualine_y = { '%c -  %B' },
        lualine_z = { '%l - %L' },
    },
}

