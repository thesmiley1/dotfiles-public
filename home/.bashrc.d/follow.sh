#!/usr/bin/env bash

function follow() {
  local path="${1:-.}"

  local real
  real="$(realpath -e $path)"
  if [[ "$?" == "0" ]]; then
    cd "$real" || return "$?"
  else
    return "$?"
  fi
}
