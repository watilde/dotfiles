if &compatible
  set nocompatible " Be iMproved
endif

" Require:
set runtimepath+=~/.vim/packages/dein.vim/

" Start:
call dein#begin(expand('~/.vim/packages/'))


" My Bundles here:
call dein#add('leafgarland/typescript-vim')
call dein#add('maxmellon/vim-jsx-pretty')
call dein#add('groenewege/vim-less')
call dein#add('Shougo/unite.vim.git')
call dein#add('h1mesuke/vim-alignta.git')

" End:
call dein#end()

" Install:
" call dein#install()

filetype plugin indent on
syntax enable
