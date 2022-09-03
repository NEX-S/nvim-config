
local M = require "LSP.lsp-config"

local lspconfig = require "lspconfig"

local function root_dir(ft)
    return lspconfig.util.root_pattern("package.json", "jsconfig.json", ".git")
        or lspconfig.util.root_pattern("*."..ft)
        or vim.fn.getcwd()
end

lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    single_file_support = true,
    root_dir = root_dir('lua'),
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
    single_file_support = true,
    root_dir = root_dir('py'),
}

-- TODO: COMPARE WEATHER USING HTML LSP CAN GET BETTER EXPERIENCE.
lspconfig.html.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    -- root_dir = require "lspconfig".util.root_pattern('*.html'),
}

lspconfig.clangd.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    single_file_support = true,
    -- root_dir = root_dir('c'),
    cmd = {
        "clangd",
        -- "--background-index",
        -- "--clang-tidy",
        -- "--clang-tidy-checks=performance-*,bugprone-*",
        -- "--all-scopes-completion",
        -- "--completion-style=detailed",
        -- "--header-insertion=iwyu",
    }
}

lspconfig.intelephense.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    single_file_support = true,
    root_dir = root_dir('php'),
}

lspconfig.jsonls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    single_file_support = true,
}

lspconfig.marksman.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    single_file_support = true,
}

-- lspconfig.grammarly.setup {
--     on_attach = M.on_attach,
--     capabilities = M.capabilities,
--     single_file_support = true,
-- }
