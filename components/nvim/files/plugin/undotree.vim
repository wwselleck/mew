"-------------------
" undotree
"
" ,u -> Toggle undotree
"-------------------
nnoremap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif



