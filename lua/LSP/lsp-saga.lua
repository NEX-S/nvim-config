
vim.api.nvim_set_hl(8, "TSvariable", { bg = "NONE", fg = '#C53B82', bold = true, italic = false, underline = true })

require "lspsaga".init_lsp_saga {
    border_style = "single",
    saga_winblend = 20,
    move_in_saga = { next = '<A-n>', prev = '<A-p>' },
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
        enable = false,
        sign = false,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 5,
    -- finder_preview_hl_ns = 8,
    finder_action_keys = {
        open = "l",
        vsplit = "v",
        split = "s",
        tabe = "t",
        quit = "<ESC>",
        scroll_down = "<A-n>",
        scroll_up = "<A-p>", -- quit can be a table
    },
    code_action_keys = {
        quit = "<ESC>",
        exec = "l",
    },
    rename_action_quit = "<ESC>",
    rename_in_select = true,
    definition_preview_icon = "  ",
    -- 顶栏
    symbol_in_winbar = {
        enable = true,
        in_custom = true,
        separator = '  ',
        show_file = false,
    },
    show_outline = {
        win_position = 'right',
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = '',
        win_width = 35,
        auto_enter = false,
        auto_preview = false,
        virt_text = 'x',
        jump_key = 'l',
        -- auto refresh when change buffer
        auto_refresh = true,
    },
    custom_kind = {
        File          =  { "",  "#AF87D7" },
        Module        =  { "",  "#666666" },
        Namespace     =  { "ﱕ ", "#666666" },
        Package       =  { " ", "#666666" },
        Class         =  { " ", "#BBE73D" },
        Method        =  { " ", "#C53B82" },
        Property      =  { " ", "#666666" },
        Field         =  { "ﯟ ", "#666666" },
        Constructor   =  { " ", "#666666" },
        Enum          =  { " ", "#666666" },
        Interface     =  { " ", "#666666" },
        Function      =  { " ", "#C53B82" },
        Variable      =  { " ", "#BBE73D" },
        Constant      =  { " ", "#666666" },
        String        =  { " ", "#444444" },
        Number        =  { " ", "#AFC460" },
        Boolean       =  { " ", "#C53B82" },
        Array         =  { " ", "#614F97" },
        Object        =  { " ", "#666666" },
        Key           =  { " ", "#666666" },
        Null          =  { " ", "#C53B82" },
        EnumMember    =  { " ", "#666666" },
        Struct        =  { " ", "#666666" },
        Event         =  { " ", "#666666" },
        Operator      =  { " ", "#666666" },
        TypeParameter =  { " ", "#666666" },
        TypeAlias     =  { " ", "#666666" },
        Parameter     =  { " ", "#8567A3" },
        StaticMethod  =  { " ", "#666666" },
        Macro         =  { "廓", "#666666" },
    },
}

local opt = { noremap = true, silent = true }

vim.keymap.set("n", "gh", "<CMD>Lspsaga hover_doc<CR>", opt)
vim.keymap.set("n", "gs", "<CMD>Lspsaga signature_help<CR>", opt)
vim.keymap.set("n", "gi", "*N<CMD>set hls | Lspsaga lsp_finder<CR>", opt)
vim.keymap.set("n", "gd", "*N<CMD>set hls | Lspsaga preview_definition<CR>", opt)

vim.keymap.set("n", "ga",    "<CMD>Lspsaga code_action<CR>",             opt)
vim.keymap.set("v", "ga",    "<CMD><C-u>Lspsaga range_code_action<CR>",  opt)
vim.keymap.set("n", ";d",    "<CMD>Lspsaga show_line_diagnostics<CR>",   opt)
vim.keymap.set("n", ";x",    "<CMD>Lspsaga open_floaterm<CR>",           opt)
vim.keymap.set("n", ";D",    "<CMD>Lspsaga show_cursor_diagnostics<CR>", opt)
vim.keymap.set("n", ";o",    "<CMD>LSoutlineToggle<CR>",                 opt)

vim.keymap.set("n", "<C-r>", "<CMD>Lspsaga rename<CR>",               opt)
vim.keymap.set("n", "<A-p>", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opt)
vim.keymap.set("n", "<A-n>", "<CMD>Lspsaga diagnostic_jump_next<CR>", opt)
vim.keymap.set("n", "<ESC>", "<CMD>set hls! | Lspsaga close_floaterm<CR>", opt)

-- vim.keymap.set("n", "<C-f>", function() require "lspsaga.action".smart_scroll_with_saga(1) end, opt)
-- vim.keymap.set("n", "<C-b>", function() require "lspsaga.action".smart_scroll_with_saga(-1) end, opt)

vim.api.nvim_set_hl(0, "LspSagaHoverBorder",             { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaAutoPrew",                { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaAutoPreview",             { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaBorderTitle",             { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaCodeActionBorder",        { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaCodeActionContent",       { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaCodeActionTitle",         { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaCodeActionTrunCateLine",  { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaDefPreviewBorder",        { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticBorder",        { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticHeader",        { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticError",         { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticWarn",          { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticInfo",          { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticHint",          { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticSource",        { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaDiagnosticTruncateLine",  { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaErrorTrunCateLine",       { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaFinderSelection",         { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaHintTrunCateLine",        { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaHoverTrunCateLine",       { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaInfoTrunCateLine",        { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaLightBulb",               { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "LspSagaLspFinderBorder",         { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaRenameBorder",            { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaRenameMatch",             { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "LspSagaShTrunCateLine",          { bg = "NONE", fg = "#929292", })
vim.api.nvim_set_hl(0, "LspSagaSignatureHelpBorder",     { bg = "NONE", fg = "#353535", })
vim.api.nvim_set_hl(0, "LspSagaTrunCatgeLine",           { bg = "NONE", fg = "#929292", })

vim.api.nvim_set_hl(0, "TargetFileName",          { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "FinderParam",             { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "FinderVirtText",          { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "DefinitionsIcon",         { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "Definitions",             { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "ReferencesIcon",          { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "References",              { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "DefinitionCount",         { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "ReferencesCount",         { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "FinderSpinnerBorder",     { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "FinderSpinnerTitle",      { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "FinderSpinner",           { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "DefinitionPreviewTitle",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "SagaShadow",              { bg = "NONE", fg = "#666666", })

-- Outline
vim.api.nvim_set_hl(0, "LSOutlinePreviewBorder",  { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "OutlineIndentEvn",        { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "OutlineIndentOdd",        { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "OutlineFoldPrefix",       { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "OutlineDetail",           { bg = "NONE", fg = "#383838", })

