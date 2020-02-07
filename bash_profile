#!/bin/sh
#
# ~/.bash_profile
#

# shellcheck source=/home/dan/.bashrc
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

if [ -z "$DISPLAY" ] && [ "$(tty)" = /dev/tty1 ]; then
  exec startx
fi

PATH_ANDROID_PLATFORM=/opt/android-sdk/platform-tools/
PATH_ANDROID_TOOLS=/opt/android-sdk/tools/
PATH_RUBY_BIN="$(ruby -e 'print Gem.user_dir')/bin"
PATH_NPM_BIN="$HOME/.npm-global/bin"
export PATH="$PATH:$PATH_ANDROID_PLATFORM:$PATH_ANDROID_TOOLS:$PATH_RUBY_BIN:$PATH_NPM_BIN"

# shellcheck source=/home/dan/.config/nvim/bundle/gruvbox/gruvbox_256palette.sh
. "$HOME/.config/nvim/bundle/gruvbox/gruvbox_256palette.sh"
