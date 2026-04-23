export GPG_TTY=$(tty 2>/dev/null)
[ -z "$GPG_TTY" ] && export GPG_TTY=/dev/tty
