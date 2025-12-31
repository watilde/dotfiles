#!/bin/bash
source $HOME/.bash/init.sh
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
