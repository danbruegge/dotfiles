#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi

export PATH=${PATH}:/opt/android-sdk/platform-tools/:/opt/android-sdk/tools/
