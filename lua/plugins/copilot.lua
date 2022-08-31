vim.g.copilot_enabled = true

vim.g.copilot_filetypes = {
    c = true,
    go = true,
    python = true,
    lua = true,
    php = true,
    html = true,
    bash = true,
    sh = true,
    rust = true,
    javascript = true,
    typescript = true,
}

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

vim.keymap.set('i', "<A-l>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true })

vim.keymap.set('i', "<A-[>", "<Plug>copilot-next<CR>", { noremap = true, silent = true })
vim.keymap.set('i', "<A-]>", "<Plug>copilot-previout<CR>", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "CopilotSuggestion", { bg = "NONE", fg = "#444444", bold = false, italic = true })
