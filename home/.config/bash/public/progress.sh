#! /usr/bin/env bash

# progress - Coreutils Progress Viewer

# run an arbitrary command with progress
function cmdprog() {
  # shellcheck disable=SC2034
  local cmd="$1"
  shift

  eval \"\$cmd\" \"\$@\" \&
  progress -mp "$!"

  if ps -p "$!" > /dev/null; then
    kill -9 "$!"
  fi
}

# cp with progress
function cpprog() {
  cmdprog cp "$@"
}

# mv with progress
function mvprog() {
  mvprog mv "$@"
}
