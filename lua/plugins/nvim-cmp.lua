
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp_icons = {
    Text          = "",
    Method        = "",
    Function      = "",
    Field         = "ﯟ",
    Variable      = "",
    Class         = "",
    Interface     = "",
    Module        = "",
    Property      = "",
    Unit          = "",
    Key           = "",
    Value         = "",
    Enum          = "",
    Keyword       = "",
    Snippet       = "",
    Color         = "ﰊ",
    File          = "",
    Reference     = "",
    Folder        = "",
    EnumMember    = "",
    Constant      = "",
    Struct        = "",
    Event         = "",
    Operator      = "",
    Constructor   = "",
    TypeParameter = "",
    Namespace     = "ﱕ",
    Package       = "",
    String        = "",
    Number        = "",
    Boolean       = "",
    Array         = "",
    Object        = "",
    Null          = "",
    TypeAlias     = "",
    Parameter     = "",
    StaticMethod  = "",
    Macro         = "廓",
}

local nvim_cmp = require "cmp"

nvim_cmp.setup {
    completion = { keyword_length = 1, },
    experimental = {
        -- ghost_text = { hl_group = 'CmpGhostText' },
    },
    -- 补全边框
    window = {
        completion = {
            scrolloff = 3,
            col_offset = 0,
            side_padding = 1,
        },
        -- completion = nvim_cmp.config.window.bordered(),
        -- documentation = nvim_cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-j>'] = nvim_cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = nvim_cmp.mapping.scroll_docs(4),
        ['<C-h>'] = nvim_cmp.mapping.close(),
        ['<A-j>'] = nvim_cmp.mapping.select_next_item(),
        ['<A-k>'] = nvim_cmp.mapping.select_prev_item(),
        ["<A-l>"] = nvim_cmp.mapping.confirm {
            behavior = nvim_cmp.ConfirmBehavior.Replace,
            select = false,
        },
    },
    -- 补全图标
    formatting = {
        fields = { "kind", "abbr", "menu" },
        expandable_indicator = false,
        format = function (entry, vim_item)
            -- Kind icons
            vim_item.menu = ({
                nvim_lsp    = " - LSP",
                luasnip     = " - SNIPPET",
                buffer      = " - BUFFER",
                path        = " - PATH",
                calc        = " - CALC",
                nvim_lua    = " - NVIM-API",
                -- treesitter  = " - TS",
                cmp_tabnine = " - TABNINE",
                copilot     = " - COPILOT",
                nvim_lsp_signature_help = " - SIGNATURE",
            })[entry.source.name]
            vim_item.kind = string.format("%s", cmp_icons[vim_item.kind])
            return vim_item
        end,
    },
    sources = nvim_cmp.config.sources {
        { name = 'path' },          -- PATH COMPLETION
        { name = 'luasnip' },       -- LUASNIP COMPLETION
        { name = 'buffer' },        -- BUFFER COMPLETION
        { name = 'cmp_tabnine' },   -- TABNINE COMPLETION
        { name = 'nvim_lsp' },      -- LSP COMPLETION
        { name = 'calc' },          -- CLAC COMPLETION
        { name = 'nvim_lsp_signature_help' },
        -- { name = 'treesitter' },     -- TREESITTER
        -- { name = 'copilot' },
        -- { name = 'rg', option = { additional_arguments = "--smart-case --hidden --max-depth = 10 -m 5", debonce = 2000 } },
    },
    confirm_opts = {
        behavior = nvim_cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- FIX: include in C
    snippet = {
        expand = function (args)
            local pos =  vim.api.nvim_win_get_cursor(0)
            local  line = vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1] , false)[1]
            if vim.startswith(line, "#include") then
                return args.body:sub(1, -2)
            else
                require "luasnip".lsp_expand(args.body)
            end
        end
    },
}

-- require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_cmp.setup.filetype('lua', {
    sources = {
        { name = 'path' },          -- PATH COMPLETION
        -- { name = 'treesitter' },    -- TREESITTER
        -- { name = 'copilot' },
        { name = 'buffer' },        -- BUFFER COMPLETION
        { name = 'nvim_lua' },      -- NVIM-API COMPLETION
        { name = 'luasnip' },       -- LUASNIP COMPLETION
        { name = 'nvim_lsp' },      -- LSP COMPLETION
        { name = 'cmp_tabnine' },   -- TABNINE COMPLETION
        { name = 'calc' },          -- CLAC COMPLETION
        { name = 'nvim_lsp_signature_help' },
        -- { name = 'rg', option = { additional_arguments = "--smart-case --hidden --max-depth = 10 -m 5", debonce = 2000 } },
    },
})

nvim_cmp.setup.cmdline(':', {
    mapping = nvim_cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'cmdline' },
        { name = 'cmdline_history' },
    },
})

nvim_cmp.setup.cmdline('/', {
    mapping = nvim_cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp_document_symbol' },
        -- { name = 'treesitter' },
    },
})

nvim_cmp.setup.cmdline('?', {
    mapping = nvim_cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp_document_symbol' },
        -- { name = 'treesitter' },
    },
})


-- nvim_cmp.setup.filetype(
--     { "dap-repl", "dapui_watches" }, {
--         sources = {
--             { name = "dap" },
--         },
--     }
-- )

-- If you want insert `(` after select function or method item
-- local nvim_cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- nvim_cmp.event:on(
--     'confirm_done',
--     nvim_cmp_autopairs.on_confirm_done()
-- )

vim.api.nvim_set_hl(0, "CmpItemAbbr",   { bg = "NONE", fg = "#686868", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKind",   { bg = "NONE", fg = "#D0EE7A", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemMenu",   { bg = "NONE", fg = "#505050", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",      { bg = "NONE", fg = "#6C5B9E", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#6C5B9E", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpItemKindClass",    { bg = "NONE", fg = "#AFC460", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindMethod",   { bg = "NONE", fg = "#AF87D7", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#AF87D7", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet",  { bg = "NONE", fg = "#C53B82", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpItemKindEnum",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindFile",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindText",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindUnit",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindColor",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindEvent",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindField",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindValue",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { bg = "NONE", fg = "#666666", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpItemAbbrDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemMenuDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindConstant",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindOperator",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindProperty",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindVariable",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindInterface",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindReference",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { bg = "NONE", fg = "#666666", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpItemKindConstructor",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindEnumDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindFileDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindTextDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindUnitDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindClassDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindColorDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindEventDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindFieldDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindValueDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindFolderDefault",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindMethodDefault",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindModuleDefault",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindStructDefault",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindKeywordDefault", { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindSnippetDefault", { bg = "NONE", fg = "#666666", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpItemKindConstantDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindFunctionDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindOperatorDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindPropertyDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindVariableDefault",    { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindInterfaceDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindReferenceDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecatedDefault",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzyDefault",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMemberDefault",  { bg = "NONE", fg = "#666666", bold = false, italic = false })
vim.api.nvim_set_hl(0, "CmpItemKindConstructorDefault", { bg = "NONE", fg = "#666666", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpItemKindTypeParameterDefault",   { bg = "NONE", fg = "#666666", bold = false, italic = false })

vim.api.nvim_set_hl(0, "CmpGhostText",  { bg = "NONE", fg = "#444444", italic = false })


