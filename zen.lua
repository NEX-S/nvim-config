local api = vim.api
local keymap = vim.keymap.set

-- vim.fn.getpos(".") { 0, line_num, column_num, 0 }

vim.cmd "au!"

vim.opt.syntax = "on"
vim.opt.termguicolors = true
vim.opt.number        = true
vim.opt.smartcase     = true
vim.opt.ignorecase    = true
vim.opt.hlsearch      = true
vim.opt.incsearch     = true
vim.opt.cursorline    = true
vim.opt.showcmd       = true
vim.opt.lazyredraw    = true
vim.opt.undofile      = true
vim.opt.smartindent   = true
vim.opt.expandtab     = true
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.wrap          = false
vim.opt.showmode      = false
vim.opt.swapfile      = false

vim.opt.tabstop       = 4
vim.opt.softtabstop   = 4
vim.opt.shiftwidth    = 4
vim.opt.cmdheight     = 1
vim.opt.laststatus    = 0
vim.opt.numberwidth   = 5
vim.opt.scrolloff     = 6
vim.opt.sidescrolloff = 10

vim.opt.winblend = 25
vim.opt.pumblend = 25
vim.opt.pumheight = 18

-- vim.opt.listchars:append "eol:⸥"
-- vim.opt.listchars:append "space:·"
-- vim.opt.listchars:append "trail:-"

local NS = { remap = false, silent = false }

keymap("n", ";q", "<CMD>exit!<CR>", NS)
keymap("n", ";w", "<CMD>write!<CR>", NS)

keymap("n", "J", "8j", NS)
keymap("n", "K", "8k", NS)
keymap("v", "J", "8j", NS)
keymap("v", "K", "8k", NS)
keymap("o", "J", "8j", NS)
keymap("o", "K", "8k", NS)

keymap("n", "H", "^", NS)
keymap("n", "L", "$", NS)
keymap("v", "H", "^", NS)
keymap("v", "L", "$", NS)
keymap("o", "H", "^", NS)
keymap("o", "L", "$", NS)

keymap("n", "m", "%", NS)
keymap("n", "m", "%", NS)
keymap("v", "m", "%", NS)
keymap("v", "m", "%", NS)
keymap("o", "m", "%", NS)
keymap("o", "m", "%", NS)

keymap("n", ">", ">>", NS)
keymap("n", "<", "<<", NS)

keymap("v", ">", ">gv", NS)
keymap("v", "<", "<gv", NS)

keymap("n", "+", "J", NS)
keymap("n", ";a", "ggvG$", NS)

keymap("t", "<ESC>", "<C-\\><C-n>", NS)
keymap('n', "<ESC>", "<CMD>set hls!<CR>", NS)

keymap("n", "<SPACE>", ";", NS)
keymap("v", "<SPACE>", ";", NS)
keymap("o", "<SPACE>", ";", NS)

keymap("n", "U", "<C-r>", NS)

keymap("n", ";s", "<CMD>split<CR>", NS)
keymap("n", ";v", "<CMD>vertical split<CR>", NS)

keymap("n", "d", '"dd', NS)
keymap("v", "d", '"dd', NS)
keymap("n", "y", '"+y', NS)
keymap("v", "y", '"+y', NS)
keymap("n", "p", '"+p', NS)
keymap("n", "P", '"+P', NS)
keymap("v", "p", '"+p', NS)
keymap("v", "P", '"+P', NS)

keymap("n", "dd", '"ddd', NS)
keymap("n", "yy", '"+yy', NS)

keymap("n", "dp", '"dp', NS)
keymap("n", "dP", '"dP', NS)

keymap("n", ";f", "/", NS)

keymap("n", "<C-i>", "<C-a>", NS)
keymap("n", "<C-d>", "<C-x>", NS)
keymap("n", "<C-i>", "g<C-a>", NS)
keymap("n", "<C-d>", "g<C-x>", NS)

keymap("n", "<TAB>", "<C-w>p", NS)
keymap("n", "<S-TAB>", "<C-w><C-w>", NS)

keymap("n", "<UP>", "<C-w>k", NS)
keymap("n", "<DOWN>", "<C-w>j", NS)
keymap("n", "<LEFT>", "<C-w>h", NS)
keymap("n", "<RIGHT>", "<C-w>l", NS)

keymap("n", "<A-j>", "<C-i>", NS)
keymap("n", "<A-k>", "<C-o>", NS)
keymap("n", "<A-h>", "<CMD>bp<CR>", NS)
keymap("n", "<A-l>", "<CMD>bn<CR>", NS)
keymap("n", "<F10>", "<CMD>bp<CR>", NS)
keymap("n", "<F11>", "<CMD>bn<CR>", NS)

-- AUTO PARI --
-- TODO: 用奇偶判断行内符号是否匹配 奇数为非匹配 偶数为匹配
api.nvim_create_autocmd( "InsertEnter", {
    pattern = "*",
    once = true,
    callback = function ()
        keymap('i', "(", "()<LEFT>", NS)
        keymap('i', "{", "{}<LEFT>", NS)
        keymap('i', "[", "[]<LEFT>", NS)

        local function get_cursor_right ()
            local cursor_colm = vim.fn.getpos(".")[3]
            local cursor_line = vim.api.nvim_get_current_line()
            return string.sub(cursor_line, cursor_colm, cursor_colm)
        end

        local function get_cursor_left ()
            local cursor_colm = vim.fn.getpos(".")[3]
            local cursor_line = vim.api.nvim_get_current_line()
            return string.sub(cursor_line, cursor_colm - 1, cursor_colm - 1)
        end

        keymap('i', ")", function ()
            return get_cursor_right() == ")" and "<RIGHT>" or ")"
        end, { expr = true })

        keymap('i', "}", function ()
            return get_cursor_right() == "}" and "<RIGHT>" or "}"
        end, { expr = true })

        keymap('i', "]", function ()
            return get_cursor_right() == "]" and "<RIGHT>" or "]"
        end, { expr = true })

        keymap('i', "'", function ()
            return get_cursor_right() == "'" and "<RIGHT>" or [[''<LEFT>]]
        end, { expr = true })

        keymap('i', '"', function ()
            return get_cursor_right() == '"' and "<RIGHT>" or [[""<LEFT>]]
        end, { expr = true })

        keymap('i', "`", function ()
            return get_cursor_right() == "`" and "<RIGHT>" or [[``<LEFT>]]
        end, { expr = true })
    end
})

-- C PLUGIN --
api.nvim_create_autocmd( "FileType", {
    pattern = "c",
    once = true,
    callback = function ()
        -- COMMENT --
        keymap('n', ";c", "I// <ESC>", NS)
        keymap('n', ";b", "a/*  */<LEFT><LEFT><LEFT>", NS)

        -- RUN CODE --
        keymap("n", ";r", function ()
            local file = vim.fn.expand("%")
            local fileNoExt = vim.fn.expand("%<")
            local compiledCmd = "vs term://clang -Wall " .. file .. " -o ./bin/" .. fileNoExt

            vim.cmd "w!"
            vim.cmd (compiledCmd .. " && bash -c 'echo;echo  && time ./bin/test'")
            vim.cmd "vert resize 40 || set nonu || nnoremap <buffer> <silent> <ESC> :q!<CR>"
        end, NS)
    end
})


-- COMMENT --
local function comment_check (num)
    local cursor_line_str = api.nvim_get_current_line()
    local ltrim_spaces_res = cursor_line_str:match("^%s*(.*)")
    return string.sub(ltrim_spaces_res, 0, num)
end

-- LUA --
api.nvim_create_autocmd( "FileType", {
    pattern = "lua",
    once = true,
    callback = function ()
        keymap('n', ";c", function ()
            return comment_check(3) == "-- " and "^3x$" or "I-- <ESC>$"
        end, { expr = true })
        keymap('n', ";b", "i--[[  ]]<LEFT><LEFT><LEFT>", NS)
        keymap('v', ";b", "A ]]<ESC>gvo<ESC>i--[[ <ESC>gvo6l", NS)
    end
})

-- C / CPP --
api.nvim_create_autocmd( "FileType", {
    pattern = "c",
    once = true,
    callback = function ()
        keymap('n', ";c", function ()
            return comment_check(3) == "// " and "^3x$" or "I// <ESC>$"
        end, { expr = true })

        keymap('n', ";b", "i/*  */<LEFT><LEFT><LEFT>", NS)
        keymap('v', ";b", "A */<ESC>gvo<ESC>i/* <ESC>gvo6l", NS)
    end
})

-- COMPLETION --
-- keymap('i', "<TAB>", function ()
--     return vim.fn.pumvisible() == 1 and "<TAB>" or "<C-n>"
-- end, { expr = true, remap = false })    

keymap('i', "<TAB>", "<C-n>", { expr = false, remap = false })
keymap('i', "<S-TAB>", "<C-p>", { expr = false, remap = false })


-- TRANSLATE --
keymap("n", ";t", function ()
    local word = vim.fn.expand("<cword>")
    vim.cmd("vs term://trans -hl zh -to zh -j -speak -indent 2 " .. word)
    vim.cmd("vert resize 40 || set nonu || nnoremap <buffer> <silent> <ESC> :q!<CR>")
end, NS)

-- AUTO SOURCE --
api.nvim_create_autocmd("BufWritePost", {
    pattern = "zen.lua",
    command = "source %",
})

-- FILE EXPLORER --
keymap("n", ";e", function ()
    vim.g.netrw_winsize = 15     -- Window size
    vim.g.netrw_banner = 0       -- Hide banner
    vim.g.netrw_browse_split = 4 -- Open in previous window
    vim.g.netrw_liststyle = 3    -- Tree-style view
    vim.cmd "Vexplore || syntax on || nmap <buffer> l <CR> || nnoremap <buffer> ;e <CMD>quit!<CR>"
    -- keymap('n', "l", "<CR>", { buffer = true, remap = true })
    -- keymap('n', ";e", "<CMD>quit!<CR>", { buffer = true, remap = false })
end, NS)

-- HIGHLIGHT --

keymap('n', "<F1>", "<CMD>hi Normal guibg = NONE guifg = #777777<CR>", NS)
keymap('n', "<F2>", "<CMD>hi Normal guibg = #232323 guifg = #777777<CR>", NS)


api.nvim_set_hl(0, "Normal",       { bg = "NONE", fg = "#777777" })
api.nvim_set_hl(0, "VertSplit",    { bg = "NONE", fg = "#333333" })
api.nvim_set_hl(0, "LineNr",       { bg = "NONE", fg = "#383838" })
api.nvim_set_hl(0, "Search",       { bg = "NONE", fg = "#AE91E8" })
api.nvim_set_hl(0, "IncSearch",    { bg = "NONE", fg = "#AE91E8" })
api.nvim_set_hl(0, "MatchParen",   { bg = "NONE", fg = "#C53B82" })
api.nvim_set_hl(0, "CursorLine",   { bg = "#232323", fg = "NONE" })

api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = "#505050", bold = true })
api.nvim_set_hl(0, "Visual",       { bg = "NONE", fg = "#9C8FDC", bold = true })

api.nvim_set_hl(0, "Pmenu",      { bg = "#282828", fg = "#757575" })
api.nvim_set_hl(0, "PmenuSel",   { bg = "#383838", fg = "#888888", bold = true })
api.nvim_set_hl(0, "PmenuSbar",  { bg = "#383838", fg = "NONE" })
api.nvim_set_hl(0, "PmenuThumb", { bg = "#505050", fg = "NONE" })

-- SYNTAX HIGHLIGHT --
api.nvim_set_hl(0, "String",     { bg = "NONE", fg = "#585858" })
api.nvim_set_hl(0, "Comment",    { bg = "NONE", fg = "#484848" })
api.nvim_set_hl(0, "Number",     { bg = "NONE", fg = "#555555" })
api.nvim_set_hl(0, "Function",   { bg = "NONE", fg = "#C53B82" })
api.nvim_set_hl(0, "Statement",  { bg = "NONE", fg = "#777777" })
api.nvim_set_hl(0, "Constant",   { bg = "NONE", fg = "#C53B82" })
api.nvim_set_hl(0, "NonText",    { bg = "NONE", fg = "#303030" })
api.nvim_set_hl(0, "Luatable",   { bg = "NONE", fg = "#777777" })
api.nvim_set_hl(0, "Todo",       { bg = "NONE", fg = "#FF9164" })

-- C HIGHLIGHT --
api.nvim_set_hl(0, "Type",        { bg = "NONE", fg = "#7a70ac" })
api.nvim_set_hl(0, "Structure",   { bg = "NONE", fg = "#7a70ac" })
api.nvim_set_hl(0, "cInclude",    { bg = "NONE", fg = "#9C8FDC" })
api.nvim_set_hl(0, "cTypedef",    { bg = "NONE", fg = "#9C8FDC" })
api.nvim_set_hl(0, "cDefine",     { bg = "NONE", fg = "#C53B82" })
api.nvim_set_hl(0, "SpecialChar", { bg = "NONE", fg = "#9C8FDC" })

-- Lua HIGHLIGHT --
api.nvim_set_hl(0, "LuaFunc", { bg = "NONE", fg = "#9C8FDC" })

-- keymap('n', ";x", function ()
--     api.nvim_open_win(0, true, {
--         title = "HelloNEX",
--         relative = 'win',
--         width = 120,
--         height = 10,
--         border = "single",
--         win = 1001,
--         row = 20,
--         col = 20,
--         -- zindex = zindex,
--     })
--     -- keymap('n', "<ESC>", "<CMD>quit!<CR>", { buffer = true })
-- end, NS)
