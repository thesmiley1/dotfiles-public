#! /usr/bin/env bash

function __my_editor() {
  declare -a editors=(
    'nvim'
    'vim'
    'vi'
    'nano'
    'emacs'
  )

  for editor in "${editors[@]}"; do
    if type -t "${editor}" > /dev/null; then
      printf "%s" "${editor}"
      return 0
    fi
  done

  return 1
}
