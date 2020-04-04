#! /usr/bin/env zsh

local plugins_dir="/usr/share/zsh/plugins"

local source_dir="${HOME}/.config/zsh/public"

source "${source_dir}/options.zsh"

source "${source_dir}/environment.zsh"
source "${source_dir}/global.zsh"

source "${source_dir}/_git_prompt.zsh"
source "${source_dir}/_ps1.zsh"

source "${plugins_dir}/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${plugins_dir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

source "${plugins_dir}/zsh-history-substring-search/zsh-history-substring-search.zsh"

source "${source_dir}/alias.zsh"
source "${source_dir}/completion.zsh"
source "${source_dir}/zle.zsh"
source "${source_dir}/zutil.zsh"

source "${source_dir}/lgr.zsh"

unset plugins_dir
unset source_dir
