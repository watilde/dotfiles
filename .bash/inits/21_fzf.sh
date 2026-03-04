# Setup fzf
# ---------
if [[ ! "$PATH" == */home/moku/.local/bin* ]]; then
  PATH="/home/moku/.local/bin:${PATH}"
fi

eval "$(fzf --bash)"
