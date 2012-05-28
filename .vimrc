"
" neobundle init
"
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/neobundle/'))
endif
filetype plugin on
filetype indent on

" Bundle
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'

"
" unite.vim
"
let g:unite_enable_start_insert=1       " Insert Mode at starting
let g:unite_enable_split_vertically = 1 " Split Vertically
"buffer一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :Unite file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

"
" 基本設定
"
set nocompatible " vi互換なし
set scrolloff=5 " スクロール時の余白確保
set nobackup " バックアップ取らない
set autoread " 他で書き換えられたら自動で読み直す
set noswapfile " スワップファイル作らない
set hidden " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions=lmoq " テキスト整形オプション，マルチバイト系を追加
set vb t_vb= " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止まらないようにする
set showcmd " コマンドをステータス行に表示
set showmode " 現在のモードを表示
set modelines=0 " モードラインは無効
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2
" ファイルタイプ判定をon
filetype plugin on

"
" ステータスライン
"
set laststatus=2 " 常にステータスラインを表示
"カーソルが何行目の何列目に置かれているかを表示する
set ruler
"ステータスラインに文字コードと改行文字を表示する
if winwidth(0) >= 120
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif
" ステータスラインのカラー
highlight StatusLine ctermfg=green ctermbg=black
"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine ctermfg=lightblue ctermbg=black
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

"
" 表示
"
set showmatch " 括弧の対応をハイライト
set number " 行番号表示
set list " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex " 印字不可能文字を16進数で表示
" 全角スペースの表示
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline
syntax on

"
" インデント
"
set autoindent " 自動でインデント
set paste " ペースト時にautoindentを無効に
set smartindent " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
if has("autocmd")
"ファイルタイプの検索を有効にする
filetype plugin on
" そのファイルタイプにあわせたインデントを利用する
filetype indent on
" これらのftではインデントを無効に
autocmd FileType php filetype indent off
autocmd FileType html :set indentexpr=
autocmd FileType xhtml :set indentexpr=
endif

"
" エンコーディング
"
set ffs=unix,dos,mac " 改行文字
set encoding=utf-8 " デフォルトエンコーディング
" 文字コード関連
" from ずんWiki http://www.kawaz.jp/pukiwiki/?vim#content_1_7
" 文字コードの自動認識
if &encoding !=# 'utf-8'
set encoding=japan
set fileencoding=japan
endif
if has('iconv')
let s:enc_euc = 'euc-jp'
let s:enc_jis = 'iso-2022-jp'
" iconvがeucJP-msに対応しているかをチェック
if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'eucjp-ms'
let s:enc_jis = 'iso-2022-jp-3'
" iconvがJISX0213に対応しているかをチェック
elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'euc-jisx0213'
let s:enc_jis = 'iso-2022-jp-3'
endif
" fileencodingsを構築
if &encoding ==# 'utf-8'
let s:fileencodings_default = &fileencodings
let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
let &fileencodings = &fileencodings .','. s:fileencodings_default
unlet s:fileencodings_default
else
let &fileencodings = &fileencodings .','. s:enc_jis
set fileencodings+=utf-8,ucs-2le,ucs-2
if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
set fileencodings+=cp932
set fileencodings-=euc-jp
set fileencodings-=euc-jisx0213
set fileencodings-=eucjp-ms
let &encoding = s:enc_euc
let &fileencoding = s:enc_euc
else
let &fileencodings = &fileencodings .','. s:enc_euc
endif
endif
" 定数を処分
unlet s:enc_euc
unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
function! AU_ReCheck_FENC()
if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
let &fileencoding=&encoding
endif
endfunction
autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
set ambiwidth=double
endif
" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs :set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType xml :set fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932
