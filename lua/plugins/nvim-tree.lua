
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

-- require "nvim-tree.view".View.winopts.sidescrolloff = 3

require "nvim-tree".setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    ignore_buf_on_tab_change = {},
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 35,
        height = 30,
        hide_root_folder = true,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
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
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
            padding = " ",
            symlink_arrow = "  ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
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
                git = {
                    unstaged  = "- ",
                    staged    = " ",
                    unmerged  = " ",
                    renamed   = " ",
                    untracked = "廓",
                    deleted   = " ",
                    ignored   = " ",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_root = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        debounce_delay = 50,
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
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
}

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function ()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})

