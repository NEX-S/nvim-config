
vim.keymap.set('i', "<C-v>", function ()
    local images_folder = vim.fn.expand("%:p:h") .. "/images/"

    local images_name = vim.fn.input('Image Name: ')

    if images_name == '' then
        images_name = os.date('%F_%H:%M') .. '.png'
    end

    local images_path = images_folder .. images_name

    vim.fn.system("mkdir ".. images_folder)
    vim.fn.system("mv ~/Pictures/Screenshots/Screenshot* " .. images_path)

    vim.cmd("normal!i<img height=150 src=\"./images/" .. images_name .. "\" />")
end, { noremap = true, silent = true })
