
-- local present, bufferline = pcall(require, "bufferline")
-- 
-- if not present then
--     return
-- end

require "bufferline".setup {
    options = {
        mode = "buffers",
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        buffer_close_icon= '',
        modified_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        tab_size = 19,
        separator_style = "slant",
        diagnostics = false,
        show_buffer_icons = true,
        color_icons = true,
        show_tab_indicators = true,
        always_show_bufferline = false,
        offsets = {
            { filetype = "NvimTree", text = "  [ FILE EXPLORER ] ", text_align = "center" }
        },
        -- sort_by = "directory",
        -- name_formatter = function (buf)
        --     return vim.fn.expand('%:t')
        -- end,
    }
}

