if &compatible
  set nocompatible " Be iMproved
endif

if &compatible
  set nocompatible
endif

" Require:
set runtimepath+=~/.vim/packages/dein.vim/

" Start:
call dein#begin(expand('~/.vim/packages/'))


" My Bundles here:
call dein#add('briancollins/vim-jst')
call dein#add('groenewege/vim-less')
call dein#add('Shougo/unite.vim.git')
call dein#add('h1mesuke/vim-alignta.git')
call dein#add('mxw/vim-jsx.git')

" End:
call dein#end()

" Install:
" call dein#install()

filetype plugin indent on
syntax enable
