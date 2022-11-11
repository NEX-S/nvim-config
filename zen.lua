local api = vim.api
local keymap = vim.keymap.set

vim.cmd "au!"
vim.cmd "syntax off"

vim.opt.termguicolors = true
vim.opt.number        = true
vim.opt.smartcase     = true
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

local NS = { noremap = true, silent = false }
local BNS = { buffer = true, noremap = true, silent = false }

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

-- AUTO PARI --
api.nvim_create_autocmd( "InsertEnter", {
    pattern = "*",
    once = true,
    callback = function ()
        keymap('i', "(", "()<LEFT>", NS)
        keymap('i', "{", "{}<LEFT>", NS)
        keymap('i', "[", "[]<LEFT>", NS)
        keymap('i', "'", "''<LEFT>", NS)
        keymap('i', '"', '""<LEFT>', NS)

        -- 判断当前光标右边是不是) } ] 是的话就进行下面的mapping
        -- keymap('i', ")", "<RIGHT>", NS)
        -- keymap('i', "}", "<RIGHT>", NS)
        -- keymap('i', "]", "<RIGHT>", NS)
    end
})
-- LUA PLUGIN --
api.nvim_create_autocmd( "FileType", {
    pattern = "lua",
    once = true,
    callback = function ()
        keymap('n', ";c", "I-- <ESC>", NS)
    end
})

-- TRANSLATE --
keymap("n", ";t", function ()
    local word = vim.fn.expand("<cword>")
    vim.cmd("vs term://trans -hl zh -to zh -j -speak -indent 8 " .. word)
    vim.cmd("vert resize 40 || set nonu || nnoremap <buffer> <silent> <ESC> :q!<CR>")
end, NS)

-- AUTO SOURCE --
api.nvim_create_autocmd("BufWritePost", {
    pattern = "zen.lua",
    command = "source %",
})

-- FILE EXPLORER --
keymap("n", ";e", function ()
    vim.g.netrw_winsize = 25     -- Window size
    vim.g.netrw_banner = 0       -- Hide banner
    vim.g.netrw_browse_split = 4 -- Open in previous window
    -- vim.g.netrw_altv = 1         -- Open with right splitting
    vim.g.netrw_liststyle = 3    -- Tree-style view
    vim.cmd "Vexplore"
    keymap('n', "l", "<CR>", BNS)
    keymap('n', ";e", "<CMD>quit!<CR>", BNS)
end, NS)

-- api.nvim_create_autocmd("TextYankPost", {
--     command = "silent! lua vim.highlight.on_yank()",
-- })

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

-- HIGHLIGHT --

api.nvim_set_hl(0, "Normal",       { bg = "NONE", fg = "#777777" })
api.nvim_set_hl(0, "VertSplit",    { bg = "NONE", fg = "#333333" })
api.nvim_set_hl(0, "LineNr",       { bg = "NONE", fg = "#383838" })
api.nvim_set_hl(0, "Search",       { bg = "NONE", fg = "#AE91E8" })
api.nvim_set_hl(0, "IncSearch",    { bg = "NONE", fg = "#AE91E8" })
api.nvim_set_hl(0, "CursorLine",   { bg = "NONE", fg = "#999999" })

api.nvim_set_hl(0, "Visual",       { bg = "NONE", fg = "#999999", bold = true })
api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = "#505050", bold = true })

api.nvim_set_hl(0, "Pmenu",      { bg = "#282828", fg = "#757575" })
api.nvim_set_hl(0, "PmenuSel",   { bg = "#383838", fg = "#888888", bold = true })
api.nvim_set_hl(0, "PmenuSbar",  { bg = "#383838", fg = "NONE" })
api.nvim_set_hl(0, "PmenuThumb", { bg = "#505050", fg = "NONE" })
