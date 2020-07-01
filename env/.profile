export $XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/qutebrowser

alias ls='exa -a --git --group-directories-first'
alias lsl='exa -a -l -F -m -u -h --git --group-directories-first'

alias contacts='abook'

alias vim='nvim'
alias vimc='nvim ~/.config/nvim/init.vim'
alias vimi3='nvim ~/.config/i3/config'
alias vimbsp='nvim ~/.config/bspwm/bspwmrc'
alias vimsxhkd='nvim ~/.config/sxhkd/sxhkdrc'
alias vimpi='~/.config/picom/picom.conf'
alias vimpoly='nvim ~/.config/polybar/config'

alias tmuxdev='tmux -f ~/.config/tmux/tmux.conf new -s Dev'

alias reflector='sudo reflector --verbose --latest 10 --country US --sort rate --save /etc/pacman.d/mirrorlist'

alias tpon='xinput --set-prop "AlpsPS/2 ALPS GlidePoint" "Device Enabled" 1'
alias tpoff='xinput --set-prop "AlpsPS/2 ALPS GlidePoint" "Device Enabled" 0'

export PATH="$HOME/.cargo/bin:$PATH"
