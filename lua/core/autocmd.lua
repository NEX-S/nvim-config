
vim.cmd "autocmd!"

-- Switch input method --
local input_status
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = { "*" },
    callback = function ()
        input_status = tonumber(vim.fn.system("fcitx5-remote"))
        if input_status == 2 then
            vim.fn.system("fcitx5-remote -c")
        end
    end
})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = { "*" },
    callback = function ()
        if input_status == 2 then
            vim.fn.system("fcitx5-remote -o")
        end
    end
})

-- Auto mkdir while save --
local function auto_mkdir ()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, 'p')
    end
end

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     pattern = { "c" },
--     callback = function ()
--         vim.keymap.set('n', '<C-d>',
--             '<CMD>w<CR><CMD>!cd %:p:h && clang %:t -I ./ -g -o ./bin/%:t:r -Wall<CR>:DapContinue<CR>',
--             { noremap = true, silent = true }
--         )
--     end
-- })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function ()
        auto_mkdir()
    end
})

vim.cmd "autocmd BufRead, BufWinEnter *.http ++once <CMD>set ft=http<CR>"

-- vim.api.nvim_create_autocmd({ "BufRead", "BufEnter", "BufNewFile", "TabEnter" }, {
--     pattern = { "*" },
--     callback = function ()
--         vim.keymap.set('n', ';r', '<CMD>w | RunCode<CR>', { noremap = true, silent = true })
--     end
-- })

-- vim.api.nvim_create_autocmd({ "BufRead", "BufEnter", "BufNewFile", "TabEnter" }, {
--     pattern = { "init.lua", "keymaps.lua", "options.lua", "autocmd.lua", },
--     callback = function ()
--         vim.keymap.set('n', ';r', '<CMD>w | source $MYVIMRC | source %<CR>', { noremap = true, silent = true })
--     end
-- })

-- FIX: Fold Dont Work After Telescope Open File
-- vim.cmd "autocmd BufRead, BufWinEnter * ++once normal! zxzR"

-- vim.api.nvim_create_autocmd({ "CursorMoved"}, {
--     pattern = { '*' },
--     callback = function ()
--         print("Hello")
--     end
-- })
