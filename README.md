.dotfiles
======================
 
    $ git clone https://github.com/emanon-was/.dotfiles.git
    $ chmod +x .dotfiles/setup.sh
 
Usage
------
### Install ###
    $ ./.dotfiles/setup.sh install
     or
    $ bash .dotfiles/setup.sh install
It will migrate existing files, create symbolic links.
 
### Restore ###
    $ ./.dotfiles/setup.sh restore
     or
    $ bash .dotfiles/setup.sh resotre
It will remove symbolic links, and then restore the previous files.
 
 
Warning
------
setup.sh depends on bash.
 
