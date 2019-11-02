#! /usr/bin/env bash

# tar - an archiving utility

# tar directory with arbitrary compression
function ztar() {
  local input="${1}"
  local output="${2}"
  local compressor="${3}"

  if [[ -e "${input}" ]]; then
    if [[ -e "${output}" ]]; then
      echo "Output ${output} already exists"
      return 2
    else
      tar -cv --use-compress-program="${compressor}" -f "${output}" "${input}" &&
      echo &&
      echo "${input} archived to ${output}"
      return 0
    fi
  else
    echo "Input ${input} does not exist"
    return 1
  fi

  # should never get here
  return 3
}

# tar directory with gzip compression
function targz() {
  local input="${1}"
  local output="${2:-$(basename "${input}").tar.gz}"

  if type -t pigz > /dev/null; then
    local compressor="pigz"
  else
    local compressor="gzip"
  fi

  ztar "${input}" "${output}" "${compressor}"
}

# tar directory with xz compression
function tarxz() {
  local input="${1}"
  local output="${2:-$(basename "${input}").tar.xz}"

  if type -t pixz > /dev/null; then
    local compressor="pixz"
  else
    local compressor="xz"
  fi

  ztar "${input}" "${output}" "${compressor}"
}

# tar directory with zst compression
function tarzst() {
  local input="${1}"
  local output="${2:-$(basename "${input}").tar.zst}"

  ztar "${input}" "${output}" "zstd"
}

# untar and decompress file
function untar() {
  local input="${1}"

  local extension="${input#*.}"
  if [[ "${extension}" == "tar.gz" ]]; then
    if type -t pigz > /dev/null; then
      tar -xv --use-compress-program="pigz" -f "${input}"
    else
      tar -xv --use-compress-program="gzip" -f "${input}"
    fi
  elif [[ "${extension}" == "tar.xz" ]]; then
    if type -t pixz > /dev/null; then
      tar -xv --use-compress-program="pixz" -f "${input}"
    else
      tar -xv --use-compress-program="xz" -f "${input}"
    fi
  else
    tar -xvf "${input}"
  fi
}
