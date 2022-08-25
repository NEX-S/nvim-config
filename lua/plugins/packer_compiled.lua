-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nex/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nex/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "                require \"Comment\".setup {\n                    -- Add a space b/w comment and the line\n                    -- @type boolean|fun():boolean\n                    padding = true,\n\n                    -- Whether the cursor should stay at its position\n                    -- NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat\n                    -- @type boolean\n                    sticky = true,\n\n                    -- Lines to be ignored while comment/uncomment.\n                    -- Could be a regex string or a function that returns a regex string.\n                    -- Example: Use '^$' to ignore empty lines\n                    -- @type string|fun():string\n                    ignore = nil,\n\n                    -- LHS of toggle mappings in NORMAL + VISUAL mode\n                    -- @type table\n                    toggler = {\n                        -- Line-comment toggle keymap\n                        line = ';c',\n                        -- Block-comment toggle keymap\n                        block = ';b',\n                    },\n\n                    -- LHS of operator-pending mappings in NORMAL + VISUAL mode\n                    -- @type table\n                    opleader = {\n                        -- Line-comment keymap\n                       line = 'gc',\n                        -- Block-comment keymap\n                        block = 'gb',\n                    },\n\n                    -- LHS of extra mappings\n                    -- @type table\n                    extra = {\n                        -- Add comment on the line above\n                        above = 'gcO',\n                        -- Add comment on the line below\n                        below = 'gco',\n                        -- Add comment at the end of line\n                        eol = 'gcA',\n                    },\n\n                    -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode\n                    -- NOTE: If `mappings = false` then the plugin won't create any mappings\n                    -- @type boolean|table\n                    mappings = {\n                        -- Operator-pending mapping\n                        -- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`\n                        -- NOTE: These mappings can be changed individually by `opleader` and `toggler` config\n                        basic = true,\n                        -- Extra mapping\n                        -- Includes `gco`, `gcO`, `gcA`\n                        extra = true,\n                        -- Extended mapping\n                        -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`\n                        extended = false,\n                    },\n\n                    -- Pre-hook, called before commenting the line\n                    -- @type fun(ctx: CommentCtx):string\n                    pre_hook = nil,\n\n                    -- Post-hook, called after commenting is done\n                    -- @type fun(ctx: CommentCtx)\n                    post_hook = nil,\n                }\n                vim.keymap.set('v', ';c', 'gcgv', { remap = true, silent = true })\n            " },
    keys = { { "", ";c" }, { "", ";bc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { ' require "plugins.luasnip" ' },
    load_after = {
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { ' require "LSP.aerial" ' },
    load_after = {
      ["lualine.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["b64.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/b64.nvim",
    url = "https://github.com/taybart/b64.nvim"
  },
  ["bufferline.nvim"] = {
    config = { ' require "plugins.bufferline" ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {
      ["cmp-nvim-lsp-signature-help"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["cmp-cmdline-history"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    after = { "cmp-cmdline", "cmp-nvim-lsp-document-symbol" },
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history/after/plugin/cmp_cmdline_history.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol/after/plugin/cmp_nvim_lsp_document_symbol.lua" },
    load_after = {
      ["cmp-cmdline-history"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after = { "cmp-calc" },
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["cmp-path"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after = { "cmp-nvim-lsp-signature-help" },
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after = { "friendly-snippets" },
    after_files = { "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["code_runner.nvim"] = {
    commands = { "RunFile", "RunCode" },
    config = { "                require \"code_runner\".setup {\n                    mode = \"float\",\n                    startinsert = true,\n                    close_key = '<ESC>',\n                    float = {\n                        border = \"single\",\n                        blend = 20,\n                    },\n                    filetype = {\n                        python = \"time python3 -u\",\n                        c = \"cd $dir && clang $fileName -std=gnu2x -I ./ -g -o ./bin/$fileNameWithoutExt -Wall && printf 'ïƒ—\\\\n' && time ./bin/$fileNameWithoutExt\",\n                        php = \"time php $fileName\",\n                        sh = \"time sh $fileName\",\n                        html = \"time google-chrome-stable $fileName\",\n                        lua = \"lua $fileName\",\n                        http = require \"rest-nvim\".run,\n                        vim = function ()\n                            vim.cmd \"w | source $MYVIMRC | source %\"\n                        end,\n                        markdown = function ()\n                            vim.cmd \"MarkdownPreviewToggle\"\n                        end,\n                    },\n                }\n            " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/code_runner.nvim",
    url = "https://github.com/CRAG666/code_runner.nvim"
  },
  ["friendly-snippets"] = {
    after = { "LuaSnip" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { " require 'plugins.gitsigns' " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/nex/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { '                require "indent_blankline".setup {\n                    char = "Â¦",\n                    show_first_indent_level = false,\n                }\n            ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { ' require "LSP.lsp-saga" ' },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    after = { "aerial.nvim", "nvim-lsp-installer" },
    config = { ' require "plugins.lualine" ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    after = { "md-img-paste.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["md-img-paste.vim"] = {
    load_after = {
      ["markdown-preview.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/md-img-paste.vim",
    url = "https://github.com/ferrine/md-img-paste.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n©\5\0\0\v\0\19\1&6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0005\5\a\0=\5\b\4=\4\t\3B\1\2\0016\1\0\0'\3\n\0B\1\2\0026\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0005\n\14\0B\6\4\2\18\b\6\0009\6\15\0069\t\16\2B\t\1\0A\6\1\2\18\b\6\0009\6\17\0069\t\18\2B\t\1\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\tdone\14with_move\tnone\14with_pair\1\3\0\0\6c\bcpp\6>\14add_rules\25nvim-autopairs.conds\24nvim-autopairs.rule\14fast_wrap\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\14highlight\vSearch\fend_key\6$\19highlight_grey\fComment\tkeys\31qwertyuiopzxcvbnmasdfghjkl\fpattern\23[%'%\"%)%>%]%)%}%,]\16check_comma\2\bmap\f<S-TAB>\21disable_filetype\1\0\f\fmap_c_w\1\fmap_c_h\1\vmap_bs\2\vmap_cr\2\rcheck_ts\1\15break_undo\2\28enable_bracket_in_quote\2\30enable_check_bracket_line\2\22enable_afterquote\2\21enalbe_moveright\2\27disable_in_visualblock\2\21disable_in_macro\2\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\3€€À™\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { ' require "plugins.nvim-cmp" ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { " require \"colorizer\".setup({ '*'; }, { mode = 'foreground' }) " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { ' require "DAP.dap-config" ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    after = { "nvim-dap-virtual-text" },
    config = { ' require "DAP.dap-ui" ' },
    keys = { { "", ";;" }, { "", "<C-d>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "                require \"nvim-dap-virtual-text\".setup {\n                    enabled = true,                        -- enable this plugin (the default)\n                    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)\n                    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText\n                    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)\n                    show_stop_reason = true,               -- show stop reason when stopped for exceptions\n                    commented = false,                     -- prefix virtual text with comment string\n                    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)\n                    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)\n                    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)\n                    -- experimental features:\n                    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`\n                    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.\n                    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)\n                    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,\n                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`\n                }\n            " },
    load_after = {
      ["nvim-dap-ui"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lsp-installer"] = {
    config = { "                require \"nvim-lsp-installer\".setup {\n                    automatic_installation = true,\n                    ensure_installed = { 'sumneko_lua', 'intelephense', 'pyright', 'clangd' },\n                    ui = {\n                        icons = {\n                            server_installed = 'î‰ ',\n                            server_pending = 'î˜¤ ',\n                            server_uninstalled = 'ïŸ˜ ',\n                        },\n                    },\n                }\n                require \"LSP.lsp-setup\"\n            " },
    load_after = {
      ["lualine.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "lspsaga.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeFindFileToggle" },
    config = { ' require "plugins.nvim-tree" ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-rainbow", "nvim-treesitter-textobjects" },
    config = { ' require "plugins.treesitter" ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rest.nvim"] = {
    config = { "                require \"rest-nvim\".setup {\n                    -- Open request results in a horizontal split\n                    result_split_horizontal = false,\n                    -- Keep the http file buffer above|left when split horizontal|vertical\n                    result_split_in_place = false,\n                    -- Skip SSL verification, useful for unknown certificates\n                    skip_ssl_verification = false,\n                    -- Highlight request on run\n                    highlight = {\n                        enabled = true,\n                        timeout = 150,\n                    },\n                    result = {\n                        -- toggle showing URL, HTTP info, headers at top the of result window\n                        show_url = true,\n                        show_http_info = true,\n                        show_headers = true,\n                    },\n                    -- Jump to request line on run\n                    jump_to_request = false,\n                    env_file = '.env',\n                    custom_dynamic_variables = {},\n                    yank_dry_run = true,\n                }\n            " },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    after = { "telescope.nvim" },
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { " require 'plugins.telescope' " },
    load_after = {
      ["telescope-fzf-native.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/nex/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-translator"] = {
    config = { "                vim.g.translator_default_engines = { 'google' }\n                vim.keymap.set('n', ';t', '<PLUG>TranslateW', { noremap = true, silent = true })\n                vim.keymap.set('v', ';t', '<PLUG>TranslateWV', { noremap = true, silent = true })\n            " },
    keys = { { "", ";t" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nex/.local/share/nvim/site/pack/packer/opt/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  vimcdoc = {
    loaded = true,
    path = "/home/nex/.local/share/nvim/site/pack/packer/start/vimcdoc",
    url = "https://github.com/yianwillis/vimcdoc"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^aerial"] = "aerial.nvim",
  ["^b64"] = "b64.nvim",
  ["^cmp"] = "nvim-cmp",
  ["^cmp_nvim_lsp"] = "cmp-nvim-lsp",
  ["^dap"] = "nvim-dap",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^packer"] = "packer.nvim",
  ["^plenary"] = "plenary.nvim",
  ["^rest%-nvim"] = "rest.nvim",
  ["^treesitter%-context"] = "nvim-treesitter-context"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: md-img-paste.vim
time([[Setup for md-img-paste.vim]], true)
                vim.g.mdip_imgdir = './images'
                vim.g.mdip_imgname = 'image'
                local bufopts = { noremap = true, silent = truel, buffer = true }
                vim.keymap.set('n', "<A-v>", "<CMD>call mdip#MarkdownClipboardImage()<CR>", bufopts)
                vim.keymap.set('i', "<A-v>", "<CMD>call mdip#MarkdownClipboardImage()<CR>", bufopts)
            
time([[Setup for md-img-paste.vim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RunCode lua require("packer.load")({'code_runner.nvim'}, { cmd = "RunCode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope-fzf-native.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFileToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFileToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RunFile lua require("packer.load")({'code_runner.nvim'}, { cmd = "RunFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> ;; <cmd>lua require("packer.load")({'nvim-dap-ui'}, { keys = ";;", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ;t <cmd>lua require("packer.load")({'vim-translator'}, { keys = ";t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-d> <cmd>lua require("packer.load")({'nvim-dap-ui'}, { keys = "<lt>C-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ;bc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = ";bc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ;c <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = ";c", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "http" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'cmp-nvim-lua', 'nvim-treesitter', 'nvim-colorizer.lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-treesitter', 'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-treesitter', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-treesitter', 'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "json" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'cmp-path', 'lualine.nvim', 'cmp_luasnip', 'indent-blankline.nvim', 'nvim-ts-autotag', 'cmp-buffer', 'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufCreate * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufCreate *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au TabEnter * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "TabEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'cmp-buffer', 'cmp-cmdline-history', 'nvim-cmp'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufAdd * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufAdd *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'lualine.nvim', 'indent-blankline.nvim', 'gitsigns.nvim'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
