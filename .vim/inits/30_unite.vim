"" Unite.vim
set modifiable

" Insert Mode at starting
let g:unite_enable_start_insert=1

" Split Vertically
let g:unite_enable_split_vertically=1

" Buffer list
noremap <C-U><C-B> :Unite buffer<CR>

" File list
noremap <C-U><C-F> :Unite file<CR>

" Recent used file
noremap <C-U><C-R> :Unite file_mru<CR>

" Press ESC twice to end
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
