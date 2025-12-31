#!/bin/bash

# Homebrew
if [ -e "/opt/homebrew/bin/brew" ]; then
 eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -e "/usr/local/bin/brew" ]; then
 eval "$(/usr/local/bin/brew shellenv)"
fi

# ccache
if [ -x "$(command -v ccache)" ]; then
  export USE_CCACHE=1
  export CCACHE_DIR="$HOME/.ccache"
  export CC='ccache gcc'
fi

# Node.js
if [ -e "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# Ruby
if [ -e "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

#Java
if [ -e "$HOME/.sdkman" ]; then
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  
  _sdkman_post_cd() {
    if [[ -f .sdkmanrc ]]; then
      sdk env
    fi
  }
  post_cd_hooks+=( _sdkman_post_cd )
fi

# Python
if [ -e "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Rust
if [ -e "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Go
if [ -d "/usr/local/go/bin" ]; then
  export PATH=$PATH:/usr/local/go/bin
fi

# Editor
if [ -x "$(command -v emacs)" ]; then
  export EDITOR='emacs'
fi

# Z
source "$__CHEST/.bash/packages/z/z.sh"

# L410 X server
export DISPLAY=:0
export XGD_SESSION_TYPE=X11
export LIBGL_ALWAYS_INDIRECT=1

# adb
if [ -d "$HOME/Library/Android/sdk/platform-tools" ]; then
  export PATH=$PATH:"$HOME/Library/Android/sdk/platform-tools"
fi
if [ -d "$HOME/Library/Android/sdk/tools/" ]; then
  export PATH=$PATH:"$HOME/Library/Android/sdk/tools/"
fi

# Git
source "$__CHEST/.bash/packages/git-completion/git-completion.bash"

# Free TDS

if [ -e "/usr/local/opt/freetds@0.91" ]; then
  export PATH="/usr/local/opt/freetds@0.91/bin:$PATH"
fi

# Deno
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

