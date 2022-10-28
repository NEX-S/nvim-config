
vim.cmd [[
    hi CursorLine    guibg=#282828 guifg=NONE
    hi Normal        guibg=#252525 guifg=#727272
    hi StatusLineNC  guibg=#303030 guifg=#767676

    hi NonText       guibg=NONE guifg=#323232
    hi VertSplit     guibg=NONE guifg=#353535
    hi Warning       guibg=NONE guifg=#D66F01
    hi ModeMsg       guibg=NONE guifg=#767676
    hi Error         guibg=NONE guifg=#D33FFF
    hi PreProc       guibg=NONE guifg=#767676
    hi SpecialKey    guibg=NONE guifg=#6c5b9e
    hi FoldColumn    guibg=NONE guifg=#666666
    hi WildMenu      guibg=NONE guifg=#D75F5F
    hi SignColumn    guibg=NONE guifg=#767676
    hi Cursor        guibg=NONE guifg=#000000
    hi DiffAdd       guibg=NONE guifg=#87AF87
    hi DiffChange    guibg=NONE guifg=#008FBF
    hi DiffDelete    guibg=NONE guifg=#AF5F87
    hi DiffText      guibg=NONE guifg=#D7AF5F
    hi Operator      guibg=NONE guifg=#555555
    hi Statement     guibg=NONE guifg=#A5A5A5
    hi Special       guibg=NONE guifg=#8567A3
    hi Identifier    guibg=NONE guifg=#C53B82
    hi Constant      guibg=NONE guifg=#C53B82
    hi Number        guibg=NONE guifg=#afc460
    hi Boolean       guibg=NONE guifg=#C53B82
    hi Keyword       guibg=NONE guifg=#6A6A6A
    hi Function      guibg=NONE guifg=#C53B82
    hi Delimiter     guibg=NONE guifg=#8567A3
    hi Question      guibg=NONE guifg=#BBE73D
    hi Label         guibg=NONE guifg=#D0EE7A
    hi SpecialChar   guibg=NONE guifg=#333333
    hi ErrorMsg      guibg=NONE guifg=#C53B82
    hi WarningMsg    guibg=NONE guifg=#d1771b
    hi Ignore        guibg=NONE guifg=#d1771b

    hi diffAdded     guibg=NONE guifg=#9EB73D
    hi diffRemoved   guibg=NONE guifg=#C53B82

    hi helpHyperTextJump  guibg=NONE guifg=#AF87D7

    hi SpecialComment  guibg=NONE guifg=#d1771b

    hi Visual        guibg=#232323 guifg=NONE gui=bold
    hi Search        guibg=NONE guifg=#C53B82 gui=bold
    hi IncSearch     guibg=NONE guifg=#C53B82 gui=bold
    hi MatchParen    guibg=NONE guifg=#C53B82 gui=bold
    hi Directory     guibg=NONE guifg=#AF87D7 gui=bold
    hi Title         guibg=NONE guifg=#C6C6C6 gui=bold

    hi Type          guibg=NONE guifg=#8567A3 gui=italic
    hi Comment       guibg=NONE guifg=#525252 gui=italic
    hi Float         guibg=NONE guifg=#afc460 gui=italic
    hi String        guibg=NONE guifg=#8567A3 gui=italic
    hi Repeat        guibg=NONE guifg=#8567A3 gui=italic
    hi Include       guibg=NONE guifg=#BBE73D gui=italic
    hi Define        guibg=NONE guifg=#C53B82 gui=italic
    hi Structure     guibg=NONE guifg=#BBE73D gui=italic
    hi Macro         guibg=NONE guifg=#BBE73D gui=italic
    hi StorageClass  guibg=NONE guifg=#BBE73D gui=italic

    hi LineNr        guibg=#252525 guifg=#6F6F6F gui=italic
    hi Folded        guibg=#232323 guifg=#494949 gui=italic
    hi CursorLineNr  guibg=#282828 guifg=#6c5b9e gui=italic

    hi Exception     guibg=NONE guifg=#BBE73D gui=italic,bold
    hi Todo          guibg=NONE guifg=#D66F01 gui=italic,bold

    hi Pmenu         guibg=#292929 guifg=#686868
    hi PmenuSel      guibg=#2f2f2f guifg=NONE gui=bold

    hi PmenuSbar     guibg=#313131 guifg=#D33FFF
    hi PmenuThumb    guibg=#434343 guifg=#D33FFF

    hi CursorLine    guibg=#282828 guifg=NONE
]]

vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

vim.keymap.set('n', 'J', '8j', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '8k', { noremap = true, silent = true })

vim.keymap.set('v', 'J', '8j', { noremap = true, silent = true })
vim.keymap.set('v', 'K', '8k', { noremap = true, silent = true })

vim.keymap.set('n', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '$', { noremap = true, silent = true })
vim.keymap.set('o', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('o', 'L', '$', { noremap = true, silent = true })
vim.keymap.set('v', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('v', 'L', '$', { noremap = true, silent = true })

vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '/', '.', { noremap = true, silent = true })
vim.keymap.set('n', '.', ';', { noremap = true, silent = true })
vim.keymap.set('n', '\\', 'q', { noremap = true, silent = true })

vim.keymap.set('n', 'p', 'dP', { noremap = true, silent = true })

vim.keymap.set('n', ';f', '/', { noremap = true, silent = false })
vim.keymap.set('n', '<ESC>', '<CMD>set hls!<CR>', { noremap = true, silent = true })

vim.keymap.set('i', '<A-.>', '<ESC>>>A', { noremap = true, silent = true })

vim.keymap.set('n', '<A-u>', 'viw~e', { noremap = true, silent = true })
vim.keymap.set('i', '<A-u>', '<ESC>viw~ea', { noremap = true, silent = true })

vim.keymap.set('n', '<RIGHT>', '<CMD>resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<LEFT>', '<CMD>resize -2<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<DOWN>', '<CMD>vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<UP>', '<CMD>vertical resize +2<CR>', { noremap = true, silent = true })

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

vim.keymap.set('n', '<', '<<', { noremap = true, silent = true })
vim.keymap.set('n', '>', '>>', { noremap = true, silent = true })

vim.keymap.set('v', '<C-j>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

vim.keymap.set('n', '<A-u>', 'viw~e', { noremap = true, silent = true })
vim.keymap.set('i', '<A-u>', '<ESC>viw~ea', { noremap = true, silent = true })

vim.keymap.set('n', '<C-j>', '<C-i>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-o>', { noremap = true, silent = true })

vim.keymap.set('i', '<A-j>', '<C-n>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '<C-p>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-l>', '<C-y>', { noremap = true, silent = true })

vim.keymap.set('c', '<A-k>', '<UP>', { noremap = true, silent = false })
vim.keymap.set('c', '<A-j>', '<DOWN>', { noremap = true, silent = false })
vim.keymap.set('c', '<A-h>', '<HOME>', { noremap = true, silent = false })
vim.keymap.set('c', '<A-l>', '<END>', { noremap = true, silent = false })

vim.keymap.set('n', '<A-=>', '<C-a>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-->', '<C-x>', { noremap = true, silent = true })

vim.keymap.set('n', '+', 'J', { noremap = true, silent = true })

vim.keymap.set('n', ';a', 'ggvG$', { noremap = true, silent = true })

vim.keymap.set('n', ';w', '<CMD>w!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';q', '<CMD>q!<CR>', { noremap = true, silent = true })

vim.keymap.set('v', ';w', '<ESC><CMD>w!<CR>gv', { noremap = true, silent = true })
vim.keymap.set('v', ';q', '<ESC><CMD>q!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-q>', '<CMD>qa!<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-q>', '<CMD>qa!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<SPACE>', ';', { noremap = true, silent = true })
vim.keymap.set('v', '<SPACE>', ';', { noremap = true, silent = true })
vim.keymap.set('o', '<SPACE>', ';', { noremap = true, silent = true })

vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true })

vim.keymap.set('n', 'm', '%', { remap = true, silent = true })

vim.keymap.set('n', ';m', 'm', { noremap = true, silent = true })

vim.keymap.set('n', 'yy', '"+yy', { noremap = true, silent = true})

vim.keymap.set('n', 'y', '"+y', { noremap = true, silent = true})
vim.keymap.set('v', 'y', '"+y', { noremap = true, silent = true})

vim.keymap.set('v', 'd', '"dd', { noremap = true, silent = true})
vim.keymap.set('n', 'd', '"dd', { noremap = true, silent = true})

vim.keymap.set('n', 'dp', '"dp', { noremap = true, silent = true})
vim.keymap.set('n', 'dP', '"dP', { noremap = true, silent = true})
vim.keymap.set('n', 'dd', '"ddd', { noremap = true, silent = true})

vim.keymap.set('n', 'p', '"+p', { noremap = true, silent = true})
vim.keymap.set('n', 'P', '"+P', { noremap = true, silent = true})

vim.keymap.set('v', '<A-(>', 'A)<ESC>`<i(<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('v', '<A-[>', 'A]<ESC>`<i[<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('v', '<A-{>', 'A}<ESC>`<i{<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('v', '<A-">', 'A"<ESC>`<i"<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('v', "<A-'>", "A'<ESC>`<i'<ESC>v`>ll", { noremap = true, silent = true})
vim.keymap.set('v', '<A-<>', 'A`<ESC>`<i`<ESC>v`>ll', { noremap = true, silent = true})

vim.keymap.set('o', 'l<', ':<C-u>normal! f<vi<<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'l>', ':<C-u>normal! f<vi<<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h<', ':<C-u>normal! F>vi><CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h>', ':<C-u>normal! F>vi><CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'l[', ':<C-u>normal! f[vi[<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'l]', ':<C-u>normal! f[vi[<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h[', ':<C-u>normal! F]vi]<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h]', ':<C-u>normal! F]vi]<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'l{', ':<C-u>normal! f{vi{<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'l}', ':<C-u>normal! f{vi{<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h{', ':<C-u>normal! F{vi{<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h}', ':<C-u>normal! F{vi{<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'l(', ':<C-u>normal! f(vi(<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'l)', ':<C-u>normal! f(vi(<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h(', ':<C-u>normal! F)vi)<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h)', ':<C-u>normal! F)vi)<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-x>', ':bdelete<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'lb', ':<C-u>normal! f(vib<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'hb', ':<C-u>normal! F)vib<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'l"', ':<C-u>normal! f"vi"<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'h"', ':<C-u>normal! F"vi"<CR>', { noremap = true, silent = true })

vim.keymap.set('o', "l'", ":<C-u>normal! f'vi'<CR>", { noremap = true, silent = true })
vim.keymap.set('o', "h'", ":<C-u>normal! F'vi'<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<TAB>', '<C-w><C-w>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-TAB>', '<C-w>p', { noremap = true, silent = true })

vim.keymap.set('n', 'q', 'za', { noremap = true, silent = true })

vim.keymap.set('n', ';v', '<CMD>vs<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';s', '<CMD>sp<CR>', { noremap = true, silent = true })

vim.keymap.set('i', '<A-h>', '<ESC>ciw', { noremap = true, silent = true })


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
-- vim.opt.lazyredraw    = true
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

vim.opt.autochdir     = true

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
vim.opt.pumheight = 18

vim.opt.paste         = true

vim.opt.showbreak = '↳  '

vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("space:·")
vim.opt.listchars:append("tab: ")
vim.opt.listchars:append("eol:↲")
-- vim.opt.listchars:append("eol: ")
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


vim.opt.foldnestmax = 9
vim.opt.foldminlines = 4

-- FOLD SETTINGS --
vim.wo.foldmethod = "expr"
vim.wo.foldexpr   = "nvim_treesitter#foldexpr()"
vim.opt.fillchars = "fold: "

