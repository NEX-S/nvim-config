
local dir = vim.fn.expand("%:p:h")
local fileName = vim.fn.expand("%:t")
local fileNameWithoutExt = vim.fn.expand("%:t:r")

local gdb_cmd = "sudo lldb ./bin/" .. fileNameWithoutExt
local compile_cmd = "clang -std=gnu2x -I ./ -g " .. fileName .. " -o ./bin/" .. fileNameWithoutExt
local asm_create = "clang -std=gnu2x -I ./ -g -S ".. fileName .. " -o ./bin/" .. fileNameWithoutExt .. ".asm"

local function LLDB_DEBUG ()
    vim.cmd "w"
    vim.cmd "vs"
    vim.cmd ":normal! <C-w>l"

    vim.fn.system("cd "..dir)
    vim.fn.system(compile_cmd)

    vim.cmd ("term " .. gdb_cmd)
    vim.cmd "startinsert"
end

local function ASM_CHECK ()
    vim.cmd "w"

    vim.fn.system("cd "..dir)
    vim.fn.system(asm_create)

    -- vim.cmd (":vs " .. fileNameWithoutExt .. ".asm")
    vim.cmd(":vs ./bin/" .. fileNameWithoutExt .. ".asm")
    -- vim.cmd ":normal! <C-w>l"
end

vim.api.nvim_create_user_command("LLDB", LLDB_DEBUG, {})
vim.api.nvim_create_user_command("ASMCHECK", ASM_CHECK, {})
