vim.opt.commentstring = "// %s"

vim.keymap.set('v', ";b", "A */<ESC>gvo<ESC>i/* <ESC>gvo6l", { noremap = true, silent = true })
vim.keymap.set('n', ";b", "a/*  */<LEFT><LEFT><LEFT>", { noremap = true, silent = true })
-- vim.keymap.set('n', ";c", ":normal!m0I// <ESC>`0", { noremap = true, silent = true })
