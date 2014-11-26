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
Bundle "tomtom/tcomment_vim"
Bundle "majutsushi/tagbar"
Bundle "AndrewRadev/splitjoin.vim"
Bundle "Raimondi/delimitMate"
Bundle "Shougo/neocomplete.vim"
Bundle 'Shougo/neosnippet'

" Rails
Bundle "ecomba/vim-ruby-refactoring"
Bundle "tpope/vim-rails.git"
Bundle "tpope/vim-rake.git"
Bundle "tpope/vim-rvm.git"
Bundle "vim-ruby/vim-ruby.git"
Bundle "Keithbsmiley/rspec.vim"
Bundle "skwp/vim-iterm-rspec"
Bundle "skwp/vim-spec-finder"
Bundle "ck3g/vim-change-hash-syntax"
Bundle "tpope/vim-bundler"

" git
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"

" navigation
Bundle "rking/ag.vim"
Bundle "vim-scripts/IndexedSearch"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree.git"
Bundle "jistr/vim-nerdtree-tabs.git"

" language
Bundle "fatih/vim-go"

" tmux_integration
Bundle "christoomey/vim-tmux-navigator"

" Util
Bundle 'rav1ko/neosnippet-snippets'
