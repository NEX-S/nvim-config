--     __  ___   _________  __ ____  ____________________________   --
--    / / / / | / / ____/ |/ // __ \/ ____/ ____/_  __/ ____/ __ \  --
--   / / / /  |/ / __/  |   // /_/ / __/ / /     / / / __/ / / / /  --
--  / /_/ / /|  / /___ /   |/ ____/ /___/ /___  / / / /___/ /_/ /   --
--  \____/_/ |_/_____//_/|_/_/   /_____/\____/ /_/ /_____/_____/    --
--                                                                  --

pcall(require, "impatient")

require 'core.keymaps'  -- ~/.config/nvim/lua/core/keymaps.lua
require 'core.options'  -- ~/.config/nvim/lua/core/options.lua
require 'core.autocmd'  -- ~/.config/nvim/lua/core/autocmd.lua
require 'core.x-color'  -- ~/.config/nvim/lua/core/x-color.lua

pcall(vim.cmd, "luafile ~/.cache/nvim/packer_compiled.lua")

require "plugins"  -- ~/.config/nvim/lua/plugins/init.lua

vim.cmd [[autocmd FileType c ++once luafile ~/.config/nvim/lua/plugins/GDB.lua]]
