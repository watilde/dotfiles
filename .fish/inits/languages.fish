# lisp
alias lisp='/usr/local/ccl/dx86cl64'

# nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# pyenv
set -x PATH $HOME/.pyenv/bin $PATH
. (pyenv init - | psub)

# OPAM configuration
#. /Users/watilde/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Java
set -x JAVA_HOME `/usr/libexec/java_home`
