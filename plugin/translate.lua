vim.keymap.set('v', ";t", function ()
    local selected_string = vim.api.nvim_eval("getline(\"'<\")[getpos(\"'<\")[2]-1:getpos(\"'>\")[2]-1]")
    local trans_cmd = "trans -hl en -to zh -j -speak -indent 4 '" .. selected_string .. "'"

    vim.cmd "vs"
    vim.cmd "vertical resize 60"
    vim.cmd("terminal " .. trans_cmd)

    vim.keymap.set('n', '<ESC>', ":q<CR>", { noremap = true, silent = true, buffer = true })
end,
{ noremap = true, silent = true })

vim.keymap.set('n', ";t", function ()
    local cursor_word = vim.fn.expand('<cword>')
    local trans_cmd = "trans -hl en -to zh -j -speak -indent 4 '" .. cursor_word .. "'"

    vim.cmd "vs"
    vim.cmd("terminal " .. trans_cmd)
    vim.cmd "vertical resize 60"

    vim.keymap.set('n', '<ESC>', ":q<CR>", { noremap = true, silent = true, buffer = true })
end,
{ noremap = true, silent = true })
