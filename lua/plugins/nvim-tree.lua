
-- local status, nvim_tree = pcall(require, "nvim-tree")
-- 
-- if not status then
--     vim.notify(' [ NVIM-TREE ] NOT FOUND ')
--     return
-- end

-- <C-]>           : cd                   <2-RightMouse>    : cd                      F                 : clear_live_filter
-- q               : close                <BS>              : close_node              W                 : collapse_all
-- c               : copy                 gy                : copy_absolute_path      y                 : copy_name
-- Y               : copy_path            a                 : create                  x                 : cut
-- -               : dir_up               <CR>              : edit                    o                 : edit
-- <2-LeftMouse>   : edit                 <C-e>             : edit_in_place           O                 : edit_no_picker
-- E               : expand_all           K                 : first_sibling           <C-r>             : full_rename
-- J               : last_sibling         f                 : live_filter             ]c                : next_git_item
-- >               : next_sibling         P                 : parent_node             p                 : paste
-- [c              : prev_git_item        <                 : prev_sibling            <Tab>             : preview
-- R               : refresh              d                 : remove                  r                 : rename
-- .               : run_file_command     S                 : search_node             <C-x>             : split
-- s               : system_open          <C-t>             : tabnew                  U                 : toggle_custom
-- H               : toggle_dotfiles      <C-k>             : toggle_file_info        I                 : toggle_git_ignored
-- g?              : toggle_help          D                 : trash                   <C-v>             : vsplit

require "nvim-tree".setup {
    sort_by = "name",
    disable_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
        'dashboard',
    },
    view = {
        width = 40,
        hide_root_folder = true,
        side = "left",
        number = false,
        signcolumn = "no",
        mappings = {
            custom_only = false,
            list = {
                { key = 'l', action = "preview" },
                { key = 'h', action = "close_node" },
                { key = 'v', action = "vsplit" },
                { key = 's', action = "split" },
                { key = '.', action = "toggle_dotfiles" },
                { key = '!', action = "run_file_command" },
                { key = '?', action = "toggle_help" },
                { key = '<Tab>', action = "" },
            },
        },
    },
    renderer = {
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
        },
        expand_all = {
            max_folder_discovery = 20,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
        },
    },
    trash = {
        cmd = "gio trash",
        require_confirm = false,
    },
}

-- require "nvim-tree.view".View.winopts.sidescrolloff = 3

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function ()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})

