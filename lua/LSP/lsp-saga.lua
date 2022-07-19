
require "lspsaga".init_lsp_saga {
    border_style = "single",
    move_in_saga = { next = 'j', prev = 'k' },
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
vim.keymap.set('n', "ga",    require "lspsaga.codeaction".code_action,        opt )
vim.keymap.set('n', "gh",    require "lspsaga.signaturehelp".signature_help,  opt )
vim.keymap.set('n', "gD",    require "lspsaga.finder".lsp_finder,             opt )
vim.keymap.set('n', "go",    require "lspsaga.hover".render_hover_doc,        opt )
vim.keymap.set('n', "<C-r>", require "lspsaga.rename".lsp_rename,             opt )
vim.keymap.set('n', "gd",    require "lspsaga.definition".preview_definition, opt )

vim.keymap.set('n', ";d",    require "lspsaga.diagnostic".show_line_diagnostics, opt )
vim.keymap.set('n', "<A-p>", require "lspsaga.diagnostic".goto_prev, opt )
vim.keymap.set('n', "<A-n>",  require "lspsaga.diagnostic".goto_next, opt )

vim.keymap.set("n", ";x", "<CMD>Lspsaga open_floaterm<CR>", opt )
vim.keymap.set("t", "<ESC>", "<CMD>Lspsaga close_floaterm<CR>", opt )
