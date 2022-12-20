#!/bin/sh

PROMPT=/home/dan/.dotfiles/scripts/prompt/global.sh
[ -f "$PROMPT" ] && . "$PROMPT"

PROMPT_USER="${PROMPT_COLOR_RED}\u${PROMPT_COLOR_RESET}"
PROMPT_END="${PROMPT_COLOR_RED}#${PROMPT_COLOR_RESET}"
PS1="${PROMPT_USER} ${PROMPT_PATH}\n${PROMPT_END} "
