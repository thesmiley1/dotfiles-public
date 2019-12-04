#! /usr/bin/env bash

function follow() {
  local path="${1:-.}"

  if realpath -e "${path}" > /dev/null 2>&1; then
    cd "$(realpath -e "${path}")" || return "${?}"
  else
    return "${?}"
  fi
}
