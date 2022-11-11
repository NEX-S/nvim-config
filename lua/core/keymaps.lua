
--  MODES  --
--  normal_mode   = 'n',
--  insert_mode   = 'i',
--  visual_mode   = 'x',
--  vblock_mode   = 'x',
--  terminal_mode = 't',
--  command_mode  = 'c',

local NS = { noremap = true, silent = true }

vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

vim.keymap.set('n', 'J', '8j', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '8k', { noremap = true, silent = true })

vim.keymap.set('x', 'J', '8j', { noremap = true, silent = true })
vim.keymap.set('x', 'K', '8k', { noremap = true, silent = true })

vim.keymap.set('n', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '$', { noremap = true, silent = true })
vim.keymap.set('o', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('o', 'L', '$', { noremap = true, silent = true })
vim.keymap.set('x', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('x', 'L', '$', { noremap = true, silent = true })

vim.keymap.set('n', '<LEFT>',  '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<DOWN>',  '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<UP>',    '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<RIGHT>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- vim.keymap.set('n', "'", ';', { noremap = true, silent = true })
vim.keymap.set('n', '/', ';', { noremap = true, silent = true })

vim.keymap.set('n', '\\', function ()
    vim.cmd "set lazyredraw"
    vim.cmd "normal!q"
end, { noremap = false, silent = true })

vim.keymap.set('n', 'p', 'dP', { noremap = true, silent = true })

vim.keymap.set('n', ';f', '/', { noremap = true, silent = false })
vim.keymap.set('n', '<ESC>', '<CMD>set hls!<CR>', { noremap = true, silent = true })
-- vim.keymap.set('i', '<ESC>', '<ESC>l', { noremap = true, silent = true })

vim.keymap.set('i', '<A-.>', '<ESC>>>A', { noremap = true, silent = true })

vim.keymap.set('n', '<A-u>', 'viw~e', { noremap = true, silent = true })
vim.keymap.set('i', '<A-u>', '<ESC>viw~ea', { noremap = true, silent = true })

vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true })

vim.keymap.set('n', '<', '<<', { noremap = true, silent = true })
vim.keymap.set('n', '>', '>>', { noremap = true, silent = true })

vim.keymap.set('x', '<C-j>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('x', '<C-k>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

vim.keymap.set('n', '<A-u>', 'viw~e', { noremap = true, silent = true })
vim.keymap.set('i', '<A-u>', '<ESC>viw~ea', { noremap = true, silent = true })

vim.keymap.set('n', '<A-j>', '<C-i>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-o>', { noremap = true, silent = true })

vim.keymap.set('i', '<A-j>', '<C-n>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '<C-p>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-l>', '<C-y>', { noremap = true, silent = true })

vim.keymap.set('c', '<C-k>', '<UP>', { noremap = true, silent = false })
vim.keymap.set('c', '<C-j>', '<DOWN>', { noremap = true, silent = false })
vim.keymap.set('c', '<C-h>', '<HOME>', { noremap = true, silent = false })
vim.keymap.set('c', '<C-l>', '<END>', { noremap = true, silent = false })
-- vim.keymap.set('c', '<C-;>', '<BS>', { noremap = true, silent = false })
-- vim.keymap.set('c', '<C-\'>', '<DEL>', { noremap = true, silent = false })

vim.keymap.set('n', '<A-=>', '<C-a>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-->', '<C-x>', { noremap = true, silent = true })

vim.keymap.set('n', '+', 'J', { noremap = true, silent = true })

vim.keymap.set('n', ';a', 'ggvG$', { noremap = true, silent = true })

vim.keymap.set('n', ';w', '<CMD>w!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';q', '<CMD>q!<CR>', { noremap = true, silent = true })

-- vim.keymap.set('n', ';t', 'viw:Translate ZH -source=EN -parse_after=window -output=floating<CR>', { noremap = true, silent = true})
-- vim.keymap.set('x', ';t', ':Translate ZH -source=EN -parse_after=window -output=floating<CR>', { noremap = true, silent = true})
-- vim.keymap.set('x', ';t', ':Translate ZH -source=EN -parse_after=window -output=floating<CR>', { noremap = true, silent = true})

vim.keymap.set('x', ';w', '<ESC><CMD>w!<CR>gv', { noremap = true, silent = true })
vim.keymap.set('x', ';q', '<ESC><CMD>q!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<A-q>', '<CMD>qa!<CR>', { noremap = true, silent = true })
vim.keymap.set('x', '<A-q>', '<CMD>qa!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<SPACE>', ';', { noremap = true, silent = true })
vim.keymap.set('x', '<SPACE>', ';', { noremap = true, silent = true })
vim.keymap.set('o', '<SPACE>', ';', { noremap = true, silent = true })

vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true })

vim.keymap.set('n', 'm', '%', { noremap = true, silent = true })
vim.keymap.set('x', 'm', '%', { noremap = true, silent = true })

vim.keymap.set('n', ';m', 'm', { noremap = true, silent = true })

vim.keymap.set('n', 'yy', '"+yy', { noremap = true, silent = true})

vim.keymap.set('n', 'y', '"+y', { noremap = true, silent = true})
vim.keymap.set('x', 'y', '"+y', { noremap = true, silent = true})

vim.keymap.set('x', 'd', '"dd', { noremap = true, silent = true})
vim.keymap.set('n', 'd', '"dd', { noremap = true, silent = true})

vim.keymap.set('n', 'dp', '"dp', { noremap = true, silent = true})
vim.keymap.set('n', 'dP', '"dP', { noremap = true, silent = true})
vim.keymap.set('n', 'dd', '"ddd', { noremap = true, silent = true})

vim.keymap.set('n', 'p', '"+p', { noremap = true, silent = true})
vim.keymap.set('n', 'P', '"+P', { noremap = true, silent = true})

vim.keymap.set('x', '<A-(>', 'A)<ESC>`<i(<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('x', '<A-[>', 'A]<ESC>`<i[<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('x', '<A-{>', 'A}<ESC>`<i{<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('x', '<A-">', 'A"<ESC>`<i"<ESC>v`>ll', { noremap = true, silent = true})
vim.keymap.set('x', "<A-'>", "A'<ESC>`<i'<ESC>v`>ll", { noremap = true, silent = true})
vim.keymap.set('x', '<A-<>', 'A`<ESC>`<i`<ESC>v`>ll', { noremap = true, silent = true})

vim.keymap.set('o', 'n<', ':<C-u>normal! f<vi<<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'n>', ':<C-u>normal! f<vi<<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p<', ':<C-u>normal! F>vi><CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p>', ':<C-u>normal! F>vi><CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'n[', ':<C-u>normal! f[vi[<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'n]', ':<C-u>normal! f[vi[<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p[', ':<C-u>normal! F]vi]<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p]', ':<C-u>normal! F]vi]<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'n{', ':<C-u>normal! f{vi{<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'n}', ':<C-u>normal! f{vi{<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p{', ':<C-u>normal! F{vi{<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p}', ':<C-u>normal! F{vi{<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'n(', ':<C-u>normal! f(vi(<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'n)', ':<C-u>normal! f(vi(<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p(', ':<C-u>normal! F)vi)<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p)', ':<C-u>normal! F)vi)<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<A-h>', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-,>', '<CMD>bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-.>', '<CMD>bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-x>', ':bdelete<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'lb', ':<C-u>normal! f(vib<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'hb', ':<C-u>normal! F)vib<CR>', { noremap = true, silent = true })

vim.keymap.set('o', 'n"', ':<C-u>normal! f"vi"<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'p"', ':<C-u>normal! F"vi"<CR>', { noremap = true, silent = true })

vim.keymap.set('o', "n'", ":<C-u>normal! f'vi'<CR>", { noremap = true, silent = true })
vim.keymap.set('o', "p'", ":<C-u>normal! F'vi'<CR>", { noremap = true, silent = true })

vim.keymap.set('n', ';e', '<CMD>NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-f>', '<CMD>Telescope find_files theme=dropdown previewer=false<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '/', '<CMD>Telescope commands theme=dropdown<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-f>', '<CMD>Telescope live_grep<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<F2>', '<CMD>w | source $MYVIMRC<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<TAB>', '<C-w>p', { noremap = true, silent = true })
vim.keymap.set('n', '<S-TAB>', '<C-w><C-w>', { noremap = true, silent = true })

vim.keymap.set('n', 'q', 'za', { noremap = true, silent = true })

-- vim.keymap.set('x', ';r', ':SnipRun<CR>', { noremap = true, silent = false })
vim.keymap.set('n', ';r', '<CMD>w | RunFile<CR>', { noremap = true, silent = true })

vim.keymap.set('n', ';v', '<CMD>vs<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';s', '<CMD>sp<CR>', { noremap = true, silent = true })

vim.keymap.set('i', '<A-h>', '<ESC>ciw', { noremap = true, silent = true })

vim.keymap.set('x', '<A-b>', ':<C-u>lua require "b64".encode()<CR>', { noremap = true, silent = true })

vim.keymap.set('x', '<A-B>', ':<C-u>lua require "b64".decode()<CR>', { noremap = true, silent = true })

vim.keymap.set('x', '<C-a>', 'g<C-a>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-;>', 'i', { noremap = true, silent = true })

vim.keymap.set('n', '<A-h>', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-o>',   { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', '<C-i>',   { noremap = true, silent = true })

vim.keymap.set('n', 'cc',  'S',   { noremap = true, silent = true })



-- vim.keymap.set('n', '*',  "*<CMD>lua require 'hlslens'.start()<CR>",  { noremap = true, silent = true })
-- vim.keymap.set('n', '#',  "#<CMD>lua require 'hlslens'.start()<CR>",  { noremap = true, silent = true })
-- vim.keymap.set('n', 'g*', "g*<CMD>lua require 'hlslens'.start()<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', 'g#', "g#<CMD>lua require 'hlslens'.start()<CR>", { noremap = true, silent = true })

-- vim.keymap.set('n', 'n', "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', 'N', "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>", { noremap = true, silent = true })

-- local NS = { noremap = true, silent = true }
--
-- vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
-- vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
-- vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
-- vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews
--
-- -- Example gawip to align a paragraph to a string, looking left and with previews
-- vim.keymap.set( 'n', 'gaw', function()
--         local a = require 'align'
--         a.operator(
--             a.align_to_string,
--             { is_pattern = false, reverse = true, preview = true }
--         )
--     end,
--     NS
-- )
--
-- -- Example gaaip to aling a paragraph to 1 character, looking left
-- vim.keymap.set( 'n', 'gaa', function()
--         local a = require 'align'
--         a.operator(
--             a.align_to_char,
--             { reverse = true }
--         )
--     end,
--     NS
-- )

-- vim.keymap.set( 'n', ';0', '<CMD>AerialToggle!<CR>',  { noremap = true, silent = true})
-- vim.keymap.set( 'n', ';j',  '<CMD>AerialPrev<CR>',    { noremap = true, silent = true})
-- vim.keymap.set( 'n', ';k',  '<CMD>AerialNext<CR>',    { noremap = true, silent = true})
-- vim.keymap.set( 'n', '[[', '<CMD>AerialPrevUp<CR>',   { noremap = true, silent = true})
-- vim.keymap.set( 'n', ']]', '<CMD>AerialNextUp<CR>',   { noremap = true, silent = true})

-- vim.keymap.set('n', '<A-.>', 'n', NS)
-- vim.keymap.set('n', '<A-,>', 'N', NS)

-- vim.keymap.set('n',';c',':ComComment<CR>', { noremap = true, silent = true })
-- vim.keymap.set('x',';c',':ComComment<CR>gv', { noremap = true, silent = true })

vim.keymap.set('n','<F1>',':color Base2Tone_SeaDark<CR>',    { noremap = true, silent = true })
vim.keymap.set('n','<F2>',':color Base2Tone_ForestDark<CR>', { noremap = true, silent = true })
vim.keymap.set('n','<F3>',':color Base2Tone_FieldDark<CR>',  { noremap = true, silent = true })
vim.keymap.set('n','<F4>',':color Base2Tone_DesertDark<CR>', { noremap = true, silent = true })

vim.keymap.set('n', ";j", "G", { noremap = true, silent = true })
vim.keymap.set('n', ";k", "gg", { noremap = true, silent = true })

vim.keymap.set('v', "<BS>", "s", { noremap = true, silent = true })


