#! /usr/bin/env bash

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

  for editor in "${editors[@]}"; do
    if type -t "${editor}" > /dev/null; then
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

EDITOR="$(__editor)"
export EDITOR

################################################################################

# GNUPGHOME
#   gpg - OpenPGP encryption and signing tool
#
# If set directory used instead of "~/.gnupg".

GNUPGHOME="${HOME}/.gnupg"
export GNUPGHOME

################################################################################

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

export LESS="--IGNORE-CASE --RAW-CONTROL-CHARS --tabs=2"

################################################################################

# LESSCOLORIZER
#   lesspipe.sh - a filter for less
#
# A different colorizer can be called within code2color by setting the ENV
# variable LESSCOLORIZER to the name of an alternative (currently only
# pygmentize allowed).

if type -t pygmentize > /dev/null; then
  export LESSCOLORIZER="pygmentize"
fi

################################################################################

# LESSOPEN
#   less - opposite of more
#
# Command line to invoke the (optional) input-preprocessor.
#
# Source-highlight - convert source code to syntax highlighted document

if type -t src-hilite-lesspipe.sh > /dev/null; then
  export LESSOPEN="| src-hilite-lesspipe.sh %s"
fi

################################################################################

# PAGER
#   environ - user environment
#
# The user's preferred utility to display text files
#
# less - opposite of more

export PAGER="less"

################################################################################

# SSH_AUTH_SOCK
#   ssh — OpenSSH SSH client (remote login program)
#
# Identifies the path of a UNIX-domain socket used to communicate with the
# agent.

# set SSH_AUTH_SOCK to point to gpg-agent socket, if it exists
if [[ -n "${XDG_RUNTIME_DIR}" && -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh" ]]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
elif [[ -S "${GNUPGHOME}/S.gpg-agent.ssh" ]]; then
  export SSH_AUTH_SOCK="${GNUPGHOME}/S.gpg-agent.ssh"
fi

################################################################################

# VISUAL
#   environ - user environment
#
# The user's preferred utility to edit text files

VISUAL="$(__editor)"
export VISUAL

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

export XZ_OPT="--threads=0"

################################################################################

# HELPER TEARDOWN

unset __editor

################################################################################
