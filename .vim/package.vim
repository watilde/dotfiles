" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/packages/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/packages/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'briancollins/vim-jst'
NeoBundle 'groenewege/vim-less'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/neocomplcache.vim.git'
NeoBundle 'h1mesuke/vim-alignta.git'
NeoBundle 'mxw/vim-jsx.git'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
