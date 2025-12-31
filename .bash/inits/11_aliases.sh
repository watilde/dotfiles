#!/bin/bash

# Helper function to define an alias if the command exists in node_modules
_def_alias() {
  local bin_path="$__CHEST/node_modules/.bin/$1"
  local alias_name="$2"
  if [ -e "$bin_path" ]; then
    alias "$alias_name"="$bin_path"
  fi
}

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

# Node-based command aliases
_def_alias "trash" "rm"
_def_alias "http-server" "server"
_def_alias "chest" "chest"
_def_alias "emoji" "emoji"
_def_alias "clinic" "clinic"
_def_alias "alert" "alert"
_def_alias "core-validate-commit" "core-validate-commit"
_def_alias "gtop" "gtop"
_def_alias "gitignore" "gitignore"
_def_alias "tldr" "tldr"
_def_alias "cowsay" "cowsay"
_def_alias "cowthink" "cowthink"
_def_alias "yarn" "yarn"
_def_alias "open-cli" "open"

alias clang-omp='/usr/local/opt/llvm/bin/clang -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
alias clang-omp++='/usr/local/opt/llvm/bin/clang++ -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
