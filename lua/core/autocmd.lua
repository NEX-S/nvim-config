
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

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function ()
        auto_mkdir()
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter", "BufNewFile", "TabEnter" }, {
    pattern = { "*.python", "*.php", "*.c", "*.html", "*.sh", "*.lua" },
    callback = function ()
        vim.keymap.set('n', ';r', '<CMD>RunCode<CR>', { noremap = true, silent = true })
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter", "BufNewFile", "TabEnter" }, {
    pattern = { "*.http" },
    callback = function ()
        vim.keymap.set('n', ';r', '<CMD>lua require "rest-nvim".run()<CR>', { noremap = true, silent = true })
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter", "BufNewFile", "TabEnter" }, {
    pattern = { "init.lua", "keymaps.lua", "options.lua", "autocmd.lua", "*.vim" },
    callback = function ()
        vim.keymap.set('n', ';r', '<CMD>w | source $MYVIMRC | source %<CR>', { noremap = true, silent = true })
    end
})

-- FIX: Fold Dont Work After Telescope Open File
-- vim.cmd "autocmd BufRead * autocmd BufWinEnter * ++once normal! zxzR"

-- vim.api.nvim_create_autocmd({ "CursorMoved"}, {
--     pattern = { '*' },
--     callback = function ()
--         print("Hello")
--     end
-- })
