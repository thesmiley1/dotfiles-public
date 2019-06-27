#!/usr/bin/env bash

# tar - an archiving utility

# tar directory with arbitrary compression
function zdir() {
  local input="$1"
  local output="$2"
  local compressor="$3"

  if [[ -d "$input" ]]; then
    if [[ -e "$output" ]]; then
      echo "Output $output already exists"
      return 1
    else
      tar -cv --use-compress-program="$compressor" -f "$output" "$input" &&
      echo &&
      echo "$input archived to $output"
      return 0
    fi
  else
    echo "Input $input is not a directory"
    return 2
  fi

  # should never get here
  return 3
}

# tar directory with gzip compression
function gzdir() {
  local input="$1"
  local output="${2:-$(basename "$input").tar.gz}"

  if type -t pigz > /dev/null; then
    local compressor="pigz"
  else
    local compressor="gzip"
  fi

  zdir "$input" "$output" "$compressor"
}

# tar directory with xz compression
function xzdir() {
  local input="$1"
  local output="${2:-$(basename "$input").tar.xz}"

  zdir "$input" "$output" "xz"
}

# untar and decompress file
function untar() {
  local input="$1"

  local extension="${input#*.}"
  if [[ "$extension" == "tar.gz" ]]; then
    if type -t pigz > /dev/null; then
      tar -xv --use-compress-program="pigz" -f "$input"
    else
      tar -xv --use-compress-program="gzip" -f "$input"
    fi
  elif [[ "$extension" == "tar.xz" ]]; then
    tar -xv --use-compress-program="xz" -f "$input"
  else
    tar -xvf "$input"
  fi
}
