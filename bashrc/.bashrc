# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


##############
## Starship ##
##############
eval "$(starship init bash)"
PROMPT_COMMAND='PS1="$(starship prompt)"'


###########
## SHOPT ##
###########
shopt -s histappend
shopt -s checkwinsize


#############
## EXPORTS ##
#############
export HISTSIZE=500
export HISTFILESIZE=10000
export HISTTIMEFORMAT="| %F %T | " # Add timestamp to history
export HISTCONTROL=erasedups:ignoredups:ignorespace
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME=tokyonight_night


###################
## General Alias ##
###################
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash'
alias trashbin='cd $HOME/.local/share/Trash/files'
alias rmm='\rm'
alias mkdir='mkdir -p'
alias less='less -R'
alias lesss='\less'
alias cl='clear'
alias h='history'
alias cd..='cd ..'
alias ..='cd ..'
alias cd='z'
alias cdd='\cd'
alias e="exit"
alias q="exit"
alias :q="exit"
alias v='nvim'
alias vim='nvim'
alias vvim='\vim'
alias vimm='\vim'
alias v.='nvim .'
alias vv='nvim .'
alias l="eza --color=always --long --git --no-filesize --icons=always --no-user --almost-all"	
alias ll='\ls -alF'
alias lss='\ls -A'
alias cat='bat'
alias catt='\cat'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias python='python3'
if command -v rg &> /dev/null; then
    alias grep='rg'
    alias grepp='\grep'
fi
alias +x='chmod +x'
alias km='xmodmap ~/.Xmodmap'

alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'
alias ts='tmux-sessionizer'

alias f='thunar . > /dev/null 2>&1 &'
alias config='nvim ~/.bashrc'
alias nconfig='nvim ~/.config/nvim/init.lua'
alias wconfig='nvim ~/.wezterm.lua'
alias sconfig='nvim ~/.config/starship.toml'
alias tconfig='nvim ~/.tmux.conf'
alias kmconfig='nvim ~/.Xmodmap'
alias i3config='nvim ~/.config/i3/config'
alias pconfig='nvim ~/.config/picom.conf'
alias poconfig='nvim ~/.config/polybar/config.ini'
alias sb='source ~/.bashrc'
alias down='cd ~/Downloads/'
alias .config='cd ~/.config/'
alias dotfiles='cd ~/dotfiles/'
alias nvimswap='cd ~/.local/state/nvim/swap/'
alias chrome='google-chrome'
alias c='google-chrome'
alias stremio='nohup flatpak run com.stremio.Stremio > /dev/null 2>&1 &'
alias lg='lazygit'
alias gp='git pull'
alias gP='git push'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias sp='spotify_player'
alias bluetooth='bluetoothctl'
alias bonsai='cbonsai --life 50 --live --infinite --screensaver'
alias matrix='cmatrix -bs'
alias mountpen='udisksctl mount -b /dev/sda1'
alias unmountpen='udisksctl unmount -b /dev/sda1'
alias forceunmountpen='sudo unmount -l /dev/sda1'
alias pen='cd /media/afonsoabc36/465A-7EC2/'
alias drives='lsblk'
alias setvolume='pactl set-sink-volume @DEFAULT_SINK@'
alias sv='pactl set-sink-volume @DEFAULT_SINK@'
alias sus='systemctl suspend'
alias shut='shutdown now'
alias ld='lsblk'
alias bch='bluetoothctl connect FC:58:FA:13:72:62'
alias bck='bluetoothctl connect DC:2C:26:DB:98:6A'

# Last alias (For faster searching and adding of alias)

#######################
## Special Functions ##
#######################
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case "$archive" in
			*.tar.bz2) tar xvjf "$archive" ;;
			*.tar.gz) tar xvzf "$archive" ;;
			*.bz2) bunzip2 "$archive" ;;
			*.rar) rar x "$archive" ;;
			*.gz) gunzip "$archive" ;;
			*.tar) tar xvf "$archive" ;;
			*.tbz2) tar xvjf "$archive" ;;
			*.tgz) tar xvzf "$archive" ;;
			*.zip) unzip "$archive" ;;
			*.Z) uncompress "$archive" ;;
			*.7z) 7z x "$archive" ;;
			*) echo "Don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
    *) color_prompt=no;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    # ;;
# *)
    # ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    # alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################
## University ##
################

alias 2a='cd ~/Desktop/2ano/'
alias 3a='cd ~/Desktop/3ano/'
alias 3a1='cd ~/Desktop/3ano/1Semestre/'
alias 3a2='cd ~/Desktop/3ano/2Semestre/'
alias 4a='cd ~/Desktop/4ano/'
alias 4a1='cd ~/Desktop/4ano/1Semestre/'
alias 4a2='cd ~/Desktop/4ano/2Semestre/'

eg() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/EG/"; else target_dir="$HOME/Desktop/4ano/2Semestre/EG/${1}Aula"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
egp="$HOME/Desktop/4ano/2Semestre/EG"
egptp="$HOME/Desktop/4ano/2Semestre/EG/Projeto"
egtp() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/EG/Projeto/"; else target_dir="$HOME/Desktop/4ano/2Semestre/EG/Projeto/${1}TP"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
alias egs='cd ~/Desktop/4ano/2Semestre/EG/Slides/'
egtpc() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/EG/TPC/"; else target_dir="$HOME/Desktop/4ano/2Semestre/EG/TPC/TPC${1}"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }

npr() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/NPR/"; else target_dir="$HOME/Desktop/4ano/2Semestre/NPR/${1}Aula"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
nprp="$HOME/Desktop/4ano/2Semestre/NPR"
alias nprtp='cd ~/Desktop/4ano/2Semestre/NPR/Projeto/G3App/'
nprptp="$HOME/Desktop/4ano/2Semestre/NPR/Projeto/G3App"
alias nprs='cd ~/Desktop/4ano/2Semestre/NPR/Slides/'

rfm() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/RFM/"; else target_dir="$HOME/Desktop/4ano/2Semestre/RFM/${1}Aula"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
rfmtp() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/RFM/Projeto/TP2/"; else target_dir="$HOME/Desktop/4ano/2Semestre/RFM/Projeto/TP${1}"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
rfmp="$HOME/Desktop/4ano/2Semestre/RFM"
rfmptp="$HOME/Desktop/4ano/2Semestre/RFM/Projeto/TP2"
alias rfms='cd ~/Desktop/4ano/2Semestre/RFM/Slides/'

rpcw() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/RPCW/"; else target_dir="$HOME/Desktop/4ano/2Semestre/RPCW/${1}Aula"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
rpcwp="$HOME/Desktop/4ano/2Semestre/RPCW"
alias rpcwtp='cd ~/Desktop/4ano/2Semestre/RPCW/Projeto/'
rpcwptp="$HOME/Desktop/4ano/2Semestre/RPCW/Projeto"
alias rpcws='cd ~/Desktop/4ano/2Semestre/RPCW/Slides/'
rpcwtpc() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/RPCW/RPCW2025/"; else target_dir="$HOME/Desktop/4ano/2Semestre/RPCW/RPCW2025/TP${1}/"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }

rds() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/RDS/"; else target_dir="$HOME/Desktop/4ano/2Semestre/RDS/${1}Aula"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
rdsp="$HOME/Desktop/4ano/2Semestre/RDS"
alias rdstp='cd ~/Desktop/4ano/2Semestre/RDS/Projeto/RDS-MLSPNetwork/'
rdsptp="$HOME/Desktop/4ano/2Semestre/RDS/Projeto/RDS-MLSPNetwork"
alias rdss='cd ~/Desktop/4ano/2Semestre/RDS/Slides/'

spln() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/SPLN/"; else target_dir="$HOME/Desktop/4ano/2Semestre/SPLN/${1}Aula"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }
splnp="$HOME/Desktop/4ano/2Semestre/SPLN"
alias splntp='cd ~/Desktop/4ano/2Semestre/SPLN/Projeto/'
splnptp="$HOME/Desktop/4ano/2Semestre/SPLN/Projeto"
alias splns='cd ~/Desktop/4ano/2Semestre/SPLN/Slides/'
splntpc() { if [ -z "$1" ]; then cd "$HOME/Desktop/4ano/2Semestre/SPLN/SPLN/"; else target_dir="$HOME/Desktop/4ano/2Semestre/SPLN/SPLN/TPC${1}"; if [ ! -d "$target_dir" ]; then echo "Directory not found!"; else cd "$target_dir"; fi; fi; }

#########
## FZF ##
#########
export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/node_modules/*" -not -path "*/venv/*" -not -path "*/.git/*" -not -path "*/__pycache__/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() { fd --hidden --exclude .git . "$1"; }
_fzf_compgen_dir() { fd --type=d --hidden --exclude .git . "$1"; }
# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"
export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}
if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
fi
if [ -f /usr/share/doc/fzf/examples/completion.bash ]; then
  source /usr/share/doc/fzf/examples/completion.bash
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

##############
## Greeting ##
##############
cowfiles=("pikachu" "wall-e" "winnie")
currentcowfile=${cowfiles[$RANDOM % ${#cowfiles[@]}]}
echo -e  "                 I'm a programmer                 I make computer go beep boop"| fmt -w 50 | cowsay -f $currentcowfile

# Syntax Highlighting
#source ~/.local/share/blesh/ble.sh
export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.12/bin:$PATH"
