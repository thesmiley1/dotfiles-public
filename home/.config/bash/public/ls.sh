#! /usr/bin/env bash

# ls - list directory contents

# ls with grep
function lsg() {
  local dir
  if [[ "$#" -gt "1" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  # shellcheck disable=SC2010
  ls "${dir}"| grep "${@}"
}

# ls directories only
function lsd() {
  lsg "^d"
}

# ls files only
function lsf() {
  lsg "^-"
}
# ls symlinks only
function lsl() {
  lsg "^l"
}
