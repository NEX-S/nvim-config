
require "aerial".setup {
    show_guides = false,
    guides = {
        -- When the child item has a sibling below it
        mid_item = "├─",
        -- When the child item is the last in the list
        last_item = "└─",
        -- When there are nested child guides to the right
        nested_top = "│ ",
        -- Raw indentation
        whitespace = " ",
    },
    min_width = 40,
    backends = {
        ['_']        = { "lsp", "treesitter" },
        ['python']   = { "lsp", "treesitter" },
        ['c']        = { "lsp", "treesitter" },
        ['lua']      = { "lsp", "treesitter" },
        ['php']      = { "lsp", "treesitter" },
        ['html']     = { "treesitter" },
        ['markdown'] = { "markdown" },
    },
    icons = {
        ['Constructor'] = 'Constructor',
        ['Enum'] = 'Enum',
        ['EnumMember'] = 'EnumMember',
        ['Event'] = 'Event',
        ['File'] = 'File',
        --  
        ['Interface'] = '',
        ['Key'] = 'Key',
        ['Namespace'] = 'Namespace',
        ['Operator'] = 'Operator',
        ['Package'] = 'Package',
        ['TypeParameter'] = 'TypeParameter',

        ['Field']    = " ﯟ",
        ['Function'] = " ",
        --  
        ['Variable'] = " ",
        ['Boolean']  = " ",
        ['Property'] = " ",
        ['String']   = " ﱕ",
        ['Array']    = " ",
        ['class']    = " ",
        ['Method']   = " ",
        --  
        ['Struct']   = " ",
        ['Module']   = " ",
        ['Object']   = " ",
        ['Number']   = " ",
        ['Constant'] = " ",
        ['Null']     = " ",
    },
    --                      
    --                      
    --                  ﴂ ﴃ   
    --    﫢               ﮲  
    -- ﱕ      ﯟ     ﰊ ﰉ ﱢ ﱡ 諸喝卑ﰩ   
    filter_kind = {
        'Array',
        'Boolean',
        'Class',
        'Constant',
        'Constructor',
        'Enum',
        'EnumMember',
        'Event',
        'Field',
        'File',
        'Function',
        'Interface',
        'Key',
        'Method',
        'Module',
        'Namespace',
        'Null',
        'Number',
        'Object',
        'Operator',
        'Package',
        'Property',
        'String',
        'Struct',
        'TypeParameter',
        'Variable'
    },
}

require "lualine".setup {
    sections = {
        -- lualine_x = { { 'aerial', sep = '  ', dense = true, dense_sep = '  ' }, 'os.date("%H:%M %a")', 'filetype' }
        lualine_x = { { 'aerial', sep = '', dense = false, dense_sep = '  ' }, 'os.date("%H:%M %a")', 'filetype' }
    },
}

