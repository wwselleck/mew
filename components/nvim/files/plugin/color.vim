"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Ayu
let ayucolor="dark"   " for dark version of theme

" Gruvbox
let g:gruvbox_contrast_dark='hard'

" Nord
let g:nord_comment_brightness=20

" This stuff being below the per-colorscheme config
" actually matters, sometimes. Try moving gruvbox constract option below
" and see what happens.

"set t_Co=256
syntax on
" http://stackoverflow.com/questions/4325682/vim-colorschemes-not-changing-background-color
set termguicolors

" This setting affects certain colorschemes (e.g. gruvbox) that have both
" light and dark variations
set background=dark

colorscheme bogster

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Using lightline instead
"set statusline=%M%R%l/%L\,%c:\%F

"-------------------
" Rainbow Brackets plugin
" -------------------
let g:rainbow_active = 1
