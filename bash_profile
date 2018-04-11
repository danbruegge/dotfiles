#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi

export PATH=${PATH}:/opt/android-sdk/platform-tools/:/opt/android-sdk/tools/:$(ruby -e 'print Gem.user_dir')/bin

export PATH=~/.npm-global/bin:${PATH}

source "$HOME/.config/nvim/bundle/gruvbox/gruvbox_256palette.sh"
