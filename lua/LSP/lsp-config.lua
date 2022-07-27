
vim.diagnostic.config {
    virtual_text = true,
    signs = {
        active = {
            { name = "DiagnosticSignError", text = ' ' },
            { name = "DiagnosticSignWarn",  text = '--' },
            { name = "DiagnosticSignHint",  text = ' ' },
            { name = "DiagnosticSignInfo",  text = ' ' },
        }
    },
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "shadow",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "shadow", })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "shadow", })

vim.fn.sign_define("DiagnosticSignError", { text = ' ', texthl = "DiagnosticSignError",       numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignHint",  { text = ' ', texthl = "DiagnosticSignHint",        numhl = "DiagnosticSignHint"  })
vim.fn.sign_define("DiagnosticSignWarn",  { text = '--', texthl = "DiagnosticSignWarning",     numhl = "DiagnosticSignWarn"  })
vim.fn.sign_define("DiagnosticSignInfo",  { text = ' ', texthl = "DiagnosticSignInformation", numhl = "DiagnosticSignInfo"  })

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require "cmp_nvim_lsp".update_capabilities(M.capabilities)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap = true, silent = true })
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true, silent = true })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- vim.keymap.set('n', ';;D', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<C-d>', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', ';;h', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', ';;i', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', ';;r', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<A-=>', vim.lsp.buf.format, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', ';;wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', ';;wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', ';;wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', ';;D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', ';;rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', ';;ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', ';;f', vim.lsp.buf.formatting, bufopts)

    require "aerial".on_attach(client, bufnr)
end

return M
