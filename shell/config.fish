export $XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim
export BROWSER=firefox-developer-edition

alias ls='exa -a -l -F -m -u -h --git --group-directories-first'
alias vim='nvim'
alias wifi='nmtui'
alias vimc='nvim ~/.config/nvim/init.vim'
alias vimi3='nvim ~/.config/i3/config'
alias vimbsp='nvim ~/.config/bspwm/bspwmrc'
alias vimsxhkd='nvim ~/.config/sxhkd/sxhkdrc'
alias vimcompton='nvim ~/.config/compton/compton.conf'
alias vimpoly='nvim ~/.config/polybar/config'
alias reddit='rtv'
alias contacts='abook'

alias emacsi3='emacs ~/.config/i3/config'
alias emacsbsp='emacs ~/.config/bspwm/bspwmrc'
alias emacssxhkd='emacs ~/.config/sxhkd/sxhkdrc'
alias emacscompton='emacs ~/.config/compton/compton.conf'
alias emacspoly='emacs ~/.config/polybar/config'

alias reflector='sudo reflector --verbose --latest 10 --country US --sort rate --save /etc/pacman.d/mirrorlist'

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end
