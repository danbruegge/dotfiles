#!/bin/bash
# ~/.bashrc

[[ $- != *i* ]] && return

export TERM="screen-256color"

# =============================================================================
# CUSTOM VARIABLES
# =============================================================================
ALIASES="$HOME/.dotfiles/scripts/aliases/*"
BASHRCGLOBAL=$HOME/.dotfiles/scripts/bashrc_global
USER_PROMPT=$HOME/.dotfiles/scripts/prompt/user.sh

# =============================================================================
# XDG
# =============================================================================

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# =============================================================================
# HISTORY
# =============================================================================
export HISTSIZE=10000
export HISTCONTROL=ignoreboth:erasedups   # no duplicate entries
shopt -s histappend                       # append history file

# =============================================================================
# PROMPT
# =============================================================================

[ -f "$USER_PROMPT" ] && source "$USER_PROMPT"

# =============================================================================
# GET GLOBAL BASHRC STUFF
# =============================================================================

[ -f "$BASHRCGLOBAL" ] && source "$BASHRCGLOBAL"

# =============================================================================
# GET ALIASES
# =============================================================================
for f in $ALIASES; do
  [ -f "$f" ] && source "$f"
done

# =============================================================================
# Force Libreoffice to use gtk2
# =============================================================================
export SAL_USE_VCLPLUGIN=gtk

# =============================================================================
# Good bash tips for everyone
# =============================================================================

function bashtips() {
# copyright 2007 - 2010 Christopher Bratusek
cat <<EOF
DIRECTORIES
-----------
~-          Previous working directory
pushd tmp   Push tmp && cd tmp
popd        Pop && cd
GLOBBING AND OUTPUT SUBSTITUTION
--------------------------------
ls a[b-dx]e Globs abe, ace, ade, axe
ls a{c,bl}e Globs ace, able
\$(ls)      \`ls\` (but nestable!)
HISTORY MANIPULATION
--------------------
!!        Last command
!?foo     Last command containing \`foo'
^foo^bar^ Last command containing \`foo', but substitute \`bar'
!!:0      Last command word
!!:^      Last command's first argument
!\$       Last command's last argument
!!:*      Last command's arguments
!!:x-y    Arguments x to y of last command
C-s       search forwards in history
C-r       search backwards in history
LINE EDITING
------------
M-d     kill to end of word
C-w     kill to beginning of word
C-k     kill to end of line
C-u     kill to beginning of line
M-r     revert all modifications to current line
C-]     search forwards in line
M-C-]   search backwards in line
C-t     transpose characters
M-t     transpose words
M-u     uppercase word
M-l     lowercase word
M-c     capitalize word
COMPLETION
----------
M-/     complete filename
M-~     complete user name
M-@     complete host name
M-\$    complete variable name
M-!     complete command name
M-^     complete history
EOF
}

# https://github.com/carlitux/deoplete-ternjs
ulimit -n 2048

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# export FZF_DEFAULT_COMMAND='ag -g ""'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='rg --hidden -g "!.git/*" -g "!dist/*" --files --smart-case'

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[ -f /home/dan/.config/yarn/global/node_modules/tabtab/.completions/yarn.bash ] && . /home/dan/.config/yarn/global/node_modules/tabtab/.completions/yarn.bash
