

-- pcall(require, "impatient")


vim.opt.runtimepath = {
    '~/.config/nvim/zen/',
    '/usr/share/nvim/runtime',
    '/home/nex/.local/share/nvim/site',
    '/usr/local/share/nvim/site',
    '/usr/share/nvim/site',
    '/usr/share/nvim/site/after',
    '/usr/local/share',
    '/nvim/site/after',
    '/home/nex/.local/share/nvim/site/after',
    '/home/nex/.config/nvim/after',
    '/etc/xdg/nvim',
    '/lib/nvim',
    '/etc/xdg/nvim/after',
}

require "options"       -- ~/.config/nvim/zen/lua/options.lua
require "keymaps"       -- ~/.config/nvim/zen/lua/keymaps.lua
require "autocmd"       -- ~/.config/nvim/zen/lua/autocmd.lua
require "plugins"       -- ~/.config/nvim/zen/lua/plugins.lua
require "colorscheme"   -- ~/.config/nvim/zen/lua/colorscheme.lua
