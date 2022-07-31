
nnoremap <silent><buffer> <C-d> <CMD>w<CR><CMD>!cd %:p:h && clang %:t -I ./ -g -o ./bin/%:t:r -Wall<CR>:DapContinue<CR>

