#! /usr/bin/env zsh

################################################################################

# HELPER SETUP

function __editor() {
  declare -a editors=(
    'nvim'
    'vim'
    'vi'
    'nano'
    'emacs'
  )

  local editor
  for editor in "${editors[@]}"; do
    if type "${editor}" > /dev/null; then
      printf "%s" "${editor}"
      return 0
    fi
  done

  return 1
}

################################################################################

# EDITOR
#   environ - user environment
#
# The user's preferred utility to edit text files

declare -g EDITOR="$(__editor)"
export EDITOR

################################################################################

# GNUPGHOME
#   gpg - OpenPGP encryption and signing tool
#
# If set directory used instead of "~/.gnupg".

declare -g GNUPGHOME="${HOME}/.gnupg"
export GNUPGHOME

################################################################################

# GPG_TTY
#   gpg-agent - Secret key management for GnuPG
#
# It is important that this environment variable always reflects the output of
# the tty command.

if type gpg-connect-agent > /dev/null; then
  declare -g GPG_TTY=$(tty)
  export GPG_TTY
  gpg-connect-agent updatestartuptty /bye > /dev/null
fi

################################################################################

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

declare -g LESS="--IGNORE-CASE --RAW-CONTROL-CHARS --tabs=2"
export LESS

################################################################################

# LESSCOLORIZER
#   lesspipe.sh - a filter for less
#
# A different colorizer can be called within code2color by setting the ENV
# variable LESSCOLORIZER to the name of an alternative (currently only
# pygmentize allowed).

if type pygmentize > /dev/null; then
  declare -g LESSCOLORIZER="pygmentize"
  export LESSCOLORIZER
fi

################################################################################

# LESSOPEN
#   less - opposite of more
#
# Command line to invoke the (optional) input-preprocessor.
#
# Source-highlight - convert source code to syntax highlighted document

if type src-hilite-lesspipe.sh > /dev/null; then
  declare -g LESSOPEN="| src-hilite-lesspipe.sh %s"
  export LESSOPEN
fi

################################################################################

# LS_COLORS
#   ls - list directory contents
#
# Using color to distinguish file types is disabled both by default and with
# --color=never.  With --color=auto, ls emits color codes only when standard
# output is connected to a terminal.  The LS_COLORS environment variable can
# change the settings.  Use the dircolors command to set it.

if type dircolors > /dev/null; then
  eval "$(dircolors "${XDG_CONFIG_HOME}/dircolors/database")"
fi

################################################################################

# MAKEFLAGS
#   make - GNU make utility to maintain groups of programs
#
# This is often used to set the number of jobs used; for example, -j2.  Other
# flags that make accepts can also be passed.
#
# -j [jobs], --jobs[=jobs]
#   Specifies the number of jobs (commands) to run simultaneously.  If there is
#   more than one -j option, the last one is effective.  If the -j option is
#   given without an argument, make will not limit the number of jobs that can
#   run simultaneously.
#

if type nproc > /dev/null; then
  declare -g MAKEFLAGS="-j$(nproc)"
  export MAKEFLAGS
fi

################################################################################

# PAGER
#   environ - user environment
#
# The user's preferred utility to display text files
#
# less - opposite of more

declare -g PAGER="less"
export PAGER

################################################################################

# PATH
#   environ - user environment
#
# The sequence of directory prefixes that sh(1) and many other programs apply in
# searching for a file known by an incomplete pathname.  The prefixes are
# separated by ':'.  (Similarly one has CDPATH used by some shells to find the
# target of a change directory command, MANPATH used by man(1) to find manua
# pages, and so on)

# prepend $HOME/.local/bin to PATH if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

# append GOBIN or GOPATH/bin to PATH if go is installed
if type go > /dev/null; then
  if [[ -n $(go env GOBIN) ]]; then
    PATH="${PATH}:$(go env GOBIN)"
  else
    PATH="${PATH}:$(go env GOPATH)/bin"
  fi
fi

# append $HOME/.cargo/bin to PATH if it exists
if [[ -d "${HOME}/.cargo/bin" ]]; then
  PATH="${PATH}:${HOME}/.cargo/bin"
fi

# append user gem bin path to PATH if ruby is installed
# this is typically $HOME/.gem/x.y.z/bin
if type ruby > /dev/null; then
  local gem_bin_path="$(ruby -e "puts File.join(Gem.user_dir, 'bin')")"
  if [[ -d "${gem_bin_path}" ]]; then
    PATH="${PATH}:${gem_bin_path}"
  fi
  unset gem_bin_path
fi

################################################################################

# SSH_AUTH_SOCK
#   ssh — OpenSSH SSH client (remote login program)
#
# Identifies the path of a UNIX-domain socket used to communicate with the
# agent.

# set SSH_AUTH_SOCK to point to gpg-agent socket, if it exists
if [[ -n "${XDG_RUNTIME_DIR}" && -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh" ]]; then
  declare -g SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
  export SSH_AUTH_SOCK
elif [[ -S "${GNUPGHOME}/S.gpg-agent.ssh" ]]; then
  declare -g SSH_AUTH_SOCK="${GNUPGHOME}/S.gpg-agent.ssh"
  export SSH_AUTH_SOCK
fi

################################################################################

# VISUAL
#   environ - user environment
#
# The user's preferred utility to edit text files

declare -g VISUAL="$(__editor)"
export VISUAL

################################################################################

# XDG_*_DIR
#   XDG User DIrectory

if type xdg-user-dirs-update > /dev/null; then
  xdg-user-dirs-update
fi

local a
while read -r "line"; do
  if [[ "${line}" =~ "^#" ]]; then
    continue
  fi

  eval "declare -g ${line}"

  # split line on '='
  a=("${(@s/=/)line}")
  eval "export ${a[1]}"
done < "${XDG_CONFIG_HOME:-${HOME}/.config}/user-dirs.dirs"
unset a

################################################################################

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

declare -g XZ_OPT="--threads=0"
export XZ_OPT

################################################################################

# HELPER TEARDOWN

unset __editor
