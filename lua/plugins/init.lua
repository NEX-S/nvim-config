
local status, packer = pcall(require, 'packer')

if not status then
    print('PACKER NOT FOUND.')
    return nil
end

packer.init {
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    prompt_border = 'single',
    compile_path = '/home/nex/.cache/nvim/packer_compiled.lua',
    keybindings = {
        quit = '<ESC>',
        toggle_info = 'l',
    },
    display = {
        working_sym = ' ',
        error_sym = ' ',
        done_sym = ' ',
        removed_sym = ' -',
        moved_sym = '',
        open_fn = function ()
            return require "packer.util".float { border = "single" }
        end,
    }
}

packer.startup {
    function (use)
        -- COLORS --
        -- use 'folke/tokyonight.nvim'
        -- use 'rafamadriz/neon'
        -- use 'shaunsingh/nord.nvim'

        -- PLUGINS --
        use { 'wbthomason/packer.nvim', module = "packer" }
        use 'lewis6991/impatient.nvim'
        -- use 'dstein64/vim-startuptime'
        -- use 'yianwillis/vimcdoc'

        use { 'nvim-lua/plenary.nvim', module = 'plenary' }
        use { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons' }

        use { 'RRethy/nvim-align', cmd = 'Align' }
        -- use { 'Vonr/align.nvim', module = 'align' }

        -- use { 'https://github.com/lvimuser/lsp-inlayhints.nvim',
        --     branch = 'anticonceal',
        --     after = 'lsp-config',
        --     config = [[
        --
        --     ]]
        -- }


        use { 'CRAG666/code_runner.nvim',
            requires = 'nvim-lua/plenary.nvim',
            cmd = { 'RunFile', 'RunCode' },
            config = [[
                require "code_runner".setup {
                    mode = "float",
                    startinsert = true,
                    float = {
                        close_key = '<ESC>',
                        border = "single",
                        blend = 20,
                    },
                    filetype = {
                        python = "time python3 -u",
                        c = "cd $dir && clang $fileName -std=gnu2x -I ./ -g -o ./bin/$fileNameWithoutExt -Wall && printf '\\n' && time ./bin/$fileNameWithoutExt",
                        php = "time php $fileName",
                        sh = "time sh $fileName",
                        html = function ()
                            local file = vim.fn.expand("%:t")
                            vim.fn.system("google-chrome-stable "..file)
                        end,
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
            -- event = { 'BufAdd', 'BufCreate', 'BufNewFile', 'TabEnter' },
            config = [[ require "plugins.bufferline" ]]
        }

        -- GITSIGNS --
        -- ~/.config/nvim/lua/plugins/gitsigns.lua
        use { 'lewis6991/gitsigns.nvim',
            event = { 'CursorMoved', 'CursorHold', 'CursorHoldI' },
            config = [[ require 'plugins.gitsigns' ]]
        }

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
        --
        use { 'glepnir/coman.nvim',
            command = "ComComment",
            config = [[
            ]]
        }

        -- COMMENT --
        -- ~/.config/nvim/lua/plugins/comment.lua
        -- use { 'numToStr/Comment.nvim',
        --     -- keys = { ';c', ';bc' },
        --     config = [[
        --         require "Comment".setup {
        --             -- Add a space b/w comment and the line
        --             -- @type boolean|fun():boolean
        --             padding = true,
        --
        --             -- Whether the cursor should stay at its position
        --             -- NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
        --             -- @type boolean
        --             sticky = true,
        --
        --             -- Lines to be ignored while comment/uncomment.
        --             -- Could be a regex string or a function that returns a regex string.
        --             -- Example: Use '^$' to ignore empty lines
        --             -- @type string|fun():string
        --             ignore = nil,
        --
        --             -- LHS of toggle mappings in NORMAL + VISUAL mode
        --             -- @type table
        --             -- toggler = {
        --             --     Line-comment toggle keymap
        --                 -- line = ';c',
        --                 -- Block-comment toggle keymap
        --                 -- block = ';b',
        --             -- },
        --
        --             -- LHS of operator-pending mappings in NORMAL + VISUAL mode
        --             -- @type table
        --             opleader = {
        --                 -- Line-comment keymap
        --                line = 'gc',
        --                 -- Block-comment keymap
        --                 block = 'gb',
        --             },
        --
        --             -- LHS of extra mappings
        --             -- @type table
        --             extra = {
        --                 -- Add comment on the line above
        --                 above = 'gcO',
        --                 -- Add comment on the line below
        --                 below = 'gco',
        --                 -- Add comment at the end of line
        --                 eol = 'gcA',
        --             },
        --
        --             -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
        --             -- NOTE: If `mappings = false` then the plugin won't create any mappings
        --             -- @type boolean|table
        --             mappings = {
        --                 -- Operator-pending mapping
        --                 -- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        --                 -- NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        --                 basic = true,
        --                 -- Extra mapping
        --                 -- Includes `gco`, `gcO`, `gcA`
        --                 extra = true,
        --                 -- Extended mapping
        --                 -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        --                 extended = false,
        --             },
        --
        --             -- Pre-hook, called before commenting the line
        --             -- @type fun(ctx: CommentCtx):string
        --             pre_hook = nil,
        --
        --             -- Post-hook, called after commenting is done
        --             -- @type fun(ctx: CommentCtx)
        --             post_hook = nil,
        --         }
        --         vim.keymap.set('v', ';c', 'gcgv', { remap = true, silent = true })
        --     ]]
        -- }

        -- DASHBOARD --
        -- ~/.config/nvim/lua/plugins/dashboard.lua
        use { 'NEX-S/dashboard-nvim', config = [[ require "plugins.dashboard" ]] }

        -- INDENT-BLANKLINE --
        use { 'lukas-reineke/indent-blankline.nvim',
            event = { 'CursorHold','CursorHoldI', 'CursorMoved' },
            config = [[
                require "indent_blankline".setup {
                    char = "¦",
                    show_first_indent_level = true,
                    show_end_of_line = true,
                    space_char_blankline = "-",
                    show_current_context = true,
                    show_current_context_start = true,
                }
                vim.g.indent_blankline_context_char = "¦";
                vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { bg = "NONE", fg = "#6C5B9E" })
                -- vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { bg = "NONE", fg = "#9D7CD8", bold = true })
                vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { bg = "NONE", fg = "NONE", bold = true })
            ]]
        }

        -- NVIM-COLORIZER --
        -- ~/.config/nvim/lua/UNEXPECTED/configs/nvim-colorizer.lua
        use { 'norcalli/nvim-colorizer.lua',
            ft = { 'vim', 'lua', 'html', 'css', 'yaml', 'markdown', 'ini' },
            config = [[ require "colorizer".setup({ '*'; }, { mode = 'foreground' }) ]]
        }

        -- use { "max397574/colortils.nvim",
        --     cmd = "Colortils",
        --     config = [[
        --         require "colortils".setup {
        --             -- Register in which color codes will be copied
        --             register = "+",
        --             -- Preview for colors, if it contains `%s` this will be replaced with a hex color code of the color
        --             color_preview =  "█ %s",
        --             -- The default in which colors should be saved
        --             -- This can be hex, hsl or rgb
        --             default_format = "hex",
        --             -- Border for the float
        --             border = "rounded",
        --             -- Some mappings which are used inside the tools
        --             mappings = {
        --                 -- increment values
        --                 increment = "l",
        --                 -- decrement values
        --                 decrement = "h",
        --                 -- increment values with bigger steps
        --                 increment_big = "L",
        --                 -- decrement values with bigger steps
        --                 decrement_big = "H",
        --                 -- set values to the minimum
        --                 min_value = "0",
        --                 -- set values to the maximum
        --                 max_value = "$",
        --                 -- save the current color in the register specified above with the format specified above
        --                 set_register_default_format = "<cr>",
        --                 -- save the current color in the register specified above with a format you can choose
        --                 set_register_cjoose_format = "g<cr>",
        --                 -- replace the color under the cursor with the current color in the format specified above
        --                 replace_default_format = "<m-cr>",
        --                 -- replace the color under the cursor with the current color in a format you can choose
        --                 replace_choose_format = "g<m-cr>",
        --                 -- export the current color to a different tool
        --                 export = "E",
        --                 -- set the value to a certain number (done by just entering numbers)
        --                 set_value = "c",
        --                 -- toggle transparency
        --                 transparency = "T",
        --                 -- choose the background (for transparent colors)
        --                 choose_background = "B",
        --             }
        --         }
        --     ]]
        -- }

        -- HTML AUTO TAGS
        use { 'windwp/nvim-ts-autotag', ft = "html" }

        -- AUTO-PAIRS
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


        -- LSP-INSTALLER --
        -- ~/.config/nvim/lua/LSP/lsp-config.lua
        -- use { "neovim/nvim-lspconfig", module = "lspconfig" }
        -- use { "williamboman/nvim-lsp-installer",
        --     event = { "CursorHold", "CursorHoldI", "CursorMoved", "InsertEnter" },
        --     config = [[
        --         require "nvim-lsp-installer".setup {
        --             automatic_installation = true,
        --             ensure_installed = { 'sumneko_lua', 'intelephense', 'pyright', 'clangd' },
        --             ui = {
        --                 icons = {
        --                     server_installed = ' ',
        --                     server_pending = ' ',
        --                     server_uninstalled = ' ',
        --                 },
        --             },
        --         }
        --         require "LSP.lsp-setup"
        --     ]]
        -- }

        -- MASON --
        -- ~/.config/nvim/lua/LSP/lsp-config.lua
        -- ~/.config/nvim/lua/LSP/lsp-setup.lua
        use { "neovim/nvim-lspconfig", module = "lspconfig" }
        use { "williamboman/mason.nvim",
            -- event = { "CursorHold", "CursorHoldI", "CursorMoved", "InsertEnter" },
            config = [[
                require "mason".setup {
                    automatic_installation = true,
                    ui = {
                        border = "single",
                        icons = {
                            package_installed = ' ',
                            package_pending = ' ',
                            package_uninstalled = ' ',
                        },
                        check_outdated_packages_on_open = true,
                    },
                    keymaps = {
                        toggle_package_expand = "<TAB>",
                        install_package = "i",
                        update_package = "u",
                        update_all_packages = "U",
                        uninstall_package = "x",
                    },
                    -- install_root_dir = "~/.local/share/nvim/data/mason"
                }
            ]]
        }
        use { "williamboman/mason-lspconfig.nvim",
            after = "mason.nvim",
            config = [[
                require "mason-lspconfig".setup {
                    automatic_installation = true,
                    ensure_installed = { 'sumneko_lua', 'intelephense', 'pyright', 'clangd' },
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
        -- use { "glepnir/lspsaga.nvim",
        use { "NEX-S/lspsaga.nvim",
            branch = 'nex',
            after = 'nvim-lspconfig',
            -- cmd = "Lspsaga",
            ft = "markdown",
            -- keys = { "gd", "gi", "<C-r>", ";x", ";o" },
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

        use { "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            ft = { "markdown", "html" },
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

        -- LUALINE --
        -- ~/.config/nvim/lua/plugins/lualine.lua
        use { "nvim-lualine/lualine.nvim",
            after = "lspsaga.nvim",
            config = [[ require "plugins.lualine" ]]
        }

        -- AERIAL --
        -- ~/.config/nvim/lua/LSP/aerial.lua
        use { 'stevearc/aerial.nvim',
            ft = "markdown",
            cmd = "AerialToggle",
            module = "aerial",
            config = [[ require "LSP.aerial" ]]
        }

        -- NVIM-CMP --
        -- ~/.config/nvim/lua/plugins/nvim-cmp.lua
        use { 'hrsh7th/nvim-cmp',
            module = "cmp",
            event = { 'CmdlineEnter', 'InsertEnter' },
            config = [[ require "plugins.nvim-cmp" ]]
        }

        -- BUFFER COMPLETION
        use { 'hrsh7th/cmp-buffer', event = { 'InsertEnter', 'CmdlineEnter' } }
        -- use { 'ray-x/cmp-treesitter', after = 'cmp-buffer' }

        -- INSERT ONLY COMPLETION
        use { 'hrsh7th/cmp-path', event = 'InsertEnter' }
        use { 'saadparwaiz1/cmp_luasnip', after = 'cmp-path' }
        use { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'cmp_luasnip' }
        use { 'hrsh7th/cmp-calc', after = 'cmp-nvim-lsp-signature-help' }

        -- LSP COMPLETION
        use { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" }

        use { 'tzachar/cmp-tabnine',
            after = "cmp-path",
            run = "cd ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine && ./install.sh",
            config = function ()
                -- :CmpTabnineHub
                require "cmp_tabnine.config".setup {
                    max_lines = 300,
                    max_num_results = 10,
                    sort = true,
                    run_on_every_keystroke = true,
                    snippet_placeholder = '..',
                    ignored_file_types = {
                        -- html = true
                    },
                    show_prediction_strength = true
                }
            end
        }

        -- COPILOT
        -- ~/.config/nvim/lua/plugins/copilot.lua
        -- use { 'github/copilot.vim',
        --     after = "nvim-lspconfig",
        --     config = [[ require "plugins.copilot" ]]
        -- }

        -- use { 'hrsh7th/cmp-copilot', after = 'cmp-path' }

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
        use { 'L3MON4D3/LuaSnip',
            after = 'cmp_luasnip',
            config = [[ require "plugins.luasnip" ]]
        }

        -- use { 'rafamadriz/friendly-snippets', after = 'cmp_luasnip' }

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

        -- SCROLLBAR
        -- ~/.config/nvim/lua/plugins/scrollbar.lua
        use { 'petertriho/nvim-scrollbar',
            event = { "CursorMoved", "CursorHold", "InsertEnter" },
            config = [[
                require "plugins.scrollbar"
            ]]
        }

        use { 'kevinhwang91/nvim-hlslens',
            module = "hlslens",
            -- event = "CmdlineEnter",
            -- keys = { '*', '#', '?', },
            config = [[
                require "hlslens".setup {
                    calm_down = true,
                    auto_enable = true,
                    enable_incsearch = false,
                    nearest_only = true,
                    nearest_float_when = 'auto',
                    float_shadow_blend = 20,
                    virt_priority = 100,
                }
            ]]
        }

        -- TRANSLATOR --
        -- ~/.config/nvim/lua/UNEXPECTED/configs/vim-translator
        use { 'voldikss/vim-translator',
            keys = '<C-t>',
            config = [[
                vim.g.translator_default_engines = { 'google' }
                vim.keymap.set('n', '<C-t>', '<PLUG>TranslateW', { noremap = true, silent = true })
                vim.keymap.set('v', '<C-t>', '<PLUG>TranslateWV', { noremap = true, silent = true })
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


        use { 'ethanholz/nvim-lastplace', config = [[ require "nvim-lastplace".setup {} ]] }

        -- 分屏变暗 --
        -- use { 'NEX-S/shade.nvim',
        --     -- event = { 'BufAdd', 'BufCreate', 'BufNewFile', 'TabEnter' },
        --     config = [[
        --         require "shade".setup {
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
        use { 'nvim-treesitter/nvim-treesitter-textobjects', after = "nvim-treesitter", }
        use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }
        -- use { 'm-demare/hlargs.nvim',
        --     after = "nvim-treesitter",
        --     config = function ()
        --         require "hlargs".setup {
        --             color = '#9D7CD8',
        --             highlight = {},
        --             excluded_filetypes = {},
        --             paint_arg_declarations = true,
        --             paint_arg_usages = true,
        --             hl_priority = 10000,
        --             excluded_argnames = {
        --                 declarations = {},
        --                 usages = {
        --                     python = { 'self', 'cls' },
        --                     lua = { 'self' }
        --                 }
        --             },
        --             performance = {
        --                 parse_delay = 1,
        --                 slow_parse_delay = 50,
        --                 max_iterations = 400,
        --                 max_concurrent_partial_parses = 30,
        --                 debounce = {
        --                     partial_parse = 3,
        --                     partial_insert_mode = 100,
        --                     total_parse = 700,
        --                     slow_parse = 5000
        --                 }
        --             }
        --         }
        --     end
        -- }

        -- use { 'm4xshen/autoclose.nvim', event = "InsertEnter", }

        -- 聚焦当前 函数/方法
        use { 'folke/twilight.nvim',
            cmd = 'Twilight',
            config = [[
                require('twilight').setup {
                    dimming = {
                        alpha = 0.25, -- amount of dimming
                        -- we try to get the foreground from the highlight groups or fallback color
                        color = { "Normal", "#ffffff" },
                        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                    },
                    context = 10, -- amount of lines we will try to show around the current line
                    treesitter = true, -- use treesitter when available for the filetype
                    -- treesitter is used to automatically expand the visible text,
                    -- but you can further control the types of nodes that should always be fully expanded
                    expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
                        "function",
                        "method",
                        "table",
                        "if_statement",
                    },
                    exclude = {}, -- exclude these filetypes
                }
            ]]
        }

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

        -- use { 'jbyuki/one-small-step-for-vimkind', module = "osv" }

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
    pattern = { "init.lua" },
    callback = function ()
        vim.cmd "source <afile> | PackerCompile"
    end
})

