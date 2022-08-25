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
pcall(vim.cmd, "luafile ~/.cache/nvim/packer_compiled.lua")

require 'core.keymaps'  -- ~/.config/nvim/lua/core/keymaps.lua
require 'core.options'  -- ~/.config/nvim/lua/core/options.lua
require 'core.autocmd'  -- ~/.config/nvim/lua/core/autocmd.lua
require 'core.x-color'  -- ~/.config/nvim/lua/core/x-color.lua

require 'plugins.packer'  -- ~/.config/nvim/lua/plugins/packer.lua

--                       --
--                       --
--                  ﴂ ﴃ    --
--    﫢           ﮲   ﱕ    --
--   ﯟ     ﰊ ﰉ ﱢ ﱡ 諸喝卑ﰩ    廓--

-- File           
-- Module         
-- Namespace      ﱕ
-- Package        
-- Class          
-- Method         
-- Property       
-- Field          
-- Constructor    
-- Enum           
-- Interface      
-- Function       
-- Variable       
-- Constant       
-- String         
-- Number         
-- Boolean        
-- Array          
-- Object         
-- Key            
-- Null           
-- EnumMember     
-- Struct         ﯟ
-- Event          
-- Operator       
-- TypeParameter  
-- TypeAlias      
-- Parameter      
-- StaticMethod   ﴂ
-- Macro          

