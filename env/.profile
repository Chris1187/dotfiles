export $XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim
export BROWSER=qutebrowser

alias ls ='exa -a --git --group-directories-first'
alias lsl='exa -a -l -F -m -u -h --git --group-directories-first'

alias wifi='nmtui'
alias reddit='rtv'
alias contacts='abook'

alias vim='nvim'
alias vimc='nvim ~/.config/nvim/init.vim'
alias vimi3='nvim ~/.config/i3/config'
alias vimbsp='nvim ~/.config/bspwm/bspwmrc'
alias vimsxhkd='nvim ~/.config/sxhkd/sxhkdrc'
alias vimcompton='nvim ~/.config/compton/compton.conf'
alias vimpoly='nvim ~/.config/polybar/config'

alias reflector='sudo reflector --verbose --latest 10 --country US --sort rate --save /etc/pacman.d/mirrorlist'

export PATH="$HOME/.cargo/bin:$PATH"
