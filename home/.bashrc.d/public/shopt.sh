#! /usr/bin/env bash

# See bash(1)
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

# If set, a command name that is the name of a directory is executed as if it
# were the argument to the cd command.  This option is only used by interactive
# shells.
shopt -s autocd

# If set, minor errors in the spelling of a directory component in a cd command
# will be corrected.  The errors checked for are transposed characters, a
# missing character, and one character too many.  If a correction is found, the
# corrected filename is printed, and the command proceeds.  This option is only
# used by interactive shells.
shopt -s cdspell

# If set, bash attempts spelling correction on directory names during word
# completion if the directory name initially supplied does not exist.
shopt -s dirspell

# If set, bash includes filenames beginning with a `.' in the results of
# pathname expansion.  The filenames ``.''  and ``..''  must always be matched
# explicitly, even if dotglob is set.
shopt -s dotglob

# If set, patterns which fail to match filenames during pathname expansion
# result in an expansion error.
shopt -s failglob

# If set, the pattern ** used in a pathname expansion context will match all
# files and zero or more directories and subdirectories.  If the pattern is
# followed by a /, only directories and subdirectories match.
shopt -s globstar

# If set, and readline is being used, bash will not attempt to search the PATH
# for possible completions when completion is attempted on an empty line.
shopt -s no_empty_cmd_completion

# If set, bash matches filenames in a case-insensitive fashion when performing
# pathname expansion (see Pathname Expansion above).
shopt -s nocaseglob

# If set, bash allows patterns which match no files (see Pathname Expansion
# above) to expand to a null string, rather than themselves.
shopt -s nullglob

# If set, and programmable completion is enabled, bash treats a command name
# that doesn't have any completions as a possible alias and attempts alias
# expansion.  If it has an alias, bash attempts programmable completion using
# the command word resulting from the expanded alias.
shopt -s progcomp_alias
