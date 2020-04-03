#! /usr/bin/env zsh

local source_dir="${HOME}/.config/zsh/public"

source "${source_dir}/options.zsh"

source "${source_dir}/environment.zsh"
source "${source_dir}/global.zsh"

source "${source_dir}/_git_prompt.zsh"
source "${source_dir}/_ps1.zsh"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

source "${source_dir}/completion.zsh"
source "${source_dir}/zle.zsh"
source "${source_dir}/zutil.zsh"

unset source_dir
