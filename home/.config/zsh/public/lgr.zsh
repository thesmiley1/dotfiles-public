#! /usr/bin/env zsh

function lgr() {
  local dir
  if [[ "$#" -gt "1" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  l "${dir}"| gr "${@}"
}

function lgrd {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  lgr "${dir}" "^d" "${@}"
}

function lgrf {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  lgr "${dir}" "^-" "${@}"
}

function lgrl {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  lgr "${dir}" "^l" "${@}"
}

function llgr() {
  local dir
  if [[ "$#" -gt "1" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  ll "${dir}"| gr "${@}"
}

function llgrd {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  llgr "${dir}" "^d" "${@}"
}

function llgrf {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  llgr "${dir}" "^-" "${@}"
}

function llgrl {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  llgr "${dir}" "^l" "${@}"
}
