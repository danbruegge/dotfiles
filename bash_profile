#!/bin/sh
#
# ~/.bash_profile
#

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

if [ -z "$DISPLAY" ] && [ "$(tty)" = /dev/tty1 ]; then
  exec startx
fi

PATH_ANDROID_PLATFORM=/opt/android-sdk/platform-tools/
PATH_ANDROID_TOOLS=/opt/android-sdk/tools/
PATH_NPM="$HOME/.npm-global/bin:$HOME/.local/bin"
PATH_RADICLE="$HOME/.radicle/bin"
export PATH="$PATH:$PATH_ANDROID_PLATFORM:$PATH_ANDROID_TOOLS:$PATH_NPM:$PATH_RADICLE"
