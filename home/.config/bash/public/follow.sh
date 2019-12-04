#! /usr/bin/env bash

# follow symlinks of given directory (or current working directory, if not
# provided) and `cd` to it
function follow() {
  local path="${1:-.}"

  if realpath -e "${path}" > /dev/null 2>&1; then
    cd "$(realpath -e "${path}")" || return "${?}"
  else
    return "${?}"
  fi
}
