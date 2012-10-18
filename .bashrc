#
# ~/.bashrc
#
[[ $- != *i* ]] && return

#--- PROMPT ---
PS1='\[\e[1;32m\][\u\[\e[0m\] \[\e[0;37m\]\W\[\e[0m\]\[\e[1;32m\]]\$\[\e[0m\] '

#--- ALIAS ---
alias ls='ls --color=auto'
alias vi='vim'
alias diff='colordiff'
alias bashrc='vim ~/.bashrc && . ~/.bashrc'
alias reload='. ~/.bashrc'

#--- GIT-ALIAS ---
function gitpush()
{
    git checkout $2 
    git merge $1
    git push origin $2
    git checkout $1
}
function gitpull()
{
    git checkout $1
    git pull origin $1
    git checkout $2
    git merge $1
}

alias gitpush=gitpush
alias gitpull=gitpull
alias gitinfo='git remote -v && git branch -a -v && git status'
alias gitignore='vim .gitignore'

#--- NETWORK ---
alias freshmilk='thunar smb://192.168.0.106/'
alias freshmilknettv='thunar smb://192.168.0.123/'
alias freshmilk_austausch='thunar smb://192.168.0.106/dokumente/Austausch/Daniel/'
