# No duplicate entries
export HISTCONTROL=ignoredups:erasedups

# Big history
export HISTSIZE=100000
export HISTFILESIZE=100000

# Append to history instead of overwriting
shopt -s histappend

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
