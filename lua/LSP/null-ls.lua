
local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        -- MARKDOWN
        -- null_ls.builtins.diagnostics.markdownlint,

        -- HTML
        -- null_ls.builtins.formatting.prettier,

        -- Python
        -- null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.diagnostics.pylint,
        -- null_ls.builtins.formatting.autopep8,

        -- Lua
        -- null_ls.builtins.formatting.stylua.with {
        --     extra_args = {
        --         "--indent-type=Spaces",
        --         "--indent-width=4",
        --     },
        -- },
        -- null_ls.builtins.diagnostics.luacheck,

        -- C/C++
        -- null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.diagnostics.cppcheck,

        -- PHP
        -- null_ls.builtins.diagnostics.php,
        -- null_ls.builtins.diagnostics.phpstan,
        -- null_ls.builtins.diagnostics.psalm,
        -- null_ls.builtins.formatting.phpcsfixer,
    },
}
