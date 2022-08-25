
require"gitsigns".setup {
    signs = {
        -- add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        -- change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        -- delete       = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },

        add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = { hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = { hl = 'GitSignsDelete', text = '▎', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsTopDelete'   , text = '▎', numhl='GitSignsTopDeleteNr'   , linehl='GitSignsTopDeleteLn' },
        changedelete = { hl = 'GitSignsChangeDelete', text = '▎', numhl='GitSignsChangeDeleteNr', linehl='GitSignsChangeDeleteLn' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    -- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', ';gb', function()
            package.loaded.gitsigns.blame_line { full = true }
        end)
        map('n', ';gd', package.loaded.gitsigns.diffthis)
        map({'n', 'v'}, ';hs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, ';hr', ':Gitsigns reset_hunk<CR>')
        map('n', ';hS', package.loaded.gitsigns.stage_buffer)
        map('n', ';hu', package.loaded.gitsigns.undo_stage_hunk)
        map('n', ';hR', package.loaded.gitsigns.reset_buffer)
        map('n', ';hp', package.loaded.gitsigns.preview_hunk)
        -- map('n', ';tb', package.loaded.gitsigns.toggle_current_line_blame)
        map('n', ';hD', function()
            package.loaded.gitsigns.diffthis('~')
        end)
        -- map('n', ';td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
        }

vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "NONE", fg = "#9EB73D", italic = true })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "NONE", fg = "#008fbf", italic = true })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "NONE", fg = "#C53B82", italic = true })
vim.api.nvim_set_hl(0, "GitSignsChangeDelete", { bg = "NONE", fg = "#DEA600", italic = true })
vim.api.nvim_set_hl(0, "GitSignsTopDelete", { bg = "NONE", fg = "#C53B82", italic = true })
vim.api.nvim_set_hl(0, "gitcommitSummary", { bg = "NONE", fg = "#D0EE7A", bold = true, italic = true })

