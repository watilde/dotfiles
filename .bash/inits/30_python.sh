# https://github.com/pypa/pipenv/wiki/Run-pipenv-shell-automatically
# Activate current folder's pipenv virtualenv
# or accept an explicit virtualenv name
workon() {
    if [ $# -eq 0 ]
    then
        source "$(pipenv --venv)/bin/activate"
    else
        source "~/.virtualenvs/$1/bin/activate"
    fi
}

# Making virtualenv alias
mkvenv() {
    cd ~/.virtualenvs
    virtualenv "$@"
    cd -
    workon "$1"
}

# Automatic virtualenv sourcing
function auto_pipenv_shell {
    if [ ! -n "$VIRTUAL_ENV" ]; then
        if [ -f "Pipfile" ] ; then
            workon
        fi
    fi
}
function cd {
    builtin cd "$@"
    auto_pipenv_shell
}
auto_pipenv_shell
