" Line numbers
set number

set mouse+=a

" Ignore case in search
set ignorecase!

" Only hide buffers when changing between them;
" this way we can keep their undo histories.
set hidden

" Automatically strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

set cmdheight=2

set wildmenu
set hlsearch

set cursorline


" Auto sizing active window
" https://www.destroyallsoftware.com/file-navigation-in-vim.html
" Set active window width to 84
"set winwidth=84
"set winminwidth=50
" Set min window height to 5
"set winheight=15
"set winminheight=15
"set winheight=999



" Location List Mappings
nnoremap <leader>ll :lw<CR>
nnoremap <leader>ln :lne<CR>
nnoremap <leader>lp :lp<CR>

" Print current file path
command! Path echo @%

" Use ,y to copy to clipboard
vnoremap <leader>y "*y

