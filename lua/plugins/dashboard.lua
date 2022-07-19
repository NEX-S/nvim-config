
local dashboard_status, dashboard = pcall(require, 'dashboard')

if not dashboard_status then
    print('[-] DASHBOARD NOT FOUND.')
    return nil
end

dashboard.custom_header = {
    [[                                                                ]],
    [[                                                                ]],
    [[                                                                ]],
    [[    __  ___   _________  __ ____  ____________________________  ]],
    [[   / / / / | / / ____/ |/ // __ \/ ____/ ____/_  __/ ____/ __ \ ]],
    [[  / / / /  |/ / __/  |   // /_/ / __/ / /     / / / __/ / / / / ]],
    [[ / /_/ / /|  / /___ /   |/ ____/ /___/ /___  / / / /___/ /_/ /  ]],
    [[ \____/_/ |_/_____//_/|_/_/   /_____/\____/ /_/ /_____/_____/   ]],
    [[                                                                ]],
    [[                         [ UNEXPECTED ]                         ]],
    [[                                                                ]],
    [[                                                                ]],
    [[                                                                ]],
}

dashboard.custom_center = {
    { icon = '  ', desc = ' FIND FILE ', shortcut = ' SPC X ', action = ':Telescope find_files' },
    { icon = '  ', desc = ' FIND FILE ', shortcut = ' SPC X ', action = ':Telescope find_files' },
    { icon = '  ', desc = ' FIND FILE ', shortcut = ' SPC X ', action = ':Telescope find_files' },
    { icon = '  ', desc = ' FIND FILE ', shortcut = ' SPC X ', action = ':Telescope find_files' },
    { icon = '  ', desc = ' FIND FILE ', shortcut = ' SPC X ', action = ':Telescope find_files' },
}

dashboard.custom_footer = {
    '',
    '',
    '',
    '',
    '「 路漫漫其修远兮 吾将上下而求索 」'
}

