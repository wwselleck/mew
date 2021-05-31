"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Navigation
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" jk -> leave insert mode
" <c-j/k/h/l> -> navigate windows
" tl -> next tab
" th -> prev tab
" mh -> Move buffer to prev tab
"
"""""""""""""""""""""""""""""""""""""""
"https://github.com/neovim/neovim/issues/2048
if exists(':tnoremap')
    nmap <BS> <C-W>h
end


" Allow use of jk to leave insert mode
inoremap jk <Esc>
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
end

"Move vertically buy visual line instead of real line
nnoremap j gj
nnoremap k gk

" Use ctrl+[hjkl] to navigate windows
if exists(':tnoremap')
    tnoremap <c-j> <c-\><c-n><c-w>j
    tnoremap <c-k> <c-\><c-n><c-w>k
    tnoremap <c-h> <c-\><c-n><c-w>h
    tnoremap <c-l> <c-\><c-n><c-w>l
end
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Easy tab moving
nnoremap tl :tabn<CR>
nnoremap th :tabp<CR>

" Use mh to move tab into prev tab
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

nnoremap mh :call MoveToPrevTab()<CR>
" I CAN HAZ NORMAL REGEXES?
nnoremap / /\v
vnoremap / /\v
