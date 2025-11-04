set nocompatible
set guifont=Courier_New:h9:cANSI
set expandtab
set tabstop=4
set shiftwidth=4
set noincsearch 
set encoding=utf8
set backupdir=$HOME/.vim-backup-dir
set directory=$HOME/.vim-backup-dir
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif 
autocmd BufEnter *  lcd %:p:h 
syn on


let mapleader = "\\"
nnoremap <silent> <leader>jp :%!json_pp<CR>:write<CR>
