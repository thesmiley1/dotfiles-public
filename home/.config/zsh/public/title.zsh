#! /usr/bin/env zsh

function __title {
  # THANKS https://superuser.com/a/414953/1133268
  echo -en "\033];${USER}@${HOST}:$(basename "${PWD/${HOME}/~}") ${1}\007"
}

function __title_precmd {
  __title "zsh"
}
add-zsh-hook precmd __title_precmd

function __title_preexec {
  __title "${2%% *}"
}
add-zsh-hook preexec __title_preexec
