
""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Neovim
""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Neovim interactive substitution
set inccommand=nosplit

" https://github.com/mhinz/neovim-remote#typical-use-cases
" When in neovim, use nvr to open nested neovim instances
"
" The new buffer must be DELETED for the remote-wait in the
" creating terminal to be triggered. Using bd, not q.
" https://github.com/mhinz/neovim-remote/issues/19
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Neovim Terminal
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" ,ts -> Split and term
" ,tv -> Vsplit and term
"
"""""""""""""""""""""""""""""""""""""""

" <leader>ts to create horizontal split terminal, <leader>tv for vertical
nnoremap <leader>ts :sp <CR> <c-w>j <ESC> :term <CR>
nnoremap <leader>tv :vsp <CR> <c-w>l <ESC> :term <CR>

" Go into insert mode when entering a terminal buffer
"autocmd BufWinEnter,WinEnter term://* startinsert
