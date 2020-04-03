#! /usr/bin/env zsh

# SPECIFYING OPTIONS
#
# Options are primarily referred to by name.  These names are case insensitive
# and underscores are ignored.  For example, `allexport' is  equivalent to
# `A__lleXP_ort'.
#
# The sense of an option name may be inverted by preceding it with `no', so
# `setopt No_Beep' is equivalent to `unsetopt beep'.  This inversion can only be
# done once, so `nonobeep' is not a synonym for `beep'.  Similarly, `tify' is
# not a synonym for `nonotify' (the inversion of `notify').

# APPEND_HISTORY
#
# If this is set, zsh sessions will append their history list to the history
# file, rather than replace it.  Thus, multiple parallel zsh sessions will all
# have the new entries from their history lists added to the history file, in
# the order that they exit.  The file will still be periodically re-written to
# trim it when the number of lines grows 20% beyond the value specified by
# $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt APPEND_HISTORY

# AUTO_PUSHD
#
# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# CHASE_LINKS
#
# Resolve symbolic links to their true values when changing directory. This also
# has the effect of CHASE_DOTS, i.e. a ‘..’ path segment will be treated as
# referring to the physical parent, even if the preceding path segment is a
# symbolic link.
setopt CHASE_LINKS

# CORRECT_ALL
#
# Try to correct the spelling of all arguments in a line.
#
# The shell variable CORRECT_IGNORE_FILE may be set to a pattern to match file
# names that will never be offered as corrections.
setopt CORRECT_ALL

# GLOB_DOTS
#
# Do not require a leading ‘.’ in a filename to be matched explicitly.
setopt GLOB_DOTS

# HASH_LIST_ALL
#
# Whenever a command completion or spelling correction is attempted, make sure
# the entire command path is hashed first.  This makes the first completion
# slower but avoids false reports of spelling errors.
setopt HASH_LIST_ALL

# HIST_IGNORE_DUPS
#
# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt HIST_IGNORE_DUPS

# HIST_IGNORE_SPACE
#
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space.
# Only normal aliases (not global or suffix aliases) have this behaviour.  Note
# that the command lingers in the internal history until the next command is
# entered before it vanishes, allowing you to briefly reuse or edit the line.
# If you want to make it vanish right away without entering another command,
# type a space and press return.
setopt HIST_IGNORE_SPACE

# INC_APPEND_HISTORY_TIME
#
# This option is a variant of INC_APPEND_HISTORY in which, where possible, the
# history entry is written out to the file after the command is finished, so
# that the time taken by the command is recorded correctly in the history file
# in EXTENDED_HISTORY format.  This means that the history entry will not be
# available immediately from other instances of the shell that are using the
# same history file.
#
#This option is only useful if INC_APPEND_HISTORY and SHARE_HISTORY are turned
# off.  The three options should be considered mutually exclusive.
setopt INC_APPEND_HISTORY_TIME

# PIPE_FAIL
#
# By default, when a pipeline exits the exit status recorded by the shell and
# returned by the shell variable $? reflects that of the rightmost element of a
# pipeline.  If this option is set, the exit status instead reflects the status
# of the rightmost element of the pipeline that was non-zero, or zero if all
# elements exited with zero status.
setopt PIPE_FAIL

# POSIX_ALIASES
#
# When this option is set, reserved words are not candidates for alias
# expansion:  it is still possible to declare any of them as an alias, but the
# alias will never be expanded.  Reserved words are described in Reserved Words.
#
# Alias expansion takes place while text is being read; hence when this option
# is set it does not take effect until the end of any function or other piece of
# shell code parsed as one unit.  Note this may cause differences from other
# shells even when the option is in effect.  For example, when running a command
# with ‘zsh -c’, or even ‘zsh -o posixaliases -c’, the entire command argument
# is parsed as one unit, so aliases defined within the argument are not
# available even in later lines.  If in doubt, avoid use of aliases in
# non-interactive code.
setopt POSIX_ALIASES

# PROMPT_PERCENT
#
# If set, `%' is treated specially in prompt expansion.  See EXPANSION OF PROMPT
# SEQUENCES in zshmisc(1).
setopt PROMPT_PERCENT

# PROMPT_SUBST
#
# If set, parameter expansion, command substitution and arithmetic expansion are
# performed in prompts.  Substitutions within prompts do not affect the command
# status.
setopt PROMPT_SUBST

# WARN_CREATE_GLOBAL
#
# Print a warning message when a global parameter is created in a function by an
# assignment or in math context.  This often indicates that a parameter has not
# been declared local when it should have been.  Parameters explicitly declared
# global from within a function using typeset -g do not cause a warning.  Note
# that there is no warning when a local parameter is assigned to in a nested
# function, which may also indicate an error.
setopt WARN_CREATE_GLOBAL
