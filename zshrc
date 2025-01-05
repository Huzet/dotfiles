
# ZSHRC                  #
#                        #
#Chekko                  #
##########################

# Welcome message
printf "%b""⠀
⠀⠀⠀⠀⣴⠉⡙⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⣚⡯⠴⢬⣱⡀⠀
⠀⠀⠀⠀⢰⡇⣷⡌⢲⣄⡑⢢⡀⠀⠀⠀⠀⠀⢠⠾⢋⠔⣨⣴⣿⣷⡌⠇⡇⠀
⠀⠀⠀⠀⢸⢹⣿⣿⣄⢻⣿⣷⣝⠷⢤⣤⣤⡶⢋⣴⣑⠟⠿⠿⠿⣿⣿⡀⡇⠀
⠀⠀⠀⠀⢸⢸⣿⡄⢁⣸⣿⣋⣥⣶⣶⣶⣶⣶⣶⣿⣿⣶⣟⡁⠚⣿⣿⡇⡇⠀
⢀⣠⡤⠤⠾⡘⠋⢀⣘⠋⠉⠉⠉⠉⢭⣭⣭⣭⣍⠉⢩⣭⠉⠉⠂⠙⠛⠃⣇⡀
⠏⠀⠀⢿⣿⣷⡀⠀⢿⡄⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣆⠀⢿⣇⠀⠀⠀⠀⠀⠀⠈⢱
⣦⠀⠀⠈⢿⣿⣧⠀⠘⣿⠀⠀⠀⡀⠀⠀⠘⣿⣿⣿⣿⡆⠀⢻⡆⠀⠀⠀⠀⠀⠀⢸
⢻⡄⠀⠀⠘⠛⠉⠂⠀⠙⠁⠀⣼⣧⠀⠀⠀⠈⠀⠀⠈⠙⠀⠘⠓⠀⠀⠀⠀⠀⢀⡟
⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣏⠀
⠀⠀⠛⢶⢰⣶⢢⣤⣤⣄⠲⣶⠖⠀⣙⣀⠀⠀⠀⠤⢤⣀⣀⡀⣀⣠⣾⠟⡌⠀
⠀⠀⠀⠘⢄⠃⣿⣿⣿⣿⠗⠀⠾⢿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⠸⠟⣡⣤⡳⢦
⠀⠀⠀⠀⠀⢻⡆⣙⡿⢷⣾⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⡿⠟⢡⣴⣾⣿⣿⣿⣦
⠀⠀⠀⠀⠀⡼⢁⡟⣫⣶⣍⡙⠛⠛⠛⠛⠛⣽⡖⣉⣠⣶⣶⣌⠛⢿⣿⣿⣿⣿
⠀⠀⠀⢀⠔⢡⢎⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿⣿⣿
⠀⢠⠖⢁⣴⡿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢹⣿⣿

"

# Prompt
PROMPT="%F{cyan}%. %? >%f"
autoload -U promptinit && promptinit
autoload -U colors && colors

# terminal text color
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Alias
alias ~="cd ~"
alias ls='ls -GpF'
alias grep='grep --color=auto'
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox'
alias vscode='open -a Visual\ Studio\ Code'
alias safari='open -a safari' 
alias codedir="cd ~/projects/code/"
alias ll="ls -lah"
alias ssh_pi_hole="ssh chekko@192.168.0.13"
alias ssh_ubuntu="ssh chekko@192.168.0.4"

# Text Editor
export EDITOR="nvim"

# Java Python
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export python="/usr/bin/python3"
export PATH=$PATH:$JAVA_HOME:$PYTHON

# Customize Path
export PATH=$HOME/bin:$PATH

# Git
autoload -Uz compinit && compinit

# Enable vim command line
bindkey -v
if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

#export FZF_ALT_C_COMMAND='fd type d . --hidden'
export FZF_ALT_C_OPTS="
    --preview 'tree -C {}'"

# History
export HISTSIZE=1000000000

# Run Help command setup
autoload -Uz run-help

# Source private zshrc files
./private_zshrc.sh
