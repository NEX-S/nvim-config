
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
        enable = true,
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
    max_preview_lines = 16,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<A-n>",
        scroll_up = "<A-p>", -- quit can be a table
    },
    code_action_keys = {
        quit = "<ESC>",
        exec = "l",
    },
    rename_action_quit = "<C-c>",
    definition_preview_icon = "  ",
    -- 顶栏
    symbol_in_winbar = {
        enable = false,
        in_custom = false,
        separator = '  ',
        show_file = true,
        click_support = function(node, clicks, button, modifiers)
            -- To see all avaiable details: vim.pretty_print(node)
            local st = node.range.start
            local en = node.range['end']
            if button == "l" then
                if clicks == 2 then
                    -- double left click to do nothing
                else -- jump to node's starting line+char
                    vim.fn.cursor(st.line + 1, st.character + 1)
                end
            elseif button == "r" then
                if modifiers == "s" then
                    print "lspsaga" -- shift right click to print "lspsaga"
                end -- jump to node's ending line+char
                vim.fn.cursor(en.line + 1, en.character + 1)
            elseif button == "m" then
                -- middle click to visual select node
                vim.fn.cursor(st.line + 1, st.character + 1)
                vim.cmd "normal v"
                vim.fn.cursor(en.line + 1, en.character + 1)
            end
        end
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
}

local icons = require "lspsaga.lspkind"

    icons[1][2]   = ""   -- File
    icons[2][2]   = ""   -- Module
    icons[3][2]   = ""   -- Namespace
    icons[4][2]   = ""   -- Package
    icons[5][2]   = ""   -- Class
    icons[6][2]   = ""   -- Method
    icons[7][2]   = ""   -- Property
    icons[8][2]   = ""   -- Field
    icons[9][2]   = ""   -- Constructor
    icons[10][2]  = ""   -- Enum
    icons[11][2]  = ""   -- Interface
    icons[12][2]  = ""  -- Function
    icons[13][2]  = ""   -- Variable
    icons[14][2]  = ""   -- Constant
    icons[15][2]  = ""   -- String
    icons[16][2]  = ""   -- Number
    icons[17][2]  = ""   -- Boolean
    icons[18][2]  = ""   -- Array
    icons[19][2]  = ""   -- Object
    icons[20][2]  = ""   -- Key
    icons[21][2]  = ""   -- Null
    icons[22][2]  = ""   -- EnumMember
    icons[23][2]  = ""   -- Struct
    icons[24][2]  = ""   -- Event
    icons[25][2]  = ""   -- Operator
    icons[26][2]  = ""   -- TypeParameter
    icons[252][2] = ""   -- TypeAlias
    icons[253][2] = ""   -- Parameter
    icons[254][2] = ""   -- StaticMethod
    icons[255][2] = ""   -- Macro

    -- icons[1][2]    =  " "  -- File          
    -- icons[2][2]    =  " "  -- Module         
    -- icons[3][2]    =  "ﱕ "  -- Namespace     
    -- icons[4][2]    =  " "  -- Package       
    -- icons[5][2]    =  " "  -- Class         
    -- icons[6][2]    =  " "  -- Method        
    -- icons[7][2]    =  " "  -- Property       
    -- icons[8][2]    =  " "  -- Field          
    -- icons[9][2]    =  " "  -- Constructor    
    -- icons[10][2]   =  " "  -- Enum          了
    -- icons[11][2]   =  " "  -- Interface     練
    -- icons[12][2]   =  " "  -- Function      
    -- icons[13][2]   =  " "  -- Variable      
    -- icons[14][2]   =  " "  -- Constant      
    -- icons[15][2]   =  " "  -- String        
    -- icons[16][2]   =  " "  -- Number        
    -- icons[17][2]   =  " "  -- Boolean       ◩
    -- icons[18][2]   =  " "  -- Array         
    -- icons[19][2]   =  ""   -- Object        
    -- icons[20][2]   =  " "  -- Key           
    -- icons[21][2]   =  " "  -- Null          ﳠ
    -- icons[22][2]   =  " "  -- EnumMember    
    -- icons[23][2]   =  "ﯟ "  -- Struct        
    -- icons[24][2]   =  " "  -- Event         
    -- icons[25][2]   =  " "  -- Operator      
    -- icons[26][2]   =  " "  -- TypeParameter 
    -- icons[252][2]  =  " "  -- TypeAlias     
    -- icons[253][2]  =  " "  -- Parameter     
    -- icons[254][2]  =  "ﴂ "  -- StaticMethod  ﴂ
    -- icons[255][2]  =  " "  -- Macro         

-- require "lspsaga.lspkind" {
--     { "File",           " ",  "#ffffff" },
--     { "Module",         " ",  "#ffffff" },
--     { "Namespace",      " ",  "#ffffff" },
--     { "Package",        " ",  "#ffffff" },
--     { "Class",          " ",  "#ffffff" },
--     { "Method",         " ",  "#ffffff" },
--     { "Property",       " ",  "#ffffff" },
--     { "Field",          " ",  "#ffffff" },
--     { "Constructor",    " ",  "#ffffff" },
--     { "Enum",           "了",  "#ffffff" },
--     { "Interface",      "練",  "#ffffff" },
--     { "Function",       " ",  "#ffffff" },
--     { "Variable",       " ",  "#ffffff" },
--     { "Constant",       " ",  "#ffffff" },
--     { "String",         " ",  "#ffffff" },
--     { "Number",         " ",  "#ffffff" },
--     { "Boolean",        "◩ ",  "#ffffff" },
--     { "Array",          " ",  "#ffffff" },
--     { "Object",         " ",  "#ffffff" },
--     { "Key",            " ",  "#ffffff" },
--     { "Null",           "ﳠ ",  "#ffffff" },
--     { "EnumMember",     " ",  "#ffffff" },
--     { "Struct",         " ",  "#ffffff" },
--     { "Event",          " ",  "#ffffff" },
--     { "Operator",       " ",  "#ffffff" },
--     { "TypeParameter",  " ",  "#ffffff" },
--     { "TypeAlias",      " ",  "#ffffff" },
--     { "Parameter",      " ",  "#ffffff" },
--     { "StaticMethod",   "ﴂ ",  "#ffffff" },
--     { "Macro",          " ",  "#ffffff" },
-- }

local opt = { noremap = true, silent = true }

vim.keymap.set('n', ';9',    "<CMD>LSoutlineToggle<CR>",            opt)
vim.keymap.set('n', "go",    "<CMD>Lspsaga hover_doc<CR>",          opt)
vim.keymap.set('n', "gD",    "<CMD>Lspsaga lsp_finder<CR>",         opt)
vim.keymap.set('n', "gh",    "<CMD>Lspsaga signature_help<CR>",     opt)
vim.keymap.set('n', "gd",    "<CMD>Lspsaga preview_definition<CR>", opt)

vim.keymap.set('n', "ga",    "<CMD>Lspsaga code_action<CR>",             opt)
vim.keymap.set('v', "ga",    "<CMD><C-u>Lspsaga range_code_action<CR>",  opt)
vim.keymap.set('n', ";d",    "<CMD>Lspsaga show_line_diagnostics<CR>",   opt)
vim.keymap.set("n", ";x",    "<CMD>Lspsaga open_floaterm<CR>",           opt)
vim.keymap.set('n', ";D",    "<CMD>Lspsaga show_cursor_diagnostics<CR>", opt)

vim.keymap.set('n', "<C-r>", "<CMD>Lspsaga rename<CR>",               opt)
vim.keymap.set('n', "<A-p>", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opt)
vim.keymap.set('n', "<A-n>", "<CMD>Lspsaga diagnostic_jump_next<CR>", opt)
vim.keymap.set('n', "<ESC>", "<CMD>set hls! | Lspsaga close_floaterm<CR>", opt)

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
vim.api.nvim_set_hl(0, "LSOutlinePreviewBorder",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "OutlineIndentEvn",        { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "OutlineIndentOdd",        { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "OutlineFoldPrefix",       { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "OutlineDetail",           { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "LspSagaWinbarKey",            { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarSep",            { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarEnum",           { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarFile",           { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarNull",           { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarArray",          { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarClass",          { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarEvent",          { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarField",          { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarMacro",          { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarMethod",         { bg = "NONE", fg = "#614F97", })
vim.api.nvim_set_hl(0, "LspSagaWinbarModule",         { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarNumber",         { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "LspSagaWinbarObject",         { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarString",         { bg = "NONE", fg = "#585858", })
vim.api.nvim_set_hl(0, "LspSagaWinbarStruct",         { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarBoolean",        { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "LspSagaWinbarPackage",        { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarConstant",       { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "LspSagaWinbarFunction",       { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "LspSagaWinbarOperator",       { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarProperty",       { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarVariable",       { bg = "NONE", fg = "#614F97", })
vim.api.nvim_set_hl(0, "LspSagaWinbarInterface",      { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarNamespace",      { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarParameter",      { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "LspSagaWinbarTypeAlias",      { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWarnTrunCateLine",     { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarEnumMember",     { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarConstructor",    { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "LspSagaWinbarStaticMethod",   { bg = "NONE", fg = "#727272", })
vim.api.nvim_set_hl(0, "LspSagaWinbarTypeParameter",  { bg = "NONE", fg = "#727272", })

