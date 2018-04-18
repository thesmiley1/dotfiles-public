#!/usr/bin/env bash

function lsg() {
  local name="$1"
  local dir="${2:-.}"
  find "$dir" -maxdepth 1 -name "*$name*" -exec ls -adhl --color=auto {} \+
}

function lst() {
  local type="$1"
  local dir="${2:-.}"
  find "$dir" -maxdepth 1 -type "$type" -exec ls -adhl --color=auto {} \+
}

function lsd() {
  lst d "$1"
}

function lsf() {
  lst f "$1"
}

function lsl() {
  lst l "$1"
}
