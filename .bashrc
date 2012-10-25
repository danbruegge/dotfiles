#
# ~/.bashrc
#
[[ $- != *i* ]] && return

#--- PROMPT ---
PS1='\[\e[1;32m\][\u\[\e[0m\] \[\e[0;37m\]\W\[\e[0m\]\[\e[1;32m\]]\$\[\e[0m\] '

#--- LOAD BASH COMMON ---
. ~/.bashrc_common
