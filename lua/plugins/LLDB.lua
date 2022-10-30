
local dir = vim.fn.expand("%:p:h")
local fileName = vim.fn.expand("%:t")
local fileNameWithoutExt = vim.fn.expand("%:t:r")

local compile_cmd = "clang -std=gnu2x -I ./ -g " .. fileName .. " -o ./bin/" .. fileNameWithoutExt
local asm_create = "clang -std=gnu2x -I ./ -g -S ".. fileName .. " -o ./bin/" .. fileNameWithoutExt .. ".asm"

local function LLDB_DEBUG ()
    vim.cmd "w"

    vim.fn.system("cd "..dir)
    vim.fn.system(compile_cmd)

    vim.cmd("vs term://fish -c 'sudo lldb ./bin/" .. fileNameWithoutExt .. "'")
    vim.cmd "startinsert!"
    vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
end

local function ASM_CHECK ()
    vim.cmd "w"

    vim.fn.system("cd "..dir)
    vim.fn.system(asm_create)

    vim.cmd(":vs ./bin/" .. fileNameWithoutExt .. ".asm")
end

vim.api.nvim_create_user_command("LLDB", LLDB_DEBUG, {})
vim.api.nvim_create_user_command("ASMCHECK", ASM_CHECK, {})
