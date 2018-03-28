#!/usr/bin/env bash

function lsx() {
  local type="$1"
  local dir="${2:-.}"
  find "$dir" -maxdepth 1 -type "$type" -exec ls -adhl --color=auto {} \+
}

function lsd() {
  lsx d "$1"
}

function lsf() {
  lsx f "$1"
}

function lsl() {
  lsx l "$1"
}
