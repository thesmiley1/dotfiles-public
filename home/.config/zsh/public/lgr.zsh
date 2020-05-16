#! /usr/bin/env zsh

function lgr() {
  local dir
  if [[ "$#" -gt "1" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  l "${dir}" | gr "${@}"
}

function lagr() {
  local dir
  if [[ "$#" -gt "1" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  la "${dir}" | gr "${@}"
}

function llgr() {
  local dir
  if [[ "$#" -gt "1" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  ll "${dir}" | gr "${@}"
}

function llgrd() {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  llgr "${dir}" "^d" "${@}"
}

function llgrf() {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  if type lsd > /dev/null; then
    llgr "${dir}" "^\\." "${@}"
  else
    llgr "${dir}" "^-" "${@}"
  fi
}

function llgrl() {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  llgr "${dir}" "^l" "${@}"
}

function llagr() {
  local dir
  if [[ "$#" -gt "1" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  lla "${dir}" | gr "${@}"
}

function llagrd() {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  llagr "${dir}" "^d" "${@}"
}

function llagrf() {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  if type lsd > /dev/null; then
    llagr "${dir}" "^\\." "${@}"
  else
    llagr "${dir}" "^-" "${@}"
  fi
}

function llagrl() {
  local dir
  if [[ "$#" -gt "0" ]]; then
    dir="${1}"
    shift
  else
    dir="."
  fi

  llagr "${dir}" "^l" "${@}"
}
