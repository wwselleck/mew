"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Utility
""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
function! ProfileStart()
  exe "profile start /tmp/vim-profile.log"
  exe "profile func *"
  exe "profile file *"
endfunc

function! ProfileStop()
  exe "profile pause"
  exe "noautocmd qall!"
endfunc

