
local dir = vim.fn.expand("%:p:h")
local fileName = vim.fn.expand("%:t")
local fileNameWithoutExt = vim.fn.expand("%:t:r")

local gdb_cmd = "sudo lldb ./bin/" .. fileNameWithoutExt
local compile_cmd = "clang -std=gnu2x -I ./ -g "..fileName.." -o ./bin/"..fileNameWithoutExt

local function GDB_DEBUG ()
    vim.cmd "w"
    vim.cmd "vs"
    vim.cmd ":normal! <C-w>l"

    vim.fn.system("cd "..dir)
    vim.fn.system(compile_cmd)

    vim.cmd ("term " .. gdb_cmd)
    vim.cmd "startinsert"
end

vim.api.nvim_create_user_command("LLDB", GDB_DEBUG, {})
