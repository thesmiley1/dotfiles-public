#! /usr/bin/env zsh

local plugin

local plugins=(
  "zsh-autosuggestions"
  "zsh-syntax-highlighting"

  "zsh-history-substring-search"
)

# Arch packages install zsh plugins in `/usr/share/zsh/plugins`, but Ubuntu
# (20.04) installs them to `/usr/share`.
local plugins_dir="/usr/share"
if [[ -d "${plugins_dir}/zsh/plugins" ]]; then
  plugins_dir="${plugins_dir}/zsh/plugins"
fi

local source_dir="${XDG_CONFIG_HOME}/zsh/public"

source "${source_dir}/options.zsh"

source "${source_dir}/environment.zsh"
source "${source_dir}/global.zsh"

source "${source_dir}/git-prompt.zsh"
source "${source_dir}/prompt.zsh"

for plugin in "${plugins[@]}"; do
  if [[ -e "${plugins_dir}/${plugin}/${plugin}.zsh" ]]; then
    source "${plugins_dir}/${plugin}/${plugin}.zsh"
  fi
done

source "${source_dir}/alias.zsh"
source "${source_dir}/completion.zsh"
source "${source_dir}/dotenv.zsh"
source "${source_dir}/title.zsh"
source "${source_dir}/zle.zsh"
source "${source_dir}/zutil.zsh"

source "${source_dir}/lgr.zsh"

if [[ -e "${HOME}/.homesick/repos/homeshick/homeshick.sh" ]]; then
  source "${HOME}/.homesick/repos/homeshick/homeshick.sh"
  homeshick refresh --quiet
fi

unset plugin
unset plugins
unset plugins_dir
unset source_dir
