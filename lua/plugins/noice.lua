
require "noice".setup {
    views = {
        cmdline_popup = {
            border = {
                style = "none",
                padding = { 0, 0 },
            },
            position = {
                row = 3,
                col = "50%",
            },
            size = {
                width = 90,
                height = 1,
            }
        }
    },
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
            cmdline     = { icon = " " },
            help        = { icon = " " },
            search_up   = { icon = " " },
            search_down = { icon = " " },
        },
    },
    messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    lsp = {
        hover = {
            enabled = false
        },
        signature = {
            enable = false,
            auto_open = true,
        }
    }
}

vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "NONE", fg = "NONE", bold = true })

require "notify".setup {
    fps = 60,
    render = "minimal",
    icons = {
        WARN  = "",
        INFO  = "",
        ERROR = "",
        TRACE = "",
        DEBUG = "",
    },
    minimum_width = 50,
    stages = "fade",
    timeout = 3000,
    top_down = true,
    background_colour = "Normal",
}

-- NoiceCmdline
-- NoiceCmdlineIcon
-- NoiceCmdlineIconCmdline
-- NoiceCmdlineIconFilter
-- NoiceCmdlineIconHelp
-- NoiceCmdlineIconIncRename
-- NoiceCmdlineIconInput
-- NoiceCmdlineIconLua
-- NoiceCmdlineIconSearch
-- NoiceCmdlinePopup
-- NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderCmdline
-- NoiceCmdlinePopupBorderFilter
-- NoiceCmdlinePopupBorderHelp
-- NoiceCmdlinePopupBorderIncRename
-- NoiceCmdlinePopupBorderInput
-- NoiceCmdlinePopupBorderLua
-- NoiceCmdlinePopupBorderSearch
-- NoiceCmdlinePrompt
-- NoiceCompletionItemKindClass
-- NoiceCompletionItemKindColor
-- NoiceCompletionItemKindConstant
-- NoiceCompletionItemKindConstructor
-- NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindEnum
-- NoiceCompletionItemKindEnumMember
-- NoiceCompletionItemKindField
-- NoiceCompletionItemKindFile
-- NoiceCompletionItemKindFolder
-- NoiceCompletionItemKindFunction
-- NoiceCompletionItemKindInterface
-- NoiceCompletionItemKindKeyword
-- NoiceCompletionItemKindMethod
-- NoiceCompletionItemKindModule
-- NoiceCompletionItemKindProperty
-- NoiceCompletionItemKindSnippet
-- NoiceCompletionItemKindStruct
-- NoiceCompletionItemKindText
-- NoiceCompletionItemKindUnit
-- NoiceCompletionItemKindValue
-- NoiceCompletionItemKindVariable
-- NoiceCompletionItemMenu
-- NoiceCompletionItemWord
-- NoiceConfirm
-- NoiceConfirmBorder
-- NoiceCursor
-- NoiceFormatConfirm
-- NoiceFormatConfirmDefault
-- NoiceFormatDate
-- NoiceFormatEvent
-- NoiceFormatKind
-- NoiceFormatLevelDebug
-- NoiceFormatLevelError
-- NoiceFormatLevelInfo
-- NoiceFormatLevelOff
-- NoiceFormatLevelTrace
-- NoiceFormatLevelWarn
-- NoiceFormatProgressDone
-- NoiceFormatProgressTodo
-- NoiceFormatTitle
-- NoiceLspProgressClient
-- NoiceLspProgressSpinner
-- NoiceLspProgressTitle
-- NoiceMini
-- NoicePopup
-- NoicePopupBorder
-- NoicePopupmenu
-- NoicePopupmenuBorder
-- NoicePopupmenuMatch
-- NoicePopupmenuSelected
-- NoiceScrollbar
-- NoiceScrollbarThumb
-- NoiceSplit
-- NoiceSplitBorder
-- NoiceVirtualTe
