
require "noice".setup {
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
            cmdline = { icon = "" },
            help = { icon = "" },
            search_up = { icon = "" },
            search_down = { icon = "" },
        },
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
