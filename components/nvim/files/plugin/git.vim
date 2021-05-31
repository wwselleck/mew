
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Git
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" ,gs -> Git status (fugitive)
"   g? -> Show help
"   -  -> Stage/Reset file
"   cc -> Commit
"   ca -> Commit w/ amend
"   dv -> Gvdiff
"   r  -> Reload status
"   U  -> Checkout file
"
" ,gd -> Git diff
"
" ,hs -> Stage hunk (git-gutter)
" ,hu -> Undo hunk (git-gutter)
"""""""""""""""

"-------------------
" vim-fugitive
"-------------------
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
