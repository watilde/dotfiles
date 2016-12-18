#!/bin/bash

# Node.js
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python
export PATH="$HOME/.pyenv/bin:$PATH"

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
