#!/usr/bin/env bash

function lsg() {
  # shellcheck disable=SC2010
  ls | grep "$@"
}

function lsd() {
  lsg "^d"
}

function lsf() {
  lsg "^-"
}

function lsl() {
  lsg "^l"
}
