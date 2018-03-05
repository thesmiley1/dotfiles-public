gzdir() {
  local input="$1"
  local output="${2:-`basename "$input"`.tar.gz}"

  if [[ -d "$input" ]]; then
    if [[ -e "$output" ]]; then
      echo "Output $output already exists"
      return 1
    else
      # https://unix.stackexchange.com/a/93158
      tar -zcvf "$output" "$input" &&
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
