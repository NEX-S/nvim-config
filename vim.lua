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

vim.opt.listchars:append "eol:⸥"
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "trail:-"

vim.cmd [[
    syntax off
    nnoremap ;q <CMD>exit!<CR>
    nnoremap ;w <CMD>w!<CR>

    nnoremap J 8j
    nnoremap K 8k
    xnoremap J 8j
    xnoremap K 8k
    onoremap J 8j
    onoremap K 8k

    nnoremap H ^
    nnoremap L $
    xnoremap H ^
    xnoremap L $
    onoremap H ^
    onoremap L $

    nnoremap m %
    nnoremap m %
    xnoremap m %
    xnoremap m %
    onoremap m %
    onoremap m %

    nnoremap > >>
    nnoremap < <<
    xnoremap > >gv
    xnoremap < <gv

    nnoremap + J
    nnoremap ;a ggvG$

    tnoremap <ESC> <C-\\><C-n>

    nnoremap <SPACE> ;
    onoremap <SPACE> ;
    xnoremap <SPACE> ;

    nnoremap U <C-r>

    nnoremap yy "+yy
    nnoremap y "+y
    xnoremap y "+y

    nnoremap p "+p
    nnoremap P "+P

    nnoremap dd "ddd
    nnoremap d "dd
    xnoremap d "dd

    nnoremap dp "dp
    nnoremap dP "dP

    nnoremap ;f /

    xnoremap <BS> s

    nnoremap <C-i> <C-a>
    nnoremap <C-d> <C-x>
    xnoremap <C-i> g<C-a>
    xnoremap <C-d> g<C-x>

    nnoremap <TAB> <C-w>p
    nnoremap <S-TAB> <C-w><C-w>

    nnoremap <UP>    <C-w>k
    nnoremap <DOWN>  <C-w>j
    nnoremap <LEFT>  <C-w>h
    nnoremap <RIGHT> <C-w>l

    nnoremap <A-j> <C-i>
    nnoremap <A-k> <C-o>
    nnoremap <A-h> <CMD>bp<CR>
    nnoremap <A-l> <CMD>bn<CR>

]]

local NS = { noremap = true, silent = true }

vim.keymap.set('n', "<ESC>", "<CMD>set hls!<CR>", NS)

vim.keymap.set('n', ";c", "I// <ESC>", NS)
vim.keymap.set('n', ";b", "a/*  */<LEFT><LEFT><LEFT>", NS)

vim.keymap.set("n", ";r", function ()
    local file = vim.fn.expand("%")
    local fileNoExt = vim.fn.expand("%<")
    local compiledCmd = "clang -Wall " .. file .. " -o ./bin/" .. fileNoExt

    vim.cmd "w!"
    vim.fn.system(compiledCmd)
    vim.cmd "vs term://bin/test || vert resize 40 || set nonu || nnoremap <buffer> <silent> <ESC> :q!<CR>"
end, NS)

vim.keymap.set("n", ";t", function ()
    local word = vim.fn.expand("<cword>")
    vim.cmd("vs term://trans -hl zh -to zh -j -speak -indent 8 " .. word)
    vim.cmd("vert resize 40 || set nonu || nnoremap <buffer> <silent> <ESC> :q!<CR>")
end, NS)

vim.api.nvim_set_hl(0, "Normal",       { bg = "NONE", fg = "#777777" })
vim.api.nvim_set_hl(0, "VertSplit",    { bg = "NONE", fg = "#333333" })
vim.api.nvim_set_hl(0, "LineNr",       { bg = "NONE", fg = "#383838" })
vim.api.nvim_set_hl(0, "Search",       { bg = "NONE", fg = "#AE91E8" })
vim.api.nvim_set_hl(0, "IncSearch",    { bg = "NONE", fg = "#AE91E8" })

vim.api.nvim_set_hl(0, "Visual",       { bg = "NONE", fg = "#aaaaaa", bold = true })
vim.api.nvim_set_hl(0, "CursorLine",   { bg = "NONE", fg = "#999999", bold = true })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = "#505050", bold = true })

vim.api.nvim_set_hl(0, "Boolean",      { bg = "NONE", fg = "#C53B82" })
