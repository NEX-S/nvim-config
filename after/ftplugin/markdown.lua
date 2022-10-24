
vim.keymap.set('i', '<C-v>', function ()
    local folder_path = vim.fn.expand("%:p:h") .. "/images/"

    local default_name =  os.date('%F_%H:%M') .. '.png'
    local images_name = vim.fn.input('Image Name: ', default_name)
    local images_path = folder_path .. images_name

    vim.fn.system("mkdir ".. folder_path)
    vim.fn.system("mv ~/Pictures/Screenshots/Screenshot* " .. images_path)
    -- vim.fn.system('rm ~/Pictures/Screenshots/Screenshot*.png -f')
    vim.cmd("normal!i<img height=150 src=\"./images/" .. images_name .. "\" />")
end,
{ noremap = true, silent = true })
