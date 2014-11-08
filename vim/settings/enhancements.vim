"==================================================
" Syntastic
"==================================================
"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0

"show the error list automatically
let g:syntastic_auto_loc_list=1

"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

" inlcude avr and libraries
let g:syntastic_c_include_dirs = ['/usr/avr/include']

"==================================================
" NerdTree
"==================================================
" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" Auto open nerd tree if no files were specified
function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction

autocmd VimEnter * call StartUp()

set splitright
set splitbelow

"==================================================
" No trailing whitespace
"==================================================
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
