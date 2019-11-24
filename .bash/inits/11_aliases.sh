#!/bin/bash

# Kali
alias kali='docker run -it -v ~/Development:/root/Development -v ~/.ssh:/root/.ssh kali:latest'

# History
alias h="history"

# Grep
alias g="grep"

# Source
alias reload="source ~/.bashrc"

# List
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G -h"
  ;;
linux*)
  alias ls='ls --color -h'
  ;;
esac

# open
if [ -e "$__CHEST/node_modules/.bin/open-cli" ]; then
  alias open="$__CHEST/node_modules/.bin/open-cli"
fi

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

# Clinic
if [ -e "$__CHEST/node_modules/.bin/clinic" ]; then
  alias clinic="$__CHEST/node_modules/.bin/clinic"
fi

# Alert
if [ -e "$__CHEST/node_modules/.bin/alert" ]; then
  alias alert="$__CHEST/node_modules/.bin/alert"
fi

# Core validate commit
if [ -e "$__CHEST/node_modules/.bin/core-validate-commit" ]; then
  alias core-validate-commit="$__CHEST/node_modules/.bin/core-validate-commit"
fi

# gtop
if [ -e "$__CHEST/node_modules/.bin/gtop" ]; then
  alias gtop="$__CHEST/node_modules/.bin/gtop"
fi

# gitignore
if [ -e "$__CHEST/node_modules/.bin/gitignore" ]; then
  alias gitignore="$__CHEST/node_modules/.bin/gitignore"
fi

# tldr
if [ -e "$__CHEST/node_modules/.bin/tldr" ]; then
  alias tldr="$__CHEST/node_modules/.bin/tldr"
fi

# cowsay
if [ -e "$__CHEST/node_modules/.bin/cowsay" ]; then
  alias cowsay="$__CHEST/node_modules/.bin/cowsay"
fi

# cowthink
if [ -e "$__CHEST/node_modules/.bin/cowsay" ]; then
  alias cowthink="$__CHEST/node_modules/.bin/cowthink"
fi

alias clang-omp='/usr/local/opt/llvm/bin/clang -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
alias clang-omp++='/usr/local/opt/llvm/bin/clang++ -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
