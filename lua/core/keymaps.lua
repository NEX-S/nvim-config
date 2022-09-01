
--  MODES  --
--  normal_mode   = 'n',
--  insert_mode   = 'i',
--  visual_mode   = 'v',
--  vblock_mode   = 'x',
--  terminal_mode = 't',
--  command_mode  = 'c',

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

-- vim.keymap.set('n', ';t', 'viw:Translate ZH -source=EN -parse_after=window -output=floating<CR>', { noremap = true, silent = true})
-- vim.keymap.set('v', ';t', ':Translate ZH -source=EN -parse_after=window -output=floating<CR>', { noremap = true, silent = true})
-- vim.keymap.set('x', ';t', ':Translate ZH -source=EN -parse_after=window -output=floating<CR>', { noremap = true, silent = true})

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

vim.keymap.set('n', ';e', '<CMD>NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-f>', '<CMD>Telescope find_files theme=dropdown previewer=false<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-f>', '<CMD>Telescope live_grep<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<F2>', '<CMD>w | source $MYVIMRC<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<TAB>', '<C-w><C-w>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-TAB>', '<C-w>p', { noremap = true, silent = true })

vim.keymap.set('n', 'q', 'za', { noremap = true, silent = true })

-- vim.keymap.set('v', ';r', ':SnipRun<CR>', { noremap = true, silent = false })
vim.keymap.set('n', ';r', '<CMD>w | RunCode<CR>', { noremap = true, silent = true })

vim.keymap.set('n', ';v', '<CMD>vs<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';s', '<CMD>sp<CR>', { noremap = true, silent = true })

vim.keymap.set('i', '<A-h>', '<ESC>ciw', { noremap = true, silent = true })

vim.keymap.set('v', '<A-b>', ':<C-u>lua require "b64".encode()<CR>', { noremap = true, silent = true })

vim.keymap.set('v', '<A-B>', ':<C-u>lua require "b64".decode()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '*', "*<CMD>lua require 'hlslens'.start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '#', "#<CMD>lua require 'hlslens'.start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'g*', "g*<CMD>lua require 'hlslens'.start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'g#', "g#<CMD>lua require 'hlslens'.start()<CR>", { noremap = true, silent = true })

vim.keymap.set('n', 'n', "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'N', "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>", { noremap = true, silent = true })

