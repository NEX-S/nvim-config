
local dashboard_status, dashboard = pcall(require, 'dashboard')

if not dashboard_status then
    print('[-] DASHBOARD NOT FOUND.')
    return nil
end

dashboard.custom_header = {
    [[                                                                        ]],
    [[                                                                        ]],
    [[                                                                        ]],
    [[        __  ___   _________  __ ____  ____________________________      ]],
    [[       / / / / | / / ____/ |/ // __ \/ ____/ ____/_  __/ ____/ __ \     ]],
    [[      / / / /  |/ / __/  |   // /_/ / __/ / /     / / / __/ / / / /     ]],
    [[     / /_/ / /|  / /___ /   |/ ____/ /___/ /___  / / / /___/ /_/ /      ]],
    [[     \____/_/ |_/_____//_/|_/_/   /_____/\____/ /_/ /_____/_____/       ]],
    [[                                                                        ]],
    [[                             [ UNEXPECTED ]                             ]],
    [[                                                                        ]],
    [[                                                                        ]],
    [[                                                                        ]],
}

dashboard.custom_center = {
    { icon = "  ", desc = " RECENT FILES  ", shortcut = '\t\t\tSPC X       ', action = ':Telescope oldfiles' },
    { icon = "  ", desc = " FIND FILE  ", shortcut = '\t\t\tSPC X          ', action = ':Telescope find_files' },
    { icon = " ﱕ ", desc = " LIVE GREP  ", shortcut = '\t\t\tSPC X          ', action = ':Telescope live_grep' },
    { icon = "  ", desc = " NVIM CONFIG  ",  shortcut = '\t\t\tSPC X       ', action = ':edit $MYVIMRC' },
}

dashboard.custom_key = {
    ['a']     = ':Telescope oldfiles<CR>',
    ['s']     = ':Telescope find_files<CR>',
    ['d']     = ':Telescope live_grep<CR>',
    ['f']     = ':edit $MYVIMRC<CR>',
    ['q']     = '<CMD>q!<CR>',
    ['<ESC>'] = '<CMD>q!<CR>',
    ['o']     = '<CMD>lua require "dashboard".call_line_action()<CR>',
    ['l']     = '<CMD>lua require "dashboard".call_line_action()<CR>',
    ['<CR>']  = '<CMD>lua require "dashboard".call_line_action()<CR>',
}

dashboard.custom_footer = {
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '「 路漫漫其修远兮 吾将上下而求索 」'
}

