#!/bin/bash

MIGRATEdir="migrate";
IGNORElist=(README .git .svn);

#
# Common functions
#
function dotfiles(){
    for f in ${IGNORElist[@]}
    do
        local options="$options -e $f";
    done
    echo $(\
        find ${1} -maxdepth 1\
        |grep -v $options\
        |grep -v ${0##*/}\
        |grep -v "^${1}$"\
        |grep -v "^${1}/$MIGRATEdir$")\
    |sed "s?$1\/??g";
}

function migratefiles(){
    for f in ${IGNORElist[@]}
    do
        local options="$options -e $f";
    done
    echo $(\
        find ${1} -maxdepth 1\
        |grep -v $options\
        |grep -v ${0##*/}\
        |grep -v "^${1}$")\
    |sed "s?$1\/??g";
}

function filetype(){
    if   [ -L $1 ]; then
        echo "link";
    elif [ -f $1 ]; then
        echo "file";
    elif [ -d $1 ]; then
        echo "dir";
    else
        echo "none";
    fi
}

function pattern(){
    case $1 in
        "message")  # message
            echo " message  : $2";;
        "conflict") # path
            echo " conflict : $2";;
        "ignore")   # path
            echo " ignore   : $2";;
        "command")  # command
            echo " command  : $2";
            eval $2;;
        "mkdir")    # path
            if [ ! -d $2 ] ; then
                pattern "command" "mkdir -p $2";
            fi;;
        "rmdir")    # path
            if [ -d $2 ] ; then
                pattern "command" "rm -rf $2";
            fi;;
    esac
}

#
#  Install function
#
function install(){
    local DOT=$(cd $(dirname $0);pwd);
    local DOTlist=($(dotfiles $DOT));
    local MIGRATE="$DOT/$MIGRATEdir/$USER";
    for filename in ${DOTlist[@]};
    do
        local DOTfile="$DOT/$filename";
        local HOMEfile="$HOME/$filename";
        local HOMEfiletype=$(filetype $HOMEfile);
        echo "[$filename]";
        if     [ "link" = $HOMEfiletype ] \
            && [ $DOTfile -ef $HOMEfile ] ; then
            pattern "ignore"  "$HOMEfile($HOMEfiletype)";
            continue;
        fi
        if [ "none" != $HOMEfiletype ]; then
            pattern "conflict" "$HOMEfile($HOMEfiletype)";
            pattern "mkdir"    "$MIGRATE";
            pattern "command"  "mv -f $HOMEfile $MIGRATE";
        fi
        pattern "command"  "ln -s $DOTfile $HOME";
    done
}

#
# Restore function
#
function restore(){
    local DOT=$(cd $(dirname $0);pwd);
    local DOTlist=($(dotfiles $DOT));
    local MIGRATE="$DOT/$MIGRATEdir/$USER";
    for filename in ${DOTlist[@]};
    do
        local DOTfile="$DOT/$filename";
        local HOMEfile="$HOME/$filename";
        local HOMEfiletype=$(filetype $HOMEfile);
        if     test $HOMEfiletype = "link" \
            && test $DOTfile -ef $HOMEfile; then
            pattern "command" "rm -f $HOMEfile";
        fi
    done
    if [ -d $MIGRATE ]; then
        local MIGRATElist=($(migratefiles $MIGRATE));
        for filename in ${MIGRATElist[@]};
        do
            local HOMEfile="$HOME/$filename";
            local HOMEfiletype=$(filetype $HOMEfile);
            local MIGRATEfile="$MIGRATE/$filename";
            local MIGRATEfiletype=$(filetype $MIGRATEfile);
            if [ "none" = $HOMEfiletype ]; then
                pattern "command"  "mv $MIGRATEfile $HOME";
            else
                pattern "conflict" "$HOMEfile($HOMEfiletype)";
                if [ "none" != $(filetype "$HOMEfile~") ] ; then
                    pattern "conflict" "$HOMEfile~(backup)";
                    pattern "command"  "rm -rf $HOMEfile~";
                fi
                pattern "command"  "mv $MIGRATEfile $HOMEfile~";
            fi
        done
        pattern "rmdir" $MIGRATE;
    fi
}

#
# Help function
#
function help(){
    cat <<EOF

 example)

   [install]
   $ ./setup.sh install

   [restore]
   $ ./setup.sh restore

   [help]
   $ ./setup.sh help


EOF
}

#
# Main
#
case $1 in
    "install")
        install;;
    "restore")
        restore;;
    "help")
        help;;
    *)
        help;;
esac
