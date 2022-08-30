
vim.opt.writebackup = false
vim.opt.showmatch   = false
vim.opt.wrap        = false
vim.opt.backup      = false
vim.opt.swapfile    = false
vim.opt.showmode    = false
vim.opt.foldenable  = false

vim.opt.termguicolors = true
vim.opt.number        = true
vim.opt.cursorline    = true
vim.opt.undofile      = true
vim.opt.showcmd       = true
vim.opt.lazyredraw    = true
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.incsearch     = true
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.wildmenu      = true
vim.opt.expandtab     = true
vim.opt.list          = true
vim.opt.hidden        = true
vim.opt.smarttab      = true

-- vim.opt.autochdir     = true

vim.opt.mouse = ''
vim.opt.fileformats = 'unix,mac,dos'
vim.opt.magic = true
vim.opt.virtualedit = 'block'
vim.opt.shiftround = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.redrawtime = 1500
vim.opt.infercase = true


vim.opt.pumblend = 25
vim.opt.winblend = 25

-- BUG: CAUSE INDENT PROBLEM --
-- vim.opt.paste         = true

vim.opt.showbreak = '↳  '

vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("space:·")
vim.opt.listchars:append("tab: ")
-- vim.opt.listchars:append("eol:↲")
vim.opt.listchars:append("eol: ")
vim.opt.listchars:append("trail:-")
vim.opt.listchars:append("nbsp:b")
vim.opt.listchars:append("extends:c")
vim.opt.listchars:append("precedes:d")

vim.opt.iskeyword:remove('_')

vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes:1'

vim.opt.showtabline   = 0
vim.opt.cmdheight     = 0
vim.opt.laststatus    = 0
vim.opt.tabstop       = 4
vim.opt.softtabstop   = 4
vim.opt.shiftwidth    = 4
vim.opt.conceallevel  = 0
vim.opt.numberwidth   = 3

vim.opt.scrolloff     = 6
vim.opt.sidescrolloff = 15
vim.opt.updatetime    = 100

vim.opt.modelines = 0
vim.opt.autoindent = true
vim.opt.smartindent = true

-- vim.opt.statusline = ' %-60.60([  UNEXPECTED ] [ %F  ]%)%=[ %c -  %B ] [ %l-%L : %p%% ] [ '..os.date("%m-%d %a")..' ] %y '

-- function _G.custom_fold_text()
--     local s_pos = vim.v.foldstart
--     local e_pos = vim.v.foldend
--     local sta_line = vim.fn.getline(s_pos)
--     local end_line = vim.fn.trim(vim.fn.getline(e_pos))
--     local sub = string.gsub(sta_line, '\t', string.rep(' ', vim.o.tabstop))
--     local lnum = e_pos - s_pos + 1
--     local dash = '  ' .. vim.v.folddashes .. " [ "
--     local offset = 17
--     local IDE_width = 80
--     local gap = string.rep('-', IDE_width - #sub - #end_line - offset)
--     gap = ' ] ' .. gap .. ' [ '
--     return dash .. sub .. " ... " .. end_line .. gap .. lnum .. " LINES ]"
-- end

-- vim.opt.foldtext = "v:lua.custom_fold_text()"

vim.opt.foldnestmax = 9
vim.opt.foldminlines = 4

-- FOLD SETTINGS --
vim.wo.foldmethod = "expr"
vim.wo.foldexpr   = "nvim_treesitter#foldexpr()"
vim.opt.fillchars = "fold: "

-- vim.opt.runtimepath:prepend('~/.cache/nvim')
