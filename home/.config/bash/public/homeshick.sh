#! /usr/bin/env bash

# https://github.com/andsens/homeshick

# https://github.com/andsens/homeshick/wiki/Tutorials#refreshing
if type homeshick > /dev/null 2>&1; then
  homeshick --quiet refresh
fi
