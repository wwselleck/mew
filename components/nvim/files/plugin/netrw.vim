"-------------------
" Netrw
"-------------------
"
" http://stackoverflow.com/questions/14367440/map-e-to-explore-in-command-mode
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>
nmap <leader>n :E <CR>
nmap <leader>j :e %:h <CR>

"http://ellengummesson.com/blog/2014/02/22/make-vim-really-behave-like-netrw/
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.*\.swp*$,.*\.swo*$'
