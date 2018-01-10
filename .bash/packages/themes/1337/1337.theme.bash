#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=" ${orange}x"
SCM_THEME_PROMPT_CLEAN=" ${green}o"
SCM_THEME_PROMPT_PREFIX="${purple}(${cyan}"
SCM_THEME_PROMPT_SUFFIX="${purple})"

function get_path() {
  DIR=$(dirs);
  # color the tilde
  DIR=${DIR/\~/"${white}~${green}"}
  # color the path separator
  DIR=${DIR//\//"${yellow}/${green}"}
  echo -e $DIR;
}

function get_branch_name() {
  if null=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    echo $(git_prompt_minimal_info);
  fi
}


function prompt_command() {
  PS1="\n${green}$(get_path) $(get_branch_name)\n${reset_color}\$ "
}

safe_append_prompt_command prompt_command
