parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

PROMPT_COLOR_RED="\[\e[1;31m\]"
PROMPT_COLOR_GREEN="\[\e[1;32m\]"
PROMPT_COLOR_GREY="\[\e[0;37m\]"
PROMPT_COLOR_YELLOW="\[\e[0;33m\]"
PROMPT_COLOR_RESET="\[\e[0m\]"

PROMPT_PATH="${PROMPT_COLOR_GREY}\W${PROMPT_COLOR_RESET}"
# PROMPT_GIT="${PROMPT_COLOR_YELLOW}\$(parse_git_branch)${PROMPT_COLOR_RESET}"
