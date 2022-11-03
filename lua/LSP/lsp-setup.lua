
local M = require "LSP.lsp-config"

local lspconfig = require "lspconfig"

local function root_dir(ft)
    return lspconfig.util.root_pattern("package.json", "jsconfig.json", ".git")
        or lspconfig.util.root_pattern("*."..ft)
        or vim.fn.getcwd()
end

-- print(vim.pretty_print(M.capabilities))
-- https://github.com/sumneko/lua-language-server/blob/master/locale/zh-cn/setting.lua
lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    -- capabilities = M.capabilities,
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    commitCharactersSupport = true,
                    deprecatedSupport = true,
                    insertReplaceSupport = true,
                    labelDetailsSupport = true,
                    preselectSupport = true,
                    resolveSupport = {
                        properties = { "documentation", "detail", "additionalTextEdits" }
                    },
                    snippetSupport = false,
                    tagSupport = {
                        valueSet = { 1 }
                    }
                }
            }
        }
    },
    single_file_support = true,
    root_dir = root_dir('lua'),
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim', 'use' } },
            completion = {
                keywordSnippet = "Disable",
            },
            -- workspace = {
            --     library = {
            --         [ vim.fn.expand("$VIMRUNTIME/lua") ] = true,
            --         [ vim.fn.stdpath("config") .. "/lua" ] = true,
            --     },
            -- },
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
-- lspconfig.html.setup {
--     on_attach = M.on_attach,
--     capabilities = M.capabilities,
--     -- root_dir = require "lspconfig".util.root_pattern('*.html'),
-- }

lspconfig.clangd.setup {
    on_attach = M.on_attach,
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    commitCharactersSupport = true,
                    deprecatedSupport = true,
                    insertReplaceSupport = true,
                    labelDetailsSupport = true,
                    preselectSupport = true,
                    resolveSupport = {
                        properties = { "documentation", "detail", "additionalTextEdits" }
                    },
                    snippetSupport = false,
                    tagSupport = {
                        valueSet = { 1 }
                    }
                }
            }
        }
    },
    -- single_file_support = true,
    -- root_dir = root_dir('c'),
    filetyped = { "c", "cpp" },
    cmd = {
        "clangd",
        "--enable-config",
        -- "--clang-tidy",
        -- "--all-scopes-completion=false",
        "--background-index",
        "--header-insertion=iwyu",
        "--pch-storage=memory"
    }
}

lspconfig.intelephense.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    single_file_support = true,
    root_dir = root_dir('php'),
}

-- lspconfig.jsonls.setup {
--     on_attach = M.on_attach,
--     capabilities = M.capabilities,
--     single_file_support = true,
-- }

-- lspconfig.marksman.setup {
--     on_attach = M.on_attach,
--     capabilities = M.capabilities,
--     single_file_support = true,
-- }

-- lspconfig.grammarly.setup {
--     -- on_attach = M.on_attach,
--     -- capabilities = M.capabilities,
--     init_options = { clientId = 'client_BaDkMgx4X19X9UxxYRCXZo', },
--     root_dir = root_dir('md')
--     -- single_file_support = true,
-- }
