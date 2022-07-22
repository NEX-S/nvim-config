
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

local nvim_cmp = require('cmp')
local luasnip = require('luasnip')

nvim_cmp.setup {
    completion = { keyword_length = 1, },
    experimental = { ghost_text = true },
    snippet = {
        -- 开启 LuaSnip 代码片段补全
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    -- 补全边框
    window = {
        completion = nvim_cmp.config.window.bordered(),
        documentation = nvim_cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-p>'] = nvim_cmp.mapping.select_prev_item(),
        ['<C-n>'] = nvim_cmp.mapping.select_next_item(),
        ['<C-d>'] = nvim_cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = nvim_cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = nvim_cmp.mapping.complete(),
        ['<C-e>'] = nvim_cmp.mapping.close(),
        ["<CR>"] = nvim_cmp.mapping.confirm {
            behavior = nvim_cmp.ConfirmBehavior.Replace,
            select = false,
        },
        ["<Tab>"] = nvim_cmp.mapping(
            function(fallback)
                if nvim_cmp.visible() then
                    nvim_cmp.select_next_item()
                else
                    fallback()
                end
            end, { "i", "s" }
        ),
        ["<S-Tab>"] = nvim_cmp.mapping(
            function(fallback)
                if luasnip.jumpable() then
                    luasnip.jump(1)
                else
                    fallback()
                end
            end, { "i", "s", }
        ),
        ---------------------------------
        -- ['<Tab>'] = nvim_cmp.mapping (
        --     function(fallback)
        --         if nvim_cmp.visible() then
        --             nvim_cmp.confirm {
        --                 select = true,
        --                 behavior = nvim_cmp.ConfirmBehavior.Insert
        --             }
        --         elseif luasnip.expandable() then
        --             luasnip.expand()
        --         else
        --             fallback()
        --         end
        --     end, { "i", "s", }
        -- ),
        -- ["<S-Tab>"] = nvim_cmp.mapping(
        --     function(fallback)
        --         if nvim_cmp.visible() then
        --             nvim_cmp.select_next_item()
        --         elseif luasnip.jumpable(1) then
        --             luasnip.jump(1)
        --         else
        --             fallback()
        --         end
        --     end, { "i", "s", }
        -- ),
    },
    -- 补全图标
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", cmp_icons[vim_item.kind])
            vim_item.menu = ({
                nvim_lsp = " - LSP",
                luasnip = " - SNIPPET",
                buffer = " - BUFFER",
                path = " - PATH",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = nvim_cmp.config.sources {
        { name = 'path' },          -- PATH COMPLETION
        { name = 'buffer' },        -- BUFFER COMPLETION
        { name = 'nvim_lsp' },      -- LSP COMPLETION
        { name = 'nvim_lua' },      -- NVIM-API COMPLETION
        { name = 'luasnip' },       -- LUASNIP COMPLETION
    },
    confirm_opts = {
        behavior = nvim_cmp.ConfirmBehavior.Replace,
        select = false,
    },
}

-- 开启搜索补全 --
-- nvim_cmp.setup.cmdline( '/', {
--     mapping = nvim_cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })
--
--
-- nvim_cmp.setup.cmdline( '?', {
--     mapping = nvim_cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })

-- 开启命令补全 --
-- nvim_cmp.setup.cmdline(':', {
--     mapping = nvim_cmp.mapping.preset.cmdline(),
--     sources = nvim_cmp.config.sources({
--         { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--     })
-- })


-- If you want insert `(` after select function or method item
local nvim_cmp_autopairs = require('nvim-autopairs.completion.cmp')
nvim_cmp.event:on(
    'confirm_done',
    nvim_cmp_autopairs.on_confirm_done()
)

