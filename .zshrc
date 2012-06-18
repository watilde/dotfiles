is_screen_running() {
    # tscreen also uses this varariable.
    [ ! -z "$WINDOW" ]
}
is_tmux_runnning() {
    [ ! -z "$TMUX" ]
}
is_screen_or_tmux_running() {
    is_screen_running || is_tmux_runnning
}
shell_has_started_interactively() {
    [ ! -z "$PS1" ]
}
resolve_alias() {
    cmd="$1"
    while \
        whence "$cmd" >/dev/null 2>/dev/null \
        && [ "$(whence "$cmd")" != "$cmd" ]
    do
        cmd=$(whence "$cmd")
    done
    echo "$cmd"
}


if ! is_screen_or_tmux_running && shell_has_started_interactively; then
    for cmd in tmux tscreen screen; do
        if whence $cmd >/dev/null 2>/dev/null; then
            $(resolve_alias "$cmd")
            break
        fi
    done
fi


#|--------------------|
#|~Load nave function~|
#|--------------------|
typeset -ga chpwd_functions

function _naverc_check() {
    if [[ -f '.naverc' ]] ; then
        source '.naverc'
            fi
}
chpwd_functions+=_naverc_check


#|-------------------|
#|~Load RVM function~|
#|-------------------|
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#|--------|
#|~その他~|
#|--------|
RPROMPT="%T"			# 右側に時間を表示する
setopt transient_rprompt	# 右側まで入力がきたら時間を消す
autoload -U compinit		# 補完機能
compinit -u


#|------------|
#|~lsの色付け~|
#|------------|
alias ls='ls -GF'

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
;;
*)
PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
}
# export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors \
           'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
           ;;
           esac
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
