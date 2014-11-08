" easy window splits
set splitbelow
set splitright

nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" open help in vsplit
"command -nargs=* -complete=help Help vertical belowright help <args>

" command fast mode
nore ; :

" markdown preview
nmap <Leader>p :call Preview_md()<CR>

" reload vim
nmap <Leader>r :source $MYVIMRC<CR>

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

" NERDTree
map <F2> :NERDTreeToggle<CR>

"==================================================
" File specific keymaps
"==================================================
augroup filetype_ruby
  autocmd!
  autocmd FileType ruby imap <c-l> =><space>
  autocmd FileType ruby set shiftwidth=2
  autocmd FileType ruby set softtabstop=2
  autocmd FileType ruby set tabstop=2
augroup END

augroup filetype_md
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

augroup filetype_python
  autocmd!
augroup END

augroup filetype_go
  autocmd!
augroup END

augroup filetype_c
  autocmd!
augroup END

augroup filetype_asm
  autocmd!
  autocmd BufRead,BufNewFile *.s,*.S,*.asm set shiftwidth=8
  autocmd BufRead,BufNewFile *.s,*.S,*.asm set softtabstop=8
  autocmd BufRead,BufNewFile *.s,*.S,*.asm set tabstop=8
augroup END

augroup Binary
  au!
  au BufReadPre *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END
