
local actions = require 'telescope.actions'

require "telescope".setup {
    defaults = {
        prompt_prefix = '  ',
        -- prompt_prefix = ' ',
        selection_caret = '  ',
        mappings = {
            i = {
                ["<A-j>"] = actions.move_selection_next,
                ["<A-k>"] = actions.move_selection_previous,

                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-j>"] = actions.preview_scrolling_up,
                ["<C-k>"] = actions.preview_scrolling_down,
            },

            n = {
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ['l'] = actions.select_tab,

                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["K"] = actions.preview_scrolling_up,
                ["J"] = actions.preview_scrolling_down,
            },
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    }
}

require('telescope').load_extension('fzf')
