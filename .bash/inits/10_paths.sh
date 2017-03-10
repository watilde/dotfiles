#!/bin/bash

# ccache
if [ -x "$(command -v ccache)" ]; then
  export USE_CCACHE=1
  export CCACHE_DIR="$HOME/.ccache"
  export set CC='ccache gcc'
fi

# Node.js
if [ -e "$HOME/.nodebrew" ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# Ruby
if [ -e "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Rust
if [ -e "$HOME/.cargo/env" ]; then
  source ~/.cargo/env
fi

# depot_tools
export PATH="$HOME/.bash/packages/depot_tools:$PATH"

# Editor
if [ -x "$(command -v emacs)" ]; then
  export EDITOR='emacs'
fi
