#! /usr/bin/env bash

# ALIASES
#
# Aliases allow a string to be substituted for a word when it is used as the
# first word of a simple command.  The shell maintains a list of  aliases that
# may be set and unset with the alias and unalias builtin commands (see SHELL
# BUILTIN COMMANDS below).  The first word of each simple command, if unquoted,
# is checked to see if it has an alias.  If so, that word is replaced by the
# text of the alias.  The characters /, $, `, and = and any of the shell
# metacharacters or quoting characters listed above may not appear in an alias
# name.  The replacement text may contain any valid shell input, including shell
# metacharacters.  The first word of the replacement text is tested for aliases,
# but a word that is identical to an alias being expanded is not expanded a
# second time.  This means that one may alias ls to ls -F, for instance, and
# bash does not try to recursively expand the replacement text.  If the last
# character of the alias value is a blank, then the next command word following
# the alias is also checked for alias expansion.

# Aliases are created and listed with the alias command, and removed with the
# unalias command.

# There is no mechanism for using arguments in the replacement text.  If
# arguments are needed, a shell function should be used (see FUNCTIONS below).

# Aliases are not expanded when the shell is not interactive, unless the
# expand_aliases shell option is set using shopt (see the description of shopt
# under SHELL BUILTIN COMMANDS below).

# The rules concerning the definition and use of aliases are somewhat confusing.
# Bash always reads at least one complete line of input, and all lines that make
# up a compound command, before executing any of the commands on that line or
# the compound command.  Aliases are expanded when a command is read, not when
# it is executed.  Therefore, an alias definition appearing on the same line as
# another command does not take effect until the next line of input is read.
# The commands following the alias definition on that line are not affected by
# the new alias.  This behavior is also an issue when functions are executed.
# Aliases are expanded when a function definition is read, not when the function
# is executed, because a function definition is itself a command.  As a
# consequence, aliases defined in a function are not available until after that
# function is executed.  To be safe, always put alias definitions on a separate
# line, and do not use alias in compound commands.

# For almost every purpose, aliases are superseded by shell functions.

################################################################################

# diff
#   GNU diff - compare files line by line
#
# --color[=WHEN]
#   colorize the output; WHEN can be 'never', 'always', or 'auto' (the default)
#
# -u, -U NUM, --unified[=NUM]
#   output NUM (default 3) lines of unified context

alias diff="diff --color=auto --unified"

################################################################################

# du
#   ncdu - NCurses Disk Usage

if type -t ncdu > /dev/null; then
  alias du="ncdu"
fi

################################################################################

# ffmpeg
#   ffmpeg - ffmpeg video converter
#
# -hide_banner
#   Suppress printing banner.

alias ffmpeg="ffmpeg -hide_banner"

################################################################################

# ffprobe
#   ffprobe - ffprobe media prober
#
# -hide_banner
#   Suppress printing banner.

alias ffprobe="ffprobe -hide_banner"

################################################################################

# grep
#   grep, egrep, fgrep - print lines that match patterns
#
# --color[=WHEN], --colour[=WHEN]
#   Surround the matched (non-empty) strings, matching lines, context lines,
#   file names, line numbers, byte offsets, and separators (for fields and
#   groups of context lines) with escape sequences to display them in color on
#   the terminal.  The colors are defined by the environment variable
#   GREP_COLORS.  The deprecated environment variable GREP_COLOR is still
#   supported, but its setting does not have priority.  WHEN is never, always,
#   or auto.

alias grep="grep --color=auto"

################################################################################

# ls
#   ls - list directory contents
#
# -a, --all
#   do not ignore entries starting with .
#
# --color[=WHEN]
#   colorize the output; WHEN can be 'always' (default if omitted), 'auto', or
#   'never'; more info below
#
# -h, --human-readable
#   with -l and -s, print sizes like 1K 234M 2G etc.
#
# -l
#   use a long listing format

alias ls="ls --all --color=always --human-readable -l"

################################################################################

# top
#   htop - interactive process viewer

if type -t htop > /dev/null; then
  alias top="htop"
fi

################################################################################

# npx
#   npx - execute npm package binaries
#
# --no-install
#   If passed to npx, it will only try to run <command> if it already exists in
#   the current path or in $prefix/node_modules/.bin. It won't try to  install
#   missing commands.
#
# NOTE:  This is to mitigate a SECURITY ISSUE that was initially acknowledged
#        and then WAS NEVER ACTUALLY ADDRESSED.
#
# SEE:  https://github.com/zkat/npx/issues/66
#       https://github.com/zkat/npx/issues/105
#       https://github.com/zkat/npx/issues/198
#       https://github.com/npm/npx

alias npx="npx --no-install"

################################################################################

# rm
#   trash-put - Command line trash utility.
#
# NOTE:  This is against the advice of the author of trash-cli.
#
# SEE:  https://github.com/andreafrancia/trash-cli#can-i-alias-rm-to-trash-put

if type -t trash-put > /dev/null; then
  alias rm="trash-put"
fi

################################################################################

# ssv
#   vagrant - a tool for building and distributing development environments
#
# ssh
#   connects to machine via SSH

alias ssv="vagrant ssh"

################################################################################

# vbox
#   VBoxManage - Oracle VM VirtualBox Command Line Management Interface

alias vbox="VBoxManage"

################################################################################

# vh
#   vagrant - a tool for building and distributing development environments
#
# halt
#   stops the vagrant machine

alias vh="vagrant halt"

################################################################################

# vi - screen oriented (visual) display editor based on ex
#   vim - Vi IMproved, a programmer's text editor

if type -t vim > /dev/null; then
  alias vi="vim"
fi

################################################################################

# vim - Vi IMproved, a programmer's text editor
#   neovim - hyperextensible Vim-based text editor

if type -t nvim > /dev/null; then
  alias vim="nvim"
fi

################################################################################

# vs
#   vagrant - a tool for building and distributing development environments
#
# status
#   outputs status of the vagrant machine

alias vs="vagrant status"

################################################################################

# vu
#   vagrant - a tool for building and distributing development environments
#
# up
#   starts and provisions the vagrant environment

alias vu="vagrant up"

################################################################################
