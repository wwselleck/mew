" File ~/.nvimrc

"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" <leader>
let mapleader = ","

"""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin(stdpath('data') . '/plugged')
runtime! third_party_plugins.vim
call plug#end()

