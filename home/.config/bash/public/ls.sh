#! /usr/bin/env bash

# ls - list directory contents

# ls with grep (cwd only)
function lsg() {
  # shellcheck disable=SC2010
  ls | grep -i "$@"
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
