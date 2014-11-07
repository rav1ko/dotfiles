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

" appearance
Bundle "altercation/vim-colors-solarized"
Bundle "itchyny/lightline.vim"

" enhancements
Bundle "scrooloose/syntastic.git"
Bundle "sjl/gundo.vim"
Bundle "godlygeek/tabular"
Bundle "jamessan/vim-gnupg"

" git
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"

" navigation
Bundle "rking/ag.vim"
Bundle "vim-scripts/IndexedSearch"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree.git"
Bundle "jistr/vim-nerdtree-tabs.git"

" tmux_integration
Bundle "christoomey/vim-tmux-navigator"
