# No duplicate entries
export HISTCONTROL=ignoredups:erasedups

# Big history
export HISTSIZE=100000
export HISTFILESIZE=100000

# Append to history instead of overwriting
shopt -s histappend

# The PROMPT_COMMAND below was removed because it can be slow and is better
# handled by bash-it's 'history' plugin.
# To enable it, run: bash-it enable plugin history
#
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
