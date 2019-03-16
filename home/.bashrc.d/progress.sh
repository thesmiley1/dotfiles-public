#! /usr/bin/env bash

function cmdprog() {
  # shellcheck disable=SC2034
  local cmd="$1"
  shift

  eval \"\$cmd\" \"\$@\" \&
  progress -mp $!

  if ps -p $! > /dev/null; then
    kill -9 $!
  fi
}

function cpprog() {
  cmdprog cp "$@"
}

function mvprog() {
  mvprog mv "$@"
}
