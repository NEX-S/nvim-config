
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

vim.g.copilot_not_tab_map = true

vim.keymap.set('i', "<A-l>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true })

vim.keymap.set('i', "<A-n>", "<PLUG>copilot-next", { noremap = true, silent = true })
vim.keymap.set('i', "<A-p>", "<PLUG>copilot-previout", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#FFFFFF", bg = "#000000", bold = false, italic = false })

-- vim.cmd([[
--     imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
--     let g:copilot_no_tab_map = v:true
-- ]])
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
