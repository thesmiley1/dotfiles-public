#! /usr/bin/env bash

function _progress_cmd() {
  local cmd="$1"
  shift

  eval \"\$\(which \"\$cmd\"\)\" \"\$@\" \&
  progress -mp $!

  if ps -p $! > /dev/null; then
    kill -9 $!
  fi
}

function _which_cmd() {
  # shellcheck disable=SC2034
  local cmd="$1"
  shift

  eval \"\$\(which \"\$cmd\"\)\" \"\$@\"
}

function _try_progress_cmd() {
  if type -t progress > /dev/null; then
    _progress_cmd "$@"
  else
    _which_cmd "$@"
  fi
}

function cp() {
  _try_progress_cmd cp "$@"
}

function mv() {
  _try_progress_cmd mv "$@"
}
