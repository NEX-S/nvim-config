
-- local navic = require('nvim-navic')

require "lualine".setup {
    globalstatus = true,
    options = {
        icons_enabled = true,
        -- theme = 'palenight',
        theme = {
            normal = {
                a = { fg = '#1e1e1e', bg = '#c792ea', gui = 'bold' },
                b = { fg = '#797979', bg = '#323232', gui = 'NONE' },
                c = { fg = '#626262', bg = '#292929', gui = 'NONE' },
                x = { fg = '#848484', bg = '#292929', gui = 'NONE' },
                y = { fg = '#c792ea', bg = '#323232', gui = 'italic' },
                z = { fg = '#1e1e1e', bg = '#c792ea', gui = 'bold,italic' },
            },
            insert = {
                b = { fg = '#626262', bg = '#272727', gui = 'NONE' },
                c = { fg = '#4b4b4b', bg = '#272727', gui = 'NONE' },
                x = { fg = '#6d6d6d', bg = '#272727', gui = 'NONE' },
                y = { fg = '#d0ee7a', bg = '#313131', gui = 'italic' },
                z = { fg = '#1e1e1e', bg = '#d0ee7a', gui = 'bold,italic' },
            },
            visual = {
                b = { fg = '#828282', bg = '#353535', gui = 'NONE' },
                c = { fg = '#6c6c6c', bg = '#2c2c2c', gui = 'NONE' },
                x = { fg = '#8e8e8e', bg = '#2c2c2c', gui = 'NONE' },
                y = { fg = '#e73e95', bg = '#343434', gui = 'italic' },
                z = { fg = '#1e1e1e', bg = '#e73e95', gui = 'bold,italic' },
            },
            replace  = { z = { fg = '#1e1e1e', bg = '#bbe73d', gui ='bold,italic' }, },
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
        lualine_c = { '%F -  %p%% ]' },
        lualine_x = { 'os.date("%H:%M %a")', 'filetype' },
        lualine_y = { '%c -  %B' },
        lualine_z = {'%l - %L' },
    },
}

