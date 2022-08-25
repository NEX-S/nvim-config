
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp_icons = {
    Text        = "",
    Method      = "",
    Function    = "",
    Field       = "ﯟ",
    Variable    = "",
    Class       = "",
    Interface   = "",
    Module      = "",
    Property    = "",
    Unit        = "",
    Value       = "",
    Enum        = "",
    Keyword     = "",
    Snippet     = "",
    Color       = "ﰊ",
    File        = "",
    Reference   = "",
    Folder      = "",
    EnumMember  = "",
    Constant    = "",
    Struct      = "",
    Event       = " ",
    Operator    = "+",
    Constructor = "",
    TypeParameter = "",
}

local nvim_cmp = require "cmp"

nvim_cmp.setup {
    completion = { keyword_length = 1, },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
    -- 补全边框
    window = {
        -- completion = nvim_cmp.config.window.bordered(),
        -- documentation = nvim_cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-j>'] = nvim_cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = nvim_cmp.mapping.scroll_docs(4),
        ['<C-e>'] = nvim_cmp.mapping.close(),
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
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", cmp_icons[vim_item.kind])
            vim_item.menu = ({
                nvim_lsp = " - LSP",
                luasnip  = " - SNIPPET",
                buffer   = " - BUFFER",
                path     = " - PATH",
                calc     = " - CALC",
                nvim_lua = " - NVIM-API",
                nvim_lsp_signature_help = " - SIGNATURE",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = nvim_cmp.config.sources {
        { name = 'path' },          -- PATH COMPLETION
        { name = 'luasnip' },       -- LUASNIP COMPLETION
        { name = 'buffer' },        -- BUFFER COMPLETION
        { name = 'nvim_lsp' },      -- LSP COMPLETION
        { name = 'calc' },          -- CLAC COMPLETION
        { name = 'nvim_lsp_signature_help' },
        -- { name = 'rg', option = { additional_arguments = "--smart-case --hidden --max-depth = 10 -m 5", debonce = 2000 } },
    },
    confirm_opts = {
        behavior = nvim_cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- FIX: include in C
    snippet = {
        expand = function(args)
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

nvim_cmp.setup.filetype('lua', {
    sources = {
        { name = 'nvim_lsp' },      -- LSP COMPLETION
        { name = 'path' },          -- PATH COMPLETION
        { name = 'buffer' },        -- BUFFER COMPLETION
        { name = 'luasnip' },       -- LUASNIP COMPLETION
        { name = 'nvim_lua' },      -- NVIM-API COMPLETION
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
    },
})

nvim_cmp.setup.cmdline('?', {
    mapping = nvim_cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp_document_symbol' },
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

