#! /usr/bin/env bash

# node modules execute
# execute a command install under node_modules/.bin
# safer, packager-manager-agnostic alternative to npx
function nmx() {
  local params=("${@}")
  eval "./node_modules/.bin/${params[0]}" "${params[@]:1}"
}

# completion function for nmx
function _nmx() {
  COMPREPLY=()
  if [[ $COMP_CWORD -eq 1 ]]; then
    local word="${COMP_WORDS[COMP_CWORD]}"
    mapfile -t COMPREPLY < <(compgen -W "$(\ls ./node_modules/.bin/)" -- "$word")
  fi
}

complete -F _nmx nmx
