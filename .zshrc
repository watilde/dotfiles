## Load fish config
if [ ! -e $HOME"/.config/fish/config.fish" ]; then
  ln -s $HOME"/.fish/init.fish" $HOME"/.config/fish/config.fish"
fi

## Launch fishshell
fish
