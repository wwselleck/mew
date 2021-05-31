"-------------------
" General
"-------------------

"https://unix.stackexchange.com/questions/62464/vim-making-xml-text-pretty
command! -nargs=0 XMLFormat :%!xmllint --format %

"-------------------
" Javascript Specific
"-------------------
autocmd FileType javascript setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2
let g:javascript_plugin_jsdoc = 1
let g:flow#autoclose = 1

"-------------------
" Coffeescript Specific
"-------------------
autocmd FileType coffee setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2

"-------------------
" Typescript Specific
"-------------------
autocmd FileType typescript setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2
autocmd FileType typescript.tsx setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2
autocmd FileType typescript.jsx setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2

nnoremap <leader>tp :TSDefPreview
nnoremap <leader>td :TSDoc

"-------------------
" GraphQl Specific
"-------------------
autocmd FileType graphql setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2

"-------------------
" C  Specific
"-------------------
autocmd FileType c setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2

"-------------------
" Python  Specific
"-------------------
" We like spaces; avoid tabs
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4

" Remind ourselves to keep Python code to < 80 cols
"autocmd FileType python setlocal colorcolumn=80
" Omnifunc for python
autocmd FileType python set omnifunc=pythoncomplete#Complete

"-------------------
" Crystal  Specific
"-------------------
autocmd FileType crystal set shiftwidth=2 expandtab tabstop=2 softtabstop=2

"-------------------
" LESS Specific
"-------------------
autocmd FileType less set shiftwidth=2 expandtab tabstop=2 softtabstop=2



