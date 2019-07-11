#! /usr/bin/env bash

# EDITOR
#   environ - user environment
#
# The user's preferred utility to edit text files
export EDITOR="vim"

# GPG_TTY
#   gpg-agent - Secret key management for GnuPG
#
# It is important that this environment variable always reflects the output of
# the tty command.
if type -t gpg-connect-agent > /dev/null; then
  GPG_TTY=$(tty)
  export GPG_TTY
  gpg-connect-agent updatestartuptty /bye > /dev/null
fi

# HISTCONTROL
#   bash - GNU Bourne-Again SHell
#
# A colon-separated list of values controlling how commands are saved on the
# history list.  If the list of values includes ignorespace, lines which begin
# with a space character are not saved in the history list.  A value of
# ignoredups causes lines matching the previous history entry to not be saved.
# A value of ignoreboth is shorthand for ignorespace and ignoredups.  A value of
# erasedups causes all previous lines matching the current line to be removed
# from the history list before that line is saved.  Any value not in the above
# list is ignored.  If HISTCONTROL is unset, or does not include a valid value,
# all lines read by the shell parser are saved on the history list, subject to
# the value of HISTIGNORE.  The second and subsequent lines of a multi-line
# compound command are not tested, and are added to the history regardless of
# the value of HISTCONTROL.
HISTCONTROL="ignoreboth"

# HISTFILESIZE
#   bash - GNU Bourne-Again SHell
#
# The maximum number of lines contained in the history file.  When this variable
# is assigned a value, the history file is truncated, if necessary, to contain
# no more than that number of lines by removing the oldest entries.  The history
# file is also truncated to this size after writing it when a shell exits.   If
# the value is 0, the history file is truncated to zero size.  Non-numeric
# values and numeric values less than zero inhibit truncation.  The shell sets
# the default value to the value of HISTSIZE after reading any startup files.
HISTFILESIZE="2000"

# HISTSIZE
#   bash - GNU Bourne-Again SHell
#
# The number of commands to remember in the command history (see HISTORY below).
# If the value is 0, commands are not saved in the history list.   Numeric
# values less than zero result in every command being saved on the history list
# (there is no limit).  The shell sets the default value to 500 after reading
# any startup files.
HISTSIZE="1000"

# LESS
#   less - opposite of more
#
#   Options which are passed to less automatically
#
# -I or --IGNORE-CASE
#   Like -i, but searches ignore case even if the pattern contains uppercase
#   letters.
#
# -R or --RAW-CONTROL-CHARS
#   Like -r, but only ANSI "color" escape sequences are output in "raw" form.
#   Unlike -r, the screen appearance is maintained correctly in most cases.
#   ANSI "color" escape sequences are sequences of the form:
#
#     ESC [ ... m
#
#   where the "..." is zero or more color specification characters For the
#   purpose of keeping track of screen appearance,  ANSI color escape sequences
#   are assumed to not move the cursor.  You can make less think that characters
#   other than "m" can end ANSI color escape sequences by setting the
#   environment variable LESSANSIENDCHARS to the list of characters which can
#   end a color escape sequence.  And you can make less think that characters
#   other than the standard ones may appear between the ESC and the m by setting
#   the environment variable LESSANSIMIDCHARS to the list of characters which
#   can appear.
#
# -xn,... or --tabs=n,...
#   Sets tab stops.  If only one n is specified, tab stops are set at multiples
#   of n.  If multiple values separated by commas are specified, tab stops are
#   set at those positions, and then continue with the same spacing as the last
#   two.  For example, -x9,17 will set tabs at positions 9, 17, 25, 33, etc.
#   The default for n is 8.
export LESS="--IGNORE-CASE --RAW-CONTROL-CHARS --tabs=2"

# LESSCOLORIZER
#   lesspipe.sh - a filter for less
#
# A different colorizer can be called within code2color by setting the ENV
# variable LESSCOLORIZER to the name of an alternative (currently only
# pygmentize allowed).
if type -t pygmentize > /dev/null; then
  export LESSCOLORIZER="pygmentize"
fi

# LESSOPEN
#   less - opposite of more
#
# Command line to invoke the (optional) input-preprocessor.
#
# Source-highlight - convert source code to syntax highlighted document
if type -t src-hilite-lesspipe.sh > /dev/null; then
  export LESSOPEN="| src-hilite-lesspipe.sh %s"
fi

# PAGER
#   environ - user environment
#
# The user's preferred utility to display text files
#
# less - opposite of more
export PAGER="less"

# PATH
#   environ - user environment
#
# The sequence of directory prefixes that sh(1) and many other programs apply in
# searching for a file known by an incomplete pathname.  The prefixes are
# separated by ':'.  (Similarly one has CDPATH used by some shells to find the
# target of a change directory command, MANPATH used by man(1) to find manua
# pages, and so on)
#
# prepend $HOME/.local/bin to PATH if it exists
if [[ -d "$HOME/.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi
# append GOBIN or GOPATH/bin to PATH if go is installed
if type -t go > /dev/null; then
  if [[ -n $(go env GOBIN) ]]; then
    PATH="$PATH:$(go env GOBIN)"
  else
    PATH="$PATH:$(go env GOPATH)/bin"
  fi
fi

# POWERLINE_BASH_CONTINUATION
#   powerline - Powerline prompt and statusline script
#
# Tell powerline to set PS2 variable.
#
# shellcheck disable=2034
POWERLINE_BASH_CONTINUATION=1

# POWERLINE_BASH_SELECT
#   powerline - Powerline prompt and statusline script
#
# Tell powerline to set PS3 variable.
#
# shellcheck disable=2034
POWERLINE_BASH_SELECT=1

# PS1
#   bash - GNU Bourne-Again SHell
#
# The value of this parameter is expanded (see PROMPTING below) and used as the
# primary prompt string.  The default value is ``\s-\v\$ ''.
export PS1="\\[\\033[0;35m\\]\\u\\[\\033[0;37m\\]@\\[\\033[0;33m\\]\\h\\[\\033[0;37m\\]:\\[\\033[0;34m\\]\\w\\[\\033[0;32m\\]\$(__git_ps1 '(%s)')\\[\\033[0m\\]\\\$ "

# SSH_AUTH_SOCK
#   ssh — OpenSSH SSH client (remote login program)
#
# Identifies the path of a UNIX-domain socket used to communicate with the
# agent.
#
# set SSH_AUTH_SOCK to point to gpg-agent socket, if it exists
if [[ -n "$XDG_RUNTIME_DIR" && -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh" ]]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
fi

# VISUAL
#   environ - user environment
#
# The user's preferred utility to edit text files
export VISUAL="vim"

# XZ_OPT
#   xz, unxz, xzcat, lzma, unlzma, lzcat - Compress or decompress .xz and .lzma
#   files
#
# This is for passing options to xz when it is not possible to set the options
# directly on the xz command line.  This is the case e.g. when xz is run by a
# script or tool, e.g. GNU tar(1):
#
#   XZ_OPT=-2v tar caf foo.tar.xz foo
#
# Scripts may use XZ_OPT e.g. to set script-specific default compression
# options.  It is still recommended to allow users to override XZ_OPT if that is
# reasonable, e.g. in sh(1) scripts one may use something like this:
#
#   XZ_OPT=${XZ_OPT-"-7e"}
#   export XZ_OPT
#
# -T threads, --threads=threads
#   Specify the number of worker threads to use.  Setting threads to a special
#   value 0 makes xz use as many threads as there are CPU cores on the system.
#   The actual number of threads can be less than threads if the input file is
#   not big enough for threading with the given settings or if using more
#   threads would exceed the memory usage limit.
#
#   Currently the only threading method is to split the input into blocks and
#   compress them independently from each other.  The default block size depends
#   on the compression level and can be overriden with the --block-size=size
#   option.
#
#   Threaded decompression hasn't been implemented yet.  It will only work on
#   files that contain multiple blocks with size information in block headers.
#   All files compressed in multi-threaded mode meet this condition, but files
#   compressed in single-threaded mode don't even if --block-size=size is used.
export XZ_OPT="--threads=0"
