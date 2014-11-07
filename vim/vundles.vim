"========================================
"" Vim plugin configuration
"========================================
"
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/ "Submodules
call vundle#rc()
" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"
" Filetype plugin indent on is required by vundle
filetype plugin indent on
