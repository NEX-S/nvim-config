
require "nvim-treesitter.configs".setup {
    sync_install = true,
    ensure_installed = { 'c', 'lua', 'php', 'markdown', 'python', 'html', 'vim', 'http', 'json', 'java', 'go' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {},
    },
    autotag = {
        enable = true,
        filetypes = { 'html', 'xml' },
    },
    indent = { enable = true },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
}

require "treesitter-context".setup {
    enable = true,
    max_lines = 0,
    patterns = {
        default = {
            'class',
                    'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
    },
    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
}

vim.api.nvim_set_hl(0, "TSAnnotation", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSAttribute", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSBoolean", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSCharacter", { bg = "NONE", fg = "#555555", })
vim.api.nvim_set_hl(0, "TSCharacterSpecial", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSComment", { bg = "NONE", fg = "#484848", })
vim.api.nvim_set_hl(0, "TSConstBuiltin", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSConditional", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSConstMacro", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSConstant", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSConstructor", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSDanger", { bg = "NONE", fg = "#4000f1", })
vim.api.nvim_set_hl(0, "TSDebug", { bg = "NONE", fg = "#4000f1", })
vim.api.nvim_set_hl(0, "TSDefine", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSEmphasis", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSEnvironment", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSEnvironmentName", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSException", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSField", { bg = "NONE", fg = "#535353", })
vim.api.nvim_set_hl(0, "TSFloat", { bg = "NONE", fg = "#afc460", })
vim.api.nvim_set_hl(0, "TSFuncBuiltin", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSFuncMacro", { bg = "NONE", fg = "#484848", })
vim.api.nvim_set_hl(0, "TSFunction", { bg = "NONE", fg = "#614f97", })
vim.api.nvim_set_hl(0, "TSInclude", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSKeyword", { bg = "NONE", fg = "#6A6A6A", })
vim.api.nvim_set_hl(0, "TSKeywordFunction", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSKeywordOperator", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSKeywordReturn", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSLabel", { bg = "NONE", fg = "#D0EE7A", })
vim.api.nvim_set_hl(0, "TSLiteral", { bg = "NONE", fg = "#515151", })
vim.api.nvim_set_hl(0, "TSMath", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSMethod", { bg = "NONE", fg = "#614f97", })
vim.api.nvim_set_hl(0, "TSNamespace", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSNone", { bg = "NONE", fg = "#585858", })
vim.api.nvim_set_hl(0, "TSNote", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSNumber", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSOperator", { bg = "NONE", fg = "#555555", })
vim.api.nvim_set_hl(0, "TSParameter", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSParameterReference", { bg = "NONE", fg = "#D66F01", })
vim.api.nvim_set_hl(0, "TSPreProc", { bg = "NONE", fg = "#767676", })
vim.api.nvim_set_hl(0, "TSPunctBracket", { bg = "NONE", fg = "#555555", })
vim.api.nvim_set_hl(0, "TSProperty", { bg = "NONE", fg = "#555555", })
vim.api.nvim_set_hl(0, "TSPunctDelimiter", { bg = "NONE", fg = "#444444", })
vim.api.nvim_set_hl(0, "TSPunctSpecial", { bg = "NONE", fg = "#6c5b9e", bold = true })
vim.api.nvim_set_hl(0, "TSRepeat", { bg = "NONE", fg = "#555555", })
vim.api.nvim_set_hl(0, "TSStorageClass", { bg = "NONE", fg = "#D66F01", })
vim.api.nvim_set_hl(0, "TSStrike", { bg = "NONE", fg = "#D66F01", })
vim.api.nvim_set_hl(0, "TSString", { bg = "NONE", fg = "#585858", italic = true })
vim.api.nvim_set_hl(0, "TSStringEscape", { bg = "NONE", fg = "#363636", })
vim.api.nvim_set_hl(0, "TSStringRegex", { bg = "NONE", fg = "#444f1a", })
vim.api.nvim_set_hl(0, "TSStringSpecial", { bg = "NONE", fg = "#444f1a", })
vim.api.nvim_set_hl(0, "TSStrong", { bg = "NONE", fg = "#444f1a", })
vim.api.nvim_set_hl(0, "TSSymbol", { bg = "NONE", fg = "#444f1a", })
vim.api.nvim_set_hl(0, "TSTag", { bg = "NONE", fg = "#6c5b9e", })
vim.api.nvim_set_hl(0, "TSTagAttribute", { bg = "NONE", fg = "#9EB73D", })
vim.api.nvim_set_hl(0, "TSTagDelimiter", { bg = "NONE", fg = "#444f1a", })
vim.api.nvim_set_hl(0, "TSText", { bg = "NONE", fg = "#585858", })
vim.api.nvim_set_hl(0, "TSTextReference", { bg = "NONE", fg = "#444f1a", })
vim.api.nvim_set_hl(0, "TSTitle", { bg = "NONE", fg = "#6c5b9e", bold = true })
vim.api.nvim_set_hl(0, "TSTodo", { bg = "NONE", fg = "#444f1a", })
vim.api.nvim_set_hl(0, "TSType", { bg = "NONE", fg = "#555555", })
vim.api.nvim_set_hl(0, "TSTypeBuiltin", { bg = "NONE", fg = "#BBE73D", })
vim.api.nvim_set_hl(0, "TSTypeDefinition", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSTypeQualifier", { bg = "NONE", fg = "#ffffff", })
vim.api.nvim_set_hl(0, "TSUnderline", { bg = "NONE", fg = "#000000", })
vim.api.nvim_set_hl(0, "TSURI", { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "TSVariableBuiltin", { bg = "NONE", fg = "#614f97", })
vim.api.nvim_set_hl(0, "TSWarning", { bg = "NONE", fg = "#ffffff", })
