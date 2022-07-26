local status, packer = pcall(require, 'packer')

if not status then
    print('PACKER NOT FOUND.')
    return nil
end

-- TODO:
packer.init {
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    prompt_border = 'single',
    compile_path = '~/.config/nvim/lua/plugins/packer_compiled.lua',
    keybindings = {
        quit = '<ESC>',
        toggle_info = 'o',
    },
    display = {
        working_sym = ' ',
        error_sym = ' ',
        done_sym = ' ',
        removed_sym = ' -',
        moved_sym = '',
        open_fn = function()
            return require "packer.util".float { border = "single" }
        end,
    }
}

packer.startup {
    function(use)
        -- COLORS --
        -- use 'folke/tokyonight.nvim'
        -- use 'rafamadriz/neon'
        -- use 'shaunsingh/nord.nvim'

        -- PLUGINS --
        -- use { 'wbthomason/packer.nvim', module = "packer" }
        use 'wbthomason/packer.nvim'
        use 'lewis6991/impatient.nvim'
        use 'dstein64/vim-startuptime'
        use 'yianwillis/vimcdoc'

        -- use { 'yianwillis/vimcdoc', cmd = 'h' }

        use { 'nvim-lua/plenary.nvim', module = 'plenary' }
        use { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons' }

        use { 'CRAG666/code_runner.nvim',
            requires = 'nvim-lua/plenary.nvim',
            cmd = { 'RunFile', 'RunCode' },
            config = [[
                require "code_runner".setup {
                    mode = "float",
                    startinsert = true,
                    close_key = '<ESC>',
                    float = {
                        border = "single",
                        blend = 20,
                    },
                    filetype = {
                        python = "time python3 -u",
                        c = "cd $dir && clang $fileName -std=gnu2x -I ./ -g -o ./bin/$fileNameWithoutExt -Wall && printf '\\n' && time ./bin/$fileNameWithoutExt",
                        php = "time php $fileName",
                        sh = "time sh $fileName",
                        html = "time google-chrome-stable $fileName",
                        lua = "lua $fileName",
                        http = require "rest-nvim".run,
                        vim = function ()
                            vim.cmd "w | source $MYVIMRC | source %"
                        end,
                        markdown = function ()
                            vim.cmd "MarkdownPreviewToggle"
                        end,
                    },
                }
            ]]
        }

        -- use { 'kevinhwang91/rnvimr',
        --     cmd = 'RnvimrToggle',
        --     config = [[ vim.g.rnvimr_enable_picker = 1 ]]
        -- }

        -- NVIM-TREE --
        -- ~/.config/nvim/lua/plugins/nvim-tree.lua
        use { 'kyazdani42/nvim-tree.lua',
            cmd = 'NvimTreeFindFileToggle',
            config = [[ require "plugins.nvim-tree" ]]
        }

        -- BUFFERLINE --
        -- ~/.config/nvim/lua/plugins/bufferline.lua
        use { 'akinsho/bufferline.nvim',
            tag = "v2.*",
            event = { 'BufAdd', 'BufCreate', 'BufNewFile', 'TabEnter' },
            config = [[ require "plugins.bufferline" ]]
        }

        -- GITSIGNS --
        -- ~/.config/nvim/lua/plugins/gitsigns.lua
        use { 'lewis6991/gitsigns.nvim',
            event = 'CursorMoved',
            tag = 'release',
            config = [[ require 'plugins.gitsigns' ]]
        }

        -- TOGGLETERM --
        -- use { 'akinsho/toggleterm.nvim',
        --     tag = 'v1.*',
        --     cmd = 'ToggleTerm',
        --     config = [[
        --         require('toggleterm').setup {
        --             start_in_insert = true,
        --             direction = 'float',
        --             float_opts = { border = 'single' }
        --         }
        --     ]]
        -- }

        -- TELESCOPE --
        -- ~/.config/nvim/lua/plugins/telescope.lua
        use { 'nvim-telescope/telescope-fzf-native.nvim',
            cmd = 'Telescope',
            run = [[
                cd ~/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim/ && \
                cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
                cmake --build build --config Release && \
                cmake --install build --prefix build
            ]]
        }
        use { 'nvim-telescope/telescope.nvim',
            after = 'telescope-fzf-native.nvim',
            config = [[ require 'plugins.telescope' ]]
        }

        -- COMMENT --
        -- ~/.config/nvim/lua/plugins/comment.lua
        use { 'numToStr/Comment.nvim',
            keys = { ';c', ';bc' },
            config = [[
                require "Comment".setup {
                    -- Add a space b/w comment and the line
                    -- @type boolean|fun():boolean
                    padding = true,

                    -- Whether the cursor should stay at its position
                    -- NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
                    -- @type boolean
                    sticky = true,

                    -- Lines to be ignored while comment/uncomment.
                    -- Could be a regex string or a function that returns a regex string.
                    -- Example: Use '^$' to ignore empty lines
                    -- @type string|fun():string
                    ignore = nil,

                    -- LHS of toggle mappings in NORMAL + VISUAL mode
                    -- @type table
                    toggler = {
                        -- Line-comment toggle keymap
                        line = ';c',
                        -- Block-comment toggle keymap
                        block = ';b',
                    },

                    -- LHS of operator-pending mappings in NORMAL + VISUAL mode
                    -- @type table
                    opleader = {
                        -- Line-comment keymap
                       line = 'gc',
                        -- Block-comment keymap
                        block = 'gb',
                    },

                    -- LHS of extra mappings
                    -- @type table
                    extra = {
                        -- Add comment on the line above
                        above = 'gcO',
                        -- Add comment on the line below
                        below = 'gco',
                        -- Add comment at the end of line
                        eol = 'gcA',
                    },

                    -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
                    -- NOTE: If `mappings = false` then the plugin won't create any mappings
                    -- @type boolean|table
                    mappings = {
                        -- Operator-pending mapping
                        -- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
                        -- NOTE: These mappings can be changed individually by `opleader` and `toggler` config
                        basic = true,
                        -- Extra mapping
                        -- Includes `gco`, `gcO`, `gcA`
                        extra = true,
                        -- Extended mapping
                        -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
                        extended = false,
                    },

                    -- Pre-hook, called before commenting the line
                    -- @type fun(ctx: CommentCtx):string
                    pre_hook = nil,

                    -- Post-hook, called after commenting is done
                    -- @type fun(ctx: CommentCtx)
                    post_hook = nil,
                }
                vim.keymap.set('v', ';c', 'gcgv', { remap = true, silent = true })
            ]]
        }

        -- DASHBOARD --
        -- ~/.config/nvim/lua/plugins/dashboard.lua
        -- use { 'NEX-S/dashboard-nvim', config = [[ require "plugins.dashboard" ]] }

        -- INDENT-BLANKLINE --
        use { 'lukas-reineke/indent-blankline.nvim',
            event = { 'CursorMoved', 'InsertEnter', },
            config = [[
                require "indent_blankline".setup {
                    char = "¦",
                    show_first_indent_level = false,
                }
            ]]
        }

        -- NVIM-COLORIZER --
        -- ~/.config/nvim/lua/UNEXPECTED/configs/nvim-colorizer.lua
        use { 'norcalli/nvim-colorizer.lua',
            ft = { 'vim', 'lua', 'html', 'css', 'yaml' },
            config = [[ require "colorizer".setup({ '*'; }, { mode = 'foreground' }) ]]
        }

        -- AUTO-PAIRS --
        use { 'windwp/nvim-autopairs',
            event = 'InsertEnter',
            config = function ()
                local autopairs = require "nvim-autopairs"

                autopairs.setup {
                    disable_filetype = { 'TelescopePrompt' },
                    disable_in_macro = true,
                    disable_in_visualblock = true,
                    enalbe_moveright = true,
                    enable_afterquote = true,  -- add bracket pairs after quote
                    enable_check_bracket_line = true,  --- check bracket in same line
                    enable_bracket_in_quote = true, --
                    break_undo = true, -- switch for basic rule break undo sequence
                    check_ts = false,
                    map_cr = true,
                    map_bs = true,  -- map the <BS> key
                    map_c_h = false,  -- Map the <C-h> key to delete a pair
                    map_c_w = false, -- map <c-w> to delete a pair if possible
                    fast_wrap = {
                        map = '<S-TAB>',
                        chars = { '{', '[', '(', '"', "'" },
                        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                        end_key = '$',
                        keys = 'qwertyuiopzxcvbnmasdfghjkl',
                        check_comma = true,
                        highlight = 'Search',
                        highlight_grey='Comment'
                    },
                }
                local Rule = require "nvim-autopairs.rule"
                local cond = require "nvim-autopairs.conds"

                -- C/CPP <harder.h> FIX
                autopairs.add_rules {
                    Rule(">", ">", { "c", "cpp" })
                   :with_pair(cond.none())
                   :with_move(cond.done()),
                }
            end
        }

        -- LSP COMPLETION
        use { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" }

        -- LSP-INSTALLER --
        -- ~/.config/nvim/lua/LSP/lsp-config.lua
        use { "neovim/nvim-lspconfig", module = "lspconfig" }
        use { "williamboman/nvim-lsp-installer",
            after = 'lualine.nvim',
            config = [[
                require "nvim-lsp-installer".setup {
                    automatic_installation = true,
                    ensure_installed = { 'sumneko_lua', 'intelephense', 'pyright', 'clangd' },
                    ui = {
                        icons = {
                            server_installed = ' ',
                            server_pending = ' ',
                            server_uninstalled = ' ',
                        },
                    },
                }
                require "LSP.lsp-setup"
            ]]
        }

        -- NULL-LS --
        -- ~/.config/nvim/lua/LSP/null-ls.lua
        -- use { "jose-elias-alvarez/null-ls.nvim",
        --     event = { 'CursorMoved', 'InsertEnter' },
        --     config = [[ require "LSP.null-ls" ]]
        -- }

        -- LSP-SAGA --
        -- ~/.config/nvim/lua/LSP/lsp-saga.lua
        use { "glepnir/lspsaga.nvim",
            branch = "version_2",
            after = 'nvim-lspconfig',
            -- keys = { "ga", "gh", "gD", "go", "<C-r>", "gd", ";d", ";D", "<A-p>", "<A-n>", ";x", ";0", ";9" },
            config = [[ require "LSP.lsp-saga" ]]
        }

        -- use { "jose-elias-alvarez/null-ls.nvim",
        --     after = 'nvim-lspconfig',
        --     config = [[
        --         require "null-ls".setup {
        --             sources = {
        --                 require "null-ls".builtins.formatting.stylua,
        --                 require "null-ls".builtins.diagnostics.eslint,
        --                 require "null-ls".builtins.completion.spell,
        --             },
        --         }
        --     ]]
        -- }

        -- LSP SIGNATURE --
        -- ~/.config/nvim/lua/LSP/lsp-signature.lua
        -- use { 'ray-x/lsp_signature.nvim',
        --     after = 'nvim-lspconfig',
        --     -- module = 'lsp_signature',
        --     config = [[
        --         require "LSP.lsp-signature"
        --     ]]
        --
        -- }

        -- NVIM-NAVIC --
        -- ~/.config/nvim/lua/plugins/nvim-navic.lua
        -- use { 'SmiteshP/nvim-navic',
        --     module = 'nvim-navic',
        --     config = [[
        --         require('nvim-navic').setup {
        --             icons = {
        --                 File          = " ",
        --                 Module        = " ",
        --                 Namespace     = " ",
        --                 Package       = " ",
        --                 Class         = " ",
        --                 Method        = " ",
        --                 Property      = " ",
        --                 Field         = " ",
        --                 Constructor   = " ",
        --                 Enum          = "練",
        --                 Interface     = "練",
        --                 Function      = " ",
        --                 Variable      = " ",
        --                 Constant      = " ",
        --                 String        = " ",
        --                 Number        = " ",
        --                 Boolean       = "◩ ",
        --                 Array         = " ",
        --                 Object        = " ",
        --                 Key           = " ",
        --                 Null          = "ﳠ ",
        --                 EnumMember    = " ",
        --                 Struct        = " ",
        --                 Event         = " ",
        --                 Operator      = " ",
        --                 TypeParameter = " ",
        --             },
        --             highlight = false,
        --             --           
        --             separator = "  ",
        --             depth_limit = 0,
        --             depth_limit_indicator = "..",
        --         }
        --     ]]
        -- }

        use { "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            ft = 'markdown',
            -- setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
            -- config = function ()
            --     vim.api.nvim_create_autocmd({ "BufNewFile", "BufCreate", "BufReadPost", "BufEnter", "TabEnter" }, {
            --         pattern = { "*.md" },
            --         callback = function ()
            --             local opts = { noremap = true, silent = true }
            --             vim.keymap.set('n', ';r', '<CMD>MarkdownPreviewToggle<CR>', opts)
            --         end
            --     })
            -- end
        }

        use { "ferrine/md-img-paste.vim",
            after = 'markdown-preview.nvim',
            setup = [[
                vim.g.mdip_imgdir = './images'
                vim.g.mdip_imgname = 'image'
                local bufopts = { noremap = true, silent = truel, buffer = true }
                vim.keymap.set('n', "<A-v>", "<CMD>call mdip#MarkdownClipboardImage()<CR>", bufopts)
                vim.keymap.set('i', "<A-v>", "<CMD>call mdip#MarkdownClipboardImage()<CR>", bufopts)
            ]]
        }

        -- MDEVAL --
        -- use { 'jubnzv/mdeval.nvim',
        --     ft = "markdown",
        --     config = function ()
        --         require "mdeval".setup {
        --             -- Don't ask before executing code blocks
        --             require_confirmation = false,
        --             eval_options = {
        --                 c = {
        --                     command = {"clang", "-std=gnu2x"},
        --                     default_header = [[
        --                         #include <stdio.h>
        --                         #include <stdlib.h>
        --                     ]]
        --                 },
        --             },
        --         }
        --         vim.g.markdown_fenced_languages = { 'python', 'c', 'lua', 'html', 'php', 'go', 'bash' }
        --     end
        -- }

        -- LUALINE --
        -- ~/.config/nvim/lua/plugins/lualine.lua
        use { "nvim-lualine/lualine.nvim",
            event = { "CursorMoved", "InsertEnter" },
            config = [[ require "plugins.lualine" ]]
        }

        -- use { 'simrat39/symbols-outline.nvim',
        --     cmd = 'SymbolsOutline',
        --     config = function ()
        --         vim.g.symbols_outline = {
        --             highlight_hovered_item = true,
        --             show_guides = true,
        --             auto_preview = true,
        --             position = 'right',
        --             relative_width = true,
        --             width = 25,
        --             auto_close = false,
        --             show_numbers = false,
        --             show_relative_numbers = false,
        --             show_symbol_details = true,
        --             preview_bg_highlight = 'Pmenu',
        --             keymaps = { -- These keymaps can be a string or a table for multiple keys
        --                 close = {"<Esc>", "q"},
        --                 goto_location = "<Cr>",
        --                 focus_location = "o",
        --                 hover_symbol = "<C-space>",
        --                 toggle_preview = "K",
        --                 rename_symbol = "r",
        --                 code_actions = "a",
        --             },
        --             lsp_blacklist = {},
        --             symbol_blacklist = {},
        --             symbols = {
        --                 File = {icon = "", hl = "TSURI"},
        --                 Module = {icon = "", hl = "TSNamespace"},
        --                 Namespace = {icon = "", hl = "TSNamespace"},
        --                 Package = {icon = "", hl = "TSNamespace"},
        --                 Class = {icon = "𝓒", hl = "TSType"},
        --                 Method = {icon = "ƒ", hl = "TSMethod"},
        --                 Property = {icon = "", hl = "TSMethod"},
        --                 Field = {icon = "", hl = "TSField"},
        --                 Constructor = {icon = "", hl = "TSConstructor"},
        --                 Enum = {icon = "ℰ", hl = "TSType"},
        --                 Interface = {icon = "ﰮ", hl = "TSType"},
        --                 Function = {icon = "", hl = "TSFunction"},
        --                 Variable = {icon = "", hl = "TSConstant"},
        --                 Constant = {icon = "", hl = "TSConstant"},
        --                 String = {icon = "𝓐", hl = "TSString"},
        --                 Number = {icon = "#", hl = "TSNumber"},
        --                 Boolean = {icon = "⊨", hl = "TSBoolean"},
        --                 Array = {icon = "", hl = "TSConstant"},
        --                 Object = {icon = "⦿", hl = "TSType"},
        --                 Key = {icon = "🔐", hl = "TSType"},
        --                 Null = {icon = "NULL", hl = "TSType"},
        --                 EnumMember = {icon = "", hl = "TSField"},
        --                 Struct = {icon = "𝓢", hl = "TSType"},
        --                 Event = {icon = "🗲", hl = "TSType"},
        --                 Operator = {icon = "+", hl = "TSOperator"},
        --                 TypeParameter = {icon = "𝙏", hl = "TSParameter"}
        --             }
        --         }
        --     end
        -- }

        -- AERIAL --
        -- ~/.config/nvim/lua/LSP/aerial.lua
        use { 'stevearc/aerial.nvim',
            -- ft = 'markdown',
            after = 'lualine.nvim',
            module = 'aerial',
            config = [[ require "LSP.aerial" ]]
        }

        -- NVIM-CMP --
        -- ~/.config/nvim/lua/plugins/nvim-cmp.lua
        use { 'hrsh7th/nvim-cmp',
            module = 'cmp',
            event = 'CmdlineEnter',
            config = [[ require "plugins.nvim-cmp" ]]
        }

        -- BUFFER COMPLETION
        use { 'hrsh7th/cmp-buffer', event = { 'InsertEnter', 'CmdlineEnter' } }

        -- INSERT ONLY COMPLETION
        use { 'hrsh7th/cmp-path', event = 'InsertEnter' }
        use { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'cmp-path' }
        use { 'hrsh7th/cmp-calc', after = 'cmp-nvim-lsp-signature-help' }
        -- use { "lukas-reineke/cmp-rg", after = 'cmp-calc' }

        -- CMDLINE ONLY COMPLETION
        use { "dmitmel/cmp-cmdline-history", event = 'CmdlineEnter' }
        use { 'hrsh7th/cmp-cmdline', after = 'cmp-cmdline-history' }
        use { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'cmp-cmdline-history' }

        -- NIVIM-LUA COMPLETION
        use { 'hrsh7th/cmp-nvim-lua', ft = 'lua' }

        -- DAP COMPLETION
        -- use { "rcarriga/cmp-dap", ft = { 'dap-repl', 'dapui_watches' } }

        -- LUASNIP --
        -- ~/.config/nvim/lua/plugins/luasnip.lua
        use { 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' }
        use { 'rafamadriz/friendly-snippets', after = 'cmp_luasnip' }
        use { 'L3MON4D3/LuaSnip',
            after = 'friendly-snippets',
            config = [[ require "plugins.luasnip" ]]
        }

        -- use { 'ms-jpq/coq_nvim',
        --     branch = 'coq',
        --     cmd = 'COQnow',
        --     run = 'COQdeps',
        --     config = function()
        --         require 'plugins.coq_nvim'
        --     end
        -- }

        -- use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

        -- use { 'ms-jpq/coq.thirdparty',
        --     branch = '3p',
        --     config = [[
        --         require('coq_3p') {
        --             { src = "nvimlua", short_name = "nLUA", conf_only = true},
        --             { src = "bc", short_name = "MATH", precision = 6 },
        --         }
        --     ]]
        -- }

        -- use { 'petertriho/nvim-scrollbar',
        --     config = [[
        --         require('scrollbar').setup {}
        --     ]]
        -- }

        -- use { 'kevinhwang91/nvim-hlslens',
        --     keys = { '/', '*', '#', '?' },
        --     config = [[
        --         require('hlslens').setup {
        --             -- calm_down = true,
        --             nearest_only = true,
        --         }
        --
        --         local opts = { noremap = true, silent = true }
        --         vim.keymap.set('n', '*', "*<CMD>lua require('hlslens').start()<CR>", opts)
        --         vim.keymap.set('n', '#', "#<CMD>lua require('hlslens').start()<CR>", opts)
        --         vim.keymap.set('n', 'g*', "g*<CMD>lua require('hlslens').start()<CR>", opts)
        --         vim.keymap.set('n', 'g#', "g#<CMD>lua require('hlslens').start()<CR>", opts)
        --
        --         vim.keymap.set('n', 'n', "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>", opts)
        --         vim.keymap.set('n', 'N', "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>", opts)
        --     ]]
        -- }

        -- TRANSLATOR --
        -- ~/.config/nvim/lua/UNEXPECTED/configs/vim-translator
        use { 'voldikss/vim-translator',
            keys = ';t',
            config = [[
                vim.g.translator_default_engines = { 'google' }
                vim.keymap.set('n', ';t', '<PLUG>TranslateW', { noremap = true, silent = true })
                vim.keymap.set('v', ';t', '<PLUG>TranslateWV', { noremap = true, silent = true })
            ]]
        }

        -- use { 'uga-rosa/translate.nvim',
        --     cmd = 'Translate',
        --     config = [[
        --       vim.g.deepl_api_auth_key = '311a6cc3-bc4b-a12d-a59b-ed37c5216eeb:fx'
        --         require "translate".setup {
        --             default = {
        --                 command = "deepl_free",
        --             },
        --             preset = {
        --                 output = {
        --                     split = {
        --                         append = true,
        --                     },
        --                 },
        --             },
        --         }
        --     ]]
        -- }

        -- SNIPRUN --
        -- ~/.config/nvim/lua/plugins/sniprun.lua
        -- use { 'michaelb/sniprun',
        --     run = 'bash ./install.sh',
        --     cmd = 'SnipRun',
        --     config = [[ require 'plugins.sniprun' ]]
        -- }


        -- use { 'ethanholz/nvim-lastplace', config = [[ require "nvim-lastplace".setup {} ]] }

        -- use { 'xiyaowong/nvim-transparent',
        --     cmd = 'TransparentToggle',
        --     config = [[
        --         require("transparent").setup {
        --             enable = true, -- boolean: enable transparent
        --             extra_groups = { -- table/string: additional groups that should be cleared
        --                 -- In particular, when you set it to 'all', that means all available groups
        --                 -- example of akinsho/nvim-bufferline.lua
        --                 "BufferLineTabClose",
        --                 "BufferlineBufferSelected",
        --                 "BufferLineFill",
        --                 "BufferLineBackground",
        --                 "BufferLineSeparator",
        --                 "BufferLineIndicatorSelected",
        --             },
        --             exclude = {}, -- table: groups you don't want to clear
        --         }
        --     ]]
        -- }

        -- 分屏变暗 --
        -- use { 'sunjon/shade.nvim',
        --     event = { 'BufAdd', 'BufCreate', 'BufNewFile', 'TabEnter' },
        --     config = [[
        --         require('shade').setup {
        --             overlay_opacity = 60,
        --             opacity_step = 1,
        --             keys = {
        --                 brightness_up    = '<C-Up>',
        --                 brightness_down  = '<C-Down>',
        --                 toggle           = '<F8>',
        --             }
        --         }
        --     ]]
        -- }

        -- TREESITTER
        -- ~/.config/nvim/lua/plugins/treesitter.lua
        use { 'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            ft = { 'c', 'lua', 'php', 'markdown', 'python', 'html', 'vim', 'http', 'json' },
            config = [[ require "plugins.treesitter" ]]
        }
        use { 'nvim-treesitter/nvim-treesitter-context', module = "treesitter-context", }
        use { 'nvim-treesitter/nvim-treesitter-textobjects', after = "nvim-treesitter"  }
        use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }

        use { 'windwp/nvim-ts-autotag', event = 'InsertEnter' }

        -- 聚焦当前 函数/方法
        -- use { 'folke/twilight.nvim',
        -- cmd = 'Twilight',
        --     config = [[
        --         require('twilight').setup {
        --             dimming = {
        --                 alpha = 0.25, -- amount of dimming
        --                 -- we try to get the foreground from the highlight groups or fallback color
        --                 color = { "Normal", "#ffffff" },
        --                 inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        --             },
        --             context = 10, -- amount of lines we will try to show around the current line
        --             treesitter = true, -- use treesitter when available for the filetype
        --             -- treesitter is used to automatically expand the visible text,
        --             -- but you can further control the types of nodes that should always be fully expanded
        --             expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        --                 "function",
        --                 "method",
        --                 "table",
        --                 "if_statement",
        --             },
        --             exclude = {}, -- exclude these filetypes
        --         }
        --     ]]
        -- }

        -- NVIM-DAP --
        -- ~/.config/nvim/lua/DAP/dap-config.lua
            use { 'mfussenegger/nvim-dap',
            module = 'dap',
            config = [[ require "DAP.dap-config" ]]
        }

        -- NVIM-DAP-UI --
            -- ~/.config/nvim/lua/DAP/dap-ui.lua
        use { 'rcarriga/nvim-dap-ui',
            keys = { ';;', '<C-d>' },
            config = [[ require "DAP.dap-ui" ]]
        }

        use { 'theHamsta/nvim-dap-virtual-text',
            after = 'nvim-dap-ui',
            config = [[
                require "nvim-dap-virtual-text".setup {
                    enabled = true,                        -- enable this plugin (the default)
                    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                    show_stop_reason = true,               -- show stop reason when stopped for exceptions
                    commented = false,                     -- prefix virtual text with comment string
                    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
                    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
                    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
                    -- experimental features:
                    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
                    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
                    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
                }
            ]]
        }

        -- use {'sakhnik/nvim-gdb',
        --     ft = { 'c', 'cpp' },
        --     run = './install.sh',
        --     config = [[
        --
        --     ]]
        -- }

        -- DECREPT BASE64
        use { "taybart/b64.nvim",
            -- key = { '<A-b>', '<A-B>' },
            module = 'b64',
        }

        use { "NTBBloodbath/rest.nvim",
            module = "rest-nvim",
            requires = "nvim-lua/plenary.nvim",
            config = [[
                require "rest-nvim".setup {
                    -- Open request results in a horizontal split
                    result_split_horizontal = false,
                    -- Keep the http file buffer above|left when split horizontal|vertical
                    result_split_in_place = false,
                    -- Skip SSL verification, useful for unknown certificates
                    skip_ssl_verification = false,
                    -- Highlight request on run
                    highlight = {
                        enabled = true,
                        timeout = 150,
                    },
                    result = {
                        -- toggle showing URL, HTTP info, headers at top the of result window
                        show_url = true,
                        show_http_info = true,
                        show_headers = true,
                    },
                    -- Jump to request line on run
                    jump_to_request = false,
                    env_file = '.env',
                    custom_dynamic_variables = {},
                    yank_dry_run = true,
                }
            ]]
        }

    end
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function ()
        vim.cmd "source <afile> | PackerSync"
    end
})

