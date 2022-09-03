
local actions = require 'telescope.actions'

require "telescope".setup {
    defaults = {
        prompt_prefix = '  ',
        selection_caret = '  ',
        mappings = {
            i = {
                ["<A-j>"] = actions.move_selection_next,
                ["<A-k>"] = actions.move_selection_previous,
                ['<TAB>'] = actions.select_tab,

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

require "telescope".load_extension('fzf')

vim.api.nvim_set_hl(0, "TelescopePromptTitle",    { bg = "NONE", fg = "#614F97", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { bg = "NONE", fg = "#614F97", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal",  { bg = "NONE", fg = "#614F97", bold = false, italic = false })

vim.api.nvim_set_hl(0, "TelescopePromptPrefix",   { bg = "NONE", fg = "#C53B82", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle",   { bg = "NONE", fg = "#C53B82", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle",   { bg = "NONE", fg = "#9EB73D", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewLine",    { bg = "NONE", fg = "#C53B82", bold = true,  italic = false  })
vim.api.nvim_set_hl(0, "TelescopeSelection",      { bg = "NONE", fg = "#C53B82", bold = true,  italic = false })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "NONE", fg = "#C53B82", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeMatching",       { bg = "NONE", fg = "#C53B82", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeBorder",         { bg = "NONE", fg = "#323232", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { bg = "NONE", fg = "#323232", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { bg = "NONE", fg = "#323232", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { bg = "NONE", fg = "#323232", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePromptCounter",  { bg = "NONE", fg = "#424242", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal",  { bg = "NONE", fg = "#595959", bold = false, italic = false })

vim.api.nvim_set_hl(0, "TelescopeNormal",        { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeTitle",         { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeMultiIcon",     { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewDate",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewLink",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewPipe",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewRead",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewSize",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewUser",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewBlock",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewGroup",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewMatch",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewWrite",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsClass",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsField",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewHyphen",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewSocket",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewSticky",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsLineNr",   { bg = "NONE", fg = "#ffffff", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsMethod",   { bg = "NONE", fg = "#ffffff", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsNumber",   { bg = "NONE", fg = "#ffffff", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsStruct",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewCharDev",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewExecute",  { bg = "NONE", fg = "#ffffff", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewMessage",  { bg = "NONE", fg = "#ffffff", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsComment",  { bg = "NONE", fg = "#ffffff", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsDiffAdd",  { bg = "NONE", fg = "#ffffff", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsConstant",    { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsFileIcon",    { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsFunction",    { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsOperator",    { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsVariable",    { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewDirectory",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsDiffChange",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsDiffDelete",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsIdentifier",  { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsDiffUntracked",     { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopeResultsSpecialComment",    { bg = "NONE", fg = "#000000", bold = false, italic = false })
vim.api.nvim_set_hl(0, "TelescopePreviewMessageFillchar",   { bg = "NONE", fg = "#000000", bold = false, italic = false })
