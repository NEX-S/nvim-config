
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

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function ()
        vim.cmd "source <afile> | PackerSync"
    end
})

-- FIX: Fold Dont Work After Telescope Open File
vim.cmd "autocmd BufRead * autocmd BufWinEnter * ++once normal! zxzR"
