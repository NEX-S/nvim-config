
local M = require "LSP.lsp-config"

local lspconfig = require('lspconfig')

lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    -- root_dir = require "lspconfig".util.root_pattern('*.lua'),
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim', 'use' } },
            workspace = {
                library = {
                    [ vim.fn.expand("$VIMRUNTIME/lua") ] = true,
                    [ vim.fn.stdpath("config") .. "/lua" ] = true,
                },
            },
        }
    },
}

lspconfig.pyright.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    -- root_dir = require "lspconfig".util.root_pattern('*.py'),
}

-- TODO: COMPARE WEATHER USING HTML LSP CAN GET BETTER EXPERIENCE.
-- lspconfig.html.setup {
--     on_attach = M.on_attach,
--     capabilities = M.capabilities,
--     -- root_dir = require "lspconfig".util.root_pattern('*.html'),
-- }

lspconfig.clangd.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    -- root_dir = require "lspconfig".util.root_pattern('*.c'),
}

lspconfig.intelephense.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    -- root_dir = require "lspconfig".util.root_pattern('*.php')
}
