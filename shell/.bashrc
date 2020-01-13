#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias neovim if we have it
if hash "nvim"; then
    alias vim="nvim"
    alias vi="nvim"
else
    alias vi="vim"
fi

alias ls='exa -a --git --group-directories-first'
alias lsl='exa -a -l -F -m -u -h --git --group-directories-first'

alias wifi='nmtui'
alias contacts='abook'

alias vimc='nvim ~/.config/nvim/init.vim'
alias vimi3='nvim ~/.config/i3/config'
alias vimbsp='nvim ~/.config/bspwm/bspwmrc'
alias vimsxhkd='nvim ~/.config/sxhkd/sxhkdrc'
alias vimcompton='nvim ~/.config/compton/compton.conf'
alias vimpoly='nvim ~/.config/polybar/config'

alias reflector='sudo reflector --verbose --latest 10 --country US --sort rate --save /etc/pacman.d/mirrorlist'

PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


# Fish styly Git prompt
#https://github.com/magicmonty/bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.cargo/bin:$PATH"

# Terminals default to Fish
#exec fish
