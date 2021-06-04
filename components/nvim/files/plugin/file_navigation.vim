"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" File Navigation
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" :Finder -> Open current file in Finder
" ,n -> Toggle file browser (netrw)
" ,j -> Find current file in file browser (netrw)
" ,ff -> Fuzzy search files (FZF)
" ,fa -> Fuzzy search lines (FZF)
" ,fl -> Fuzzy search lines in buffer (FZF)
" ,fb -> Fuzzy search buffers (FZF)
" ,fh -> Fuzzy search file history (FZF)
" ,fc -> Fuzzy search command history (FZF)
"""""""""""""""""""""""""""""""""""""""

command! Finder silent exe '!open ' . expand("%:p:h")

"-------------------
" FZF
"-------------------
"let g:fzf_height = '30%'
let g:fzf_layout = { 'down': '~30%', 'window': { 'width': 0.9, 'height': 0.6 } }
autocmd VimEnter * nmap <leader>ff :Files<CR>
autocmd VimEnter * nmap <leader>fg :GFiles<CR>
autocmd VimEnter * nmap <leader>fa :Rg<CR>
autocmd VimEnter * nmap <leader>fl :BLines<CR>
autocmd VimEnter * nmap <leader>fb :Buffers<CR>
autocmd VimEnter * nmap <leader>fh :History<CR>
autocmd VimEnter * nmap <leader>fc :History:<CR>

autocmd VimEnter * nnoremap <Leader>e :Grepper<CR>
autocmd VimEnter * let g:grepper.tools = ['rg']
autocmd VimEnter * let g:grepper.rg.grepprg .= ' --hidden'


" "-------------------
" " NERDTree
" "-------------------
" "-------------------
"
" " <leader>n opens nerd tree
" nmap <leader>n :NERDTreeToggle<CR>
" " <leader>j opens current file in tree
" nmap <leader>j :NERDTreeFind<CR>
" " Show hidden files by default
" let NERDTreeShowHidden=1
"
" " Start NERDTree on start when no file given
" "autocmd StdinReadPre * let s:std_in=1
" "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" " Destroy <c-j> and <c-k> mappings, mapped below
" " http://stackoverflow.com/questions/38599147/how-to-disable-a-nerdtree-mapping-that-conflicts-with-a-custom-mapping
" let g:NERDTreeMapJumpNextSibling = ''
" let g:NERDTreeMapJumpPrevSibling = ''
