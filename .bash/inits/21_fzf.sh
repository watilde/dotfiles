# Setup fzf
# ---------
if [[ ! "$PATH" == *"$HOME/.local/bin"* ]]; then
  PATH="$HOME/.local/bin:${PATH}"
fi

eval "$(fzf --bash)"
