"" 基本設定
set nowrap                     " 回り込みなし
set nocompatible               " vi互換なし
set scrolloff=5                " スクロール時の余白確保
set nobackup                   " バックアップ取らない
set autoread                   " 他で書き換えられたら自動で読み直す
set noswapfile                 " スワップファイル作らない
set hidden                     " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions=lmoq         "
" テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                   " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set showcmd                    " コマンドをステータス行に表示
set showmode                   " 現在のモードを表示
set modelines=0                " モードラインは無効
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2
" ファイルタイプ判定をon
filetype plugin on

"" 表示
set showmatch                                     " 括弧の対応をハイライト
set number                                        " 行番号表示
set list                                          " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex                                  " 印字不可能文字を16進数で表示
" 全角スペースの表示
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/
" カーソル行をハイライト
set cursorline
syntax on

"" インデント
set autoindent    " 自動でインデント
" set paste         " ペースト時にautoindentを無効に
set smartindent   " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set tabstop=2    " タブ表示幅
set shiftwidth=2 " インデント幅
set expandtab
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  " そのファイルタイプにあわせたインデントを利用する
  filetype indent on
endif

"" エンコーディング
set ffs=unix " 改行文字
set encoding=utf-8   " デフォルトエンコーディング

"" ステータスライン
" 常にステータスラインを表示
set laststatus=2
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
