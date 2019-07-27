#!/usr/bin/env bash

# shellcheck disable=SC1090

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source_if_exists() {
  if [[ -s $1 ]]
  then
    source "$1"
    return 0
  else
    return 1
  fi
}

source_if_exists "/usr/share/bash-completion/bash_completion"

source_if_exists "/usr/share/git/completion/git-prompt.sh"

source_if_exists "$HOME/.homesick/repos/homeshick/homeshick.sh"
source_if_exists "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

source_if_exists "$HOME/.rvm/scripts/rvm"

source "${HOME}/.config/bash/public.sh"

source_if_exists "${HOME}/.config/bash/work.sh"
source_if_exists "${HOME}/.config/bash/home.sh"
