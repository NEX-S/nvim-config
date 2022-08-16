
local types = require "luasnip.util.types"

require "luasnip".config.setup {
    region_check_events = "CursorHold,InsertEnter,InsertLeave",
    delete_check_events = "TextChanged,InsertEnter",
    ext_opts = {
        [types.choiceNode] = { active = { virt_text = {{ "", "LuasnipChoiceNodeActive" }} } },
        [types.insertNode] = { active = { virt_text = {{ "", "LuasnipInsertNodeActive" }} } },
    },
}
vim.api.nvim_set_hl(0, "LuasnipChoiceNodeActive", { bg = "NONE", fg = "#D0EE7A", })
vim.api.nvim_set_hl(0, "LuasnipInsertNodeActive", { bg = "NONE", fg = "#C53B82", })

require "luasnip.loaders.from_vscode".lazy_load()

local nvim_cmp = require "cmp"
local luasnip  = require "luasnip"

nvim_cmp.setup {
    snippet = {
        -- 开启 LuaSnip 代码片段补全
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<TAB>"] = nvim_cmp.mapping(
            function(fallback)
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                elseif nvim_cmp.visible() then
                    nvim_cmp.confirm {
                        behavior = nvim_cmp.ConfirmBehavior.Replace,
                        select = true,
                    }
                else
                    fallback()
                end
            end, { "i", "s", }
        ),
        ["<S-Tab>"] = nvim_cmp.mapping(
            function(fallback)
                if nvim_cmp.visible() then
                    nvim_cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s", }
        ),
    },
}

