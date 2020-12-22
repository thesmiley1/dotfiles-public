#! /usr/bin/env zsh


# THANKS
# https://gist.github.com/judy2k/7656bfe3b322d669ef75364a46327836


__dotenv() {
  echo "$(egrep -v '^#' .env | xargs)"
}


dotenv-exec() {
  eval "$(__dotenv) ${@}"
}

dotenv-export() {
  export "$(__dotenv)"
}
