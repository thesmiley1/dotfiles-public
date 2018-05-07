#!/usr/bin/env bash

# supposedly this is supposed to be a line editor...
# https://unix.stackexchange.com/a/334022
export EDITOR="vim"

# less is more, right?
export PAGER="less"

# tell xz to always use as many threads as possible
export XZ_OPT="--threads=0"
