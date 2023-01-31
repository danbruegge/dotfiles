#!/bin/sh
#
# ~/.bash_profile
#

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

if [ -z "$DISPLAY" ] && [ "$(tty)" = /dev/tty1 ] && [[ "$OSTYPE" =~ "linux" ]]; then
  exec startx
fi

if [[ "$OSTYPE" =~ "darwin" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

PATH_NPM="$HOME/.npm-global/bin:$HOME/.local/bin"
export PATH="$PATH:$PATH_NPM"
