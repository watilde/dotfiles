#!/bin/bash

# Emacs
if [ -e '/Applications/Emacs.app' ]; then
  alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
  alias emacs.app='/Applications/Emacs.app/Contents/MacOS/Emacs'
fi

# Vim
if [ -e '/Applications/MacVim.app' ]; then
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias vim.app='/Applications/MacVim.app/Contents/MacOS/MacVim'
fi

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls='ls --color'
  ;;
esac
