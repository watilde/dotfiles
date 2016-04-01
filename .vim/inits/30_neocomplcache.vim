"" Neocomplcache.vim
" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1

" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1

" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3

" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
