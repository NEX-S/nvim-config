--     __  ___   _________  __ ____  ____________________________   --
--    / / / / | / / ____/ |/ // __ \/ ____/ ____/_  __/ ____/ __ \  --
--   / / / /  |/ / __/  |   // /_/ / __/ / /     / / / __/ / / / /  --
--  / /_/ / /|  / /___ /   |/ ____/ /___/ /___  / / / /___/ /_/ /   --
--  \____/_/ |_/_____//_/|_/_/   /_____/\____/ /_/ /_____/_____/    --
--                                                                  --

pcall(require, "impatient")

pcall(vim.cmd, "color Base2Tone_SeaDark")

require 'core.keymaps'  -- ~/.config/nvim/lua/core/keymaps.lua
require 'core.options'  -- ~/.config/nvim/lua/core/options.lua
require 'core.autocmd'  -- ~/.config/nvim/lua/core/autocmd.lua
-- require 'core.x-color'  -- ~/.config/nvim/lua/core/x-color.lua

pcall(vim.cmd, "luafile /home/nex/.cache/nvim/packer_compiled.lua")

require "plugins"  -- ~/.config/nvim/lua/plugins/init.lua

vim.cmd [[autocmd FileType c ++once luafile /home/nex/.config/nvim/lua/plugins/LLDB.lua]]

vim.keymap.set('n',';c',':ComComment<CR>', { noremap = true, silent = true })
vim.keymap.set('x',';c',':ComComment<CR>gv', { noremap = true, silent = true })

vim.keymap.set('n','<F1>',':color Base2Tone_SeaDark<CR>',    { noremap = true, silent = true })
vim.keymap.set('n','<F2>',':color Base2Tone_ForestDark<CR>', { noremap = true, silent = true })
vim.keymap.set('n','<F3>',':color Base2Tone_FieldDark<CR>',  { noremap = true, silent = true })
vim.keymap.set('n','<F4>',':color Base2Tone_DesertDark<CR>', { noremap = true, silent = true })

vim.keymap.set('n', ";j", "G", { noremap = true, silent = true })
vim.keymap.set('n', ";k", "gg", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "NonText",      { bg = "NONE", fg = "#323232", })

vim.keymap.set('n', ";t", function ()
    local cursor_word = vim.fn.expand('<cword>')

    vim.cmd("vs term://fish -c'trans -hl en -to zh -j -speak -indent 4 " .. cursor_word .. "'")
    vim.cmd "vertical resize 40"

    vim.keymap.set('n', '<ESC>', ":q<CR>", { noremap = true, silent = true, buffer = true })
end,
{ noremap = true, silent = true })
