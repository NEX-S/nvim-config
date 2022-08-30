
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
    min_width = 35,
    backends = {
        ['_']        = { "lsp", "treesitter" },
        ['python']   = { "lsp", "treesitter" },
        ['c']        = { "lsp", "treesitter" },
        ['lua']      = { "lsp", "treesitter" },
        ['php']      = { "lsp", "treesitter" },
        ['html']     = { "lsp", "treesitter" },
        ['java']     = { "lsp", "treesitter" },
        ['go']       = { "lsp", "treesitter" },
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
        lualine_x = { { 'aerial', sep = '', dense = false, dense_sep = '  ' }, 'os.date("%H:%M %a")', }
    },
}

vim.api.nvim_set_hl(0, "AerialKey",  { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialEnum", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialFile", { bg = "NONE", fg = "#AF87D7", })
vim.api.nvim_set_hl(0, "AerialLine", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialNull", { bg = "NONE", fg = "#666666", })

vim.api.nvim_set_hl(0, "AerialArray", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialClass", { bg = "NONE", fg = "#666666", })
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
vim.api.nvim_set_hl(0, "AerialConstant", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialEnumIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialFileIcon", { bg = "NONE", fg = "#666666", })
vim.api.nvim_set_hl(0, "AerialFunction", { bg = "NONE", fg = "#C53B82", })
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

vim.api.nvim_set_hl(0, "AerialConstantIcon",  { bg = "NONE", fg = "#666666", })
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

-- vim.api.nvim_set_hl(0, "lualine_b_diff_added_insert",       { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_added_normal",       { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_added_visual",       { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_added_command",      { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_added_replace",      { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_added_inactive",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_added_terminal",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_removed_insert",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_removed_normal",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_removed_visual",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_modified_insert",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_modified_normal",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_modified_visual",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_removed_command",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_removed_replace",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_modified_command",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_modified_replace",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_removed_inactive",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_removed_terminal",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_modified_inactive",  { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diff_modified_terminal",  { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
--
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint_insert",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint_normal",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint_visual",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info_insert",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info_normal",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info_visual",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn_insert",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn_normal",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn_visual",     { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error_insert",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error_normal",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error_visual",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint_command",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint_replace",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info_command",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info_replace",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn_command",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn_replace",    { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error_command",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error_replace",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint_inactive",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint_terminal",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info_inactive",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info_terminal",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn_inactive",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn_terminal",   { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error_inactive",  { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })
-- vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error_terminal",  { bg = "NONE", fg = "#FFFFFF", bold = false, italic = false })

