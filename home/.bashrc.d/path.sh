#!/usr/bin/env bash

append_path_if_exists() {
  if [[ -d $1 ]]
  then
    export PATH="$PATH:$1"
    return 0
  else
    return 1
  fi
}

prepend_path_if_exists() {
  if [[ -d $1 ]]
  then
    export PATH="$1:$PATH"
    return 0
  else
    return 1
  fi
}
