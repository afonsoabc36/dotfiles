#!/usr/bin/env zsh
## MANAGED ZSHRC INFRA CONFIGURATION - Do not edit manually ##
# ========================================================= #
for lib in "${HOME}/.zshrc.d/"*; do
  # use for debugging
  [ -r "$lib" ] && source "$lib"
done

# Set the path for oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
# Load oh-my-zsh if installed
if [ -d "$ZSH" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# Load antigen if available
if [ -f "${DIR_LOCAL_DOTCONF}/antigen.zsh" ]; then
  # Load Antigen
  source ${DIR_LOCAL_DOTCONF}/antigen.zsh
  # Load Antigen configurations
  antigen init ${DIR_LOCAL_DOTCONF}/.antigenrc
fi

# set shell colors
export LSCOLORS=exfxcxdxgxegedabagacad

# Initialize Starship prompt
# if command -v starship >/dev/null 2>&1; then
#   # STARSHIP_CONFIG is set dynamically by the theme system
#   export STARSHIP_HIDE_RIGHT_PROMPT_ON_INPUT=true
#   eval "$(starship init zsh)"
# fi

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  fzf-tab
  zsh-you-should-use
  zsh-vi-mode
)

fpath=($DIR_GIT_INFRA_SHELL_LIB/complition $fpath)

# Register the completion function with Zsh
autoload -Uz compinit; compinit	
compdef _assume_aws_profile assume_aws_profile
compdef _set_aws_config_by_group set_aws_config_by_group

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'


eval "$(brew shellenv)"
complete -C $(which aws_completer) aws

[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH

# shell bootup setup
# _boot
alias kkac="kubectl kots admin-console"
alias l="eza --color=always --long --git --no-filesize --icons=always --no-user --almost-all"
alias m="messages"
alias re="bat ~/notes/regions.md"
alias lg='lazygit'
