"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Language Features
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
"  Normal mode
"  gd -> Go to definition (coc)
"  gy -> Go to type definition (coc)
"  gi -> Go to implementation (coc)
"  gr -> List references (coc)
"  gn -> Go to next diagnostic (coc)
"  gp -> Go to prev diagnostic (coc)
"  K -> Show documentation (coc)
"  <space>a -> List diagnostics (coc)
"  <space>c -> List coc commands (coc)
"  <space>o -> Show symbol outline (coc)
"  <space>s -> Search workspace symbols (coc)
"  <space>p -> Show previous COC list (coc)
"
"  Insert mode
"  <c-l> -> Expand snippet completion
"  <c-j> -> Move to next placeholder in snippet
"  <c-k> -> Move to prev placeholder in snippet
"""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-css', 'coc-html', 'coc-pyls', 'coc-prettier', 'coc-eslint', 'coc-stylelintplus']

" https://github.com/neoclide/coc.nvim/blob/master/Readme.md
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nnoremap <silent> K :call <SID>show_documentation()<CR>
command! -nargs=0 Rename :call CocActionAsync('rename')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> <space>n  :<C-u>CocListResume<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)

command! -nargs=0 Prettier :CocCommand prettier.formatFile


"-------------------
" Ale
"
" Should only be used for linting & lint fixing, not type info
"-------------------

" Disable linters that conflict with coc.nvim
let g:ale_linters = {
\    'javascript': [],
\    'typescript': [],
\    'html': [],
\    'css': []
\}

let g:ale_fixers = {
\    'javascript': [],
\    'typescript': [],
\}
let g:ale_fix_on_save = 1

" https://github.com/w0rp/ale/issues/1413
" :ALEDisable does not disable fixers, these commands do
command! DisableFixers       let g:ale_fix_on_save=0
command! EnableFixers        let g:ale_fix_on_save=1
command! DisableFixersBuffer let b:ale_fix_on_save=0
command! EnableFixersBuffer  let b:ale_fix_on_save=0

highlight ALEError ctermbg=white
highlight ALEWarning ctermbg=white









