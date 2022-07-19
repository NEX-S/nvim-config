
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- local cmp_ok, nvim_cmp = pcall(require, 'cmp')
--
-- if not cmp_ok then
--     vim.notify(' [ NVIM-CMP ] NOT FOUND.')
--     return
-- end
--
-- local luasnip_ok, luasnip = pcall(require, 'luasnip')
--
-- if not luasnip_ok then
--     vim.notify(' [ LuaSnip ] NOT FOUND.')
--     return
-- end

-- Load freindly-snippets
-- require("luasnip.loaders.from_vscode").lazy_load()

-- require("luasnip.loaders.from_vscode").load {
--     paths = { vim.fn.stdpath("config") .. "/snippets" }
-- }

--                      
--                      
--                  ﴂ ﴃ   
--    﫢               ﮲  
-- ﱕ      ﯟ     ﰊ ﰉ ﱢ ﱡ 諸喝卑ﰩ   

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

-- vim.cmd [[
--     " gray
--     highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--     " blue
--     highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--     highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--     " light blue
--     highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--     highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--     highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--     " pink
--     highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--     highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--     " front
--     highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--     highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--     highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
-- ]]

-- If you want insert `(` after select function or method item
local nvim_cmp_autopairs = require('nvim-autopairs.completion.cmp')
nvim_cmp.event:on(
    'confirm_done',
    nvim_cmp_autopairs.on_confirm_done()
)

