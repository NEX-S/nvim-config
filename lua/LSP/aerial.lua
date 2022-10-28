
require "aerial".setup {
    on_attach = function (bufnr)
        local NS = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ';0', '<CMD>AerialToggle!<CR>', NS)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ';j', '<CMD>AerialPrev<CR>',    NS)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ';k', '<CMD>AerialNext<CR>',    NS)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<CMD>AerialPrevUp<CR>',  NS)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<CMD>AerialNextUp<CR>',  NS)
    end,
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
    backends = { "lsp", "treesitter", "markdown" },
    -- backends = {
    --     ['_']        = { "lsp", "treesitter" },
    --     ['python']   = { "lsp", "treesitter" },
    --     ['c']        = { "lsp", "treesitter" },
    --     ['lua']      = { "lsp", "treesitter" },
    --     ['php']      = { "lsp", "treesitter" },
    --     ['html']     = { "lsp", "treesitter" },
    --     ['java']     = { "lsp", "treesitter" },
    --     ['go']       = { "lsp", "treesitter" },
    --     ['markdown'] = { "markdown" },
    -- },
    icons = {
        ['File']          = " ",
        ['Module']        = " ",
        ['Namespace']     = " ﱕ",
        ['Package']       = " ",
        ['Class']         = " ",
        ['Method']        = " ",
        ['Property']      = " ",
        ['Field']         = " ﯟ",
        ['Constructor']   = " ",
        ['Enum']          = " ",
        ['Interface']     = " ",
        ['Function']      = " ",
        ['Variable']      = " ",
        ['Constant']      = " ",
        ['String']        = " ",
        ['Number']        = " ",
        ['Boolean']       = " ",
        ['Array']         = " ",
        ['Object']        = " ",
        ['Key']           = " -",
        ['Null']          = " ",
        ['EnumMember']    = " ",
        ['Struct']        = " ",
        ['Event']         = " ",
        ['Operator']      = " ",
        ['TypeParameter'] = " ",
        ['TypeAlias']     = " ",
        ['Parameter']     = " ",
        ['StaticMethod']  = " ",
        ['Macro']         = "廓",
    },
    --                      
    --                      
    --                  ﴂ ﴃ   
    --    﫢               ﮲  
    -- ﱕ      ﯟ     ﰊ ﰉ ﱢ ﱡ 諸喝卑ﰩ   
    filter_kind = {
        'File',
        'Module',
        'Namespace',
        'Package',
        'Class',
        'Method',
        'Property',
        'Field',
        'Constructor',
        'Enum',
        'Interface',
        'Function',
        'Variable',
        'Constant',
        'String',
        'Number',
        'Boolean',
        'Array',
        'Object',
        'Key',
        'Null',
        'EnumMember',
        'Struct',
        'Event',
        'Operator',
        'TypeParameter',
        'TypeAlias',
        'Parameter',
        'StaticMethod',
        'Macro',
    },
}

-- require "lualine".setup {
--     sections = {
--         lualine_x = { { 'aerial', sep = '', dense = false, dense_sep = '  ' }, 'os.date("%H:%M %a")', }
--     },
-- }

vim.api.nvim_set_hl(0, "AerialKey",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialEnum", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialFile", { bg = "NONE", fg = "#AF87D7", })
vim.api.nvim_set_hl(0, "AerialLine", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialNull", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialArray", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialClass", { bg = "NONE", fg = "#666666", bold = true, italic = true })
vim.api.nvim_set_hl(0, "AerialEvent", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialField", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialGuide1", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide2", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide3", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide4", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide5", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide6", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide7", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide8", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialGuide9", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialLineNC", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialMethod", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialModule", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialNumber", { bg = "NONE", fg = "#afc460", })
vim.api.nvim_set_hl(0, "AerialObject", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialString", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialStruct", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialBoolean",  { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "AerialKeyIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialPackage",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialConstant", { bg = "NONE", fg = "#614F97", bold = true })
vim.api.nvim_set_hl(0, "AerialEnumIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialFileIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialFunction", { bg = "NONE", fg = "#C53B82", italic = true })
vim.api.nvim_set_hl(0, "AerialNullIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialOperator", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialProperty", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialVariable", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialArrayIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialClassIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialEventIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialFieldIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialInterface", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialNamespace", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialEnumMember",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialMethodIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialModuleIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialNumberIcon",  { bg = "NONE", fg = "#afc460", })
vim.api.nvim_set_hl(0, "AerialObjectIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialStringIcon",  { bg = "NONE", fg = "#8F73AA", })
vim.api.nvim_set_hl(0, "AerialStructIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialBooleanIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialConstructor", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialPackageIcon", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialConstantIcon",  { bg = "NONE", fg = "#614F97", })
vim.api.nvim_set_hl(0, "AerialFunctionIcon",  { bg = "NONE", fg = "#C53B82", })
vim.api.nvim_set_hl(0, "AerialOperatorIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialPropertyIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialVariableIcon",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialInterfaceIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialNamespaceIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialTypeParameter", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialEnumMemberIcon",    { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialConstructorIcon",   { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialTypeParameterIcon", { bg = "NONE", fg = "#666666", })

