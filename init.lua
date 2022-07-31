--                                                                  --
--     __  ___   _________  __ ____  ____________________________   --
--    / / / / | / / ____/ |/ // __ \/ ____/ ____/_  __/ ____/ __ \  --
--   / / / /  |/ / __/  |   // /_/ / __/ / /     / / / __/ / / / /  --
--  / /_/ / /|  / /___ /   |/ ____/ /___/ /___  / / / /___/ /_/ /   --
--  \____/_/ |_/_____//_/|_/_/   /_____/\____/ /_/ /_____/_____/    --
--                                                                  --
--                          [ UNEXPECTED ]                          --
--                                                                  --

pcall(require, "impatient")

pcall(require, 'plugins.packer_compiled')

vim.cmd "color nex-color"

require 'core.keymaps'  -- ~/.config/nvim/lua/core/keymaps.lua
require 'core.options'  -- ~/.config/nvim/lua/core/options.lua
require 'core.autocmd'  -- ~/.config/nvim/lua/core/autocmd.lua

require 'core.plugins'  -- ~/.config/nvim/lua/core/plugins.lua

--                       --
--                       --
--                  ﴂ ﴃ    --
--    﫢           ﮲   ﱕ    --
--   ﯟ     ﰊ ﰉ ﱢ ﱡ 諸喝卑ﰩ    廓--

-- UbuntuMono Nerd Font Mono
-- ShureTechMono Nerd Font Mono
-- CaskaydiaCove Nerd Font Mono
-- Cousine Nerd Font Mono
-- MesloLGS Nerd Font Mono
