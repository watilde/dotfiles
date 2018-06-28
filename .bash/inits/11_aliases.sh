#!/bin/bash

# List
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls='ls --color'
  ;;
esac

# Rm
if [ -e "$__CHEST/node_modules/.bin/trash" ]; then
  alias rm="$__CHEST/node_modules/.bin/trash"
fi

# Server
if [ -e "$__CHEST/node_modules/.bin/http-server" ]; then
  alias server="$__CHEST/node_modules/.bin/http-server"
fi

# Chest
if [ -e "$__CHEST/node_modules/.bin/chest" ]; then
  alias chest="$__CHEST/node_modules/.bin/chest"
fi

# Emoji
if [ -e "$__CHEST/node_modules/.bin/emoji" ]; then
  alias emoji="$__CHEST/node_modules/.bin/emoji"
fi

# Core validate commit
if [ -e "$__CHEST/node_modules/.bin/core-validate-commit" ]; then
  alias core-validate-commit="$__CHEST/node_modules/.bin/core-validate-commit"
fi

# citgm
if [ -e "$__CHEST/node_modules/.bin/citgm" ]; then
  alias citgm="$__CHEST/node_modules/.bin/citgm"
fi

# gtop
if [ -e "$__CHEST/node_modules/.bin/gtop" ]; then
  alias gtop="$__CHEST/node_modules/.bin/gtop"
fi

alias clang-omp='/usr/local/opt/llvm/bin/clang -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
alias clang-omp++='/usr/local/opt/llvm/bin/clang++ -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
