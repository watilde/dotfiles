#!/bin/bash

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/root/.ccache
export set CC='ccache gcc'

# Node.js
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# depot_tools
export PATH="$HOME/.bash/packages/depot_tools:$PATH"

# gettext
export PATH="/usr/local/opt/gettext/bin:$PATH"

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# Java
export JAVA_HOME=`/usr/libexec/java_home`

# Editor
export EDITOR='emacs'

# Rust
source ~/.cargo/env
