PROMPT=$HOME/.dotfiles/custom/prompt/global.sh
[ -f "$PROMPT" ] && source "$PROMPT"

PROMPT_USER="${PROMPT_COLOR_GREEN}[\u${PROMPT_COLOR_RESET} "
PROMPT_END="${PROMPT_COLOR_GREEN}]\$${PROMPT_COLOR_RESET} "
PS1="${PROMPT_USER}${PROMPT_PATH}${PROMPT_GIT}${PROMPT_END}"
