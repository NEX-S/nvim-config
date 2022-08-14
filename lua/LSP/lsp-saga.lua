
require "lspsaga".init_lsp_saga {
    border_style = "single",
    move_in_saga = { next = '<C-n>', prev = '<C-p>' },
    diagnostic_header = { " ", " ", " ", " " },
    show_diagnostic_source = true,
    -- add bracket or something with diagnostic source, just have 2 elements
    diagnostic_source_bracket = {},
    -- use emoji lightbulb in default
    code_action_icon = "",
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = false,
    },
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 16,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_keys = {
        quit = "<ESC>",
        exec = "l",
    },
    rename_action_quit = "<C-c>",
    definition_preview_icon = "  ",
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    saga_winblend = 20,
}


local opt = { noremap = true, silent = true }
vim.keymap.set('n', "<C-r>", "<CMD>Lspsaga rename<CR>",             opt)
vim.keymap.set('n', "go",    "<CMD>Lspsaga hover_doc<CR>",          opt)
vim.keymap.set('n', "gD",    "<CMD>Lspsaga lsp_finder<CR>",         opt)
vim.keymap.set('n', "gh",    "<CMD>Lspsaga signature_help<CR>",     opt)
vim.keymap.set('n', "gd",    "<CMD>Lspsaga preview_definition<CR>", opt)

vim.keymap.set('n', "ga",    "<CMD>Lspsaga code_action<CR>",            opt)
vim.keymap.set('v', "ga",    "<CMD><C-u>Lspsaga range_code_action<CR>", opt)

vim.keymap.set('n', ";d",    "<CMD>Lspsaga show_line_diagnostics<CR>",   opt)
vim.keymap.set('n', ";D",    "<CMD>Lspsaga show_cursor_diagnostics<CR>", opt)

vim.keymap.set('n', "<A-p>", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opt)
vim.keymap.set('n', "<A-n>", "<CMD>Lspsaga diagnostic_jump_next<CR>", opt)

vim.keymap.set("n", ";x",    "<CMD>Lspsaga open_floaterm<CR>",  opt)
vim.keymap.set("n", "<ESC>", "<CMD>set hls! | Lspsaga close_floaterm<CR>", opt)

-- vim.keymap.set("n", "<C-f>", function() require "lspsaga.action".smart_scroll_with_saga(1) end, opt)
-- vim.keymap.set("n", "<C-b>", function() require "lspsaga.action".smart_scroll_with_saga(-1) end, opt)
