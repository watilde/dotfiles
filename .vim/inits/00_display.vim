"" basic
set nowrap
set scrolloff=5
set nobackup
set autoread
set noswapfile
set hidden
set backspace=indent,eol,start
set formatoptions=lmoq
set vb t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set showcmd
set showmode
set modelines=0

"" mouse
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" Syntax
set spell

"" display some meta infos
set showmatch
set number
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<
set display=uhex

" display DoubleSpace
highlight link DoubleSpace Error
match DoubleSpace /　/
set cursorline

"" indent
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"" encoding
set ffs=unix
set encoding=utf-8

"" status line
set laststatus=2

"" ruler
set ruler

if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

highlight StatusLine ctermfg=green ctermbg=black

augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine ctermfg=white ctermbg=black
  autocmd InsertLeave * highlight StatusLine ctermfg=green ctermbg=black
augroup END

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction

" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc
