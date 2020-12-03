# Git Add Commit Push
gacp() {
    # Add, commit and pushes changed files to the current branch
    git status
    git add .
    git commit -m "$1"
    git push origin HEAD
}

# Git tag
gt() {
    git status
    git tag -a v$1 -m "release v$1"
    git push origin v$1
}

# Git remove tag
gt_del() {
    git status
    # delete local tag
    git tag -d v$1

    # push deleted tag
    git push -d origin v$1
}

# Git Commit
gc() {
    git commit -m "$1"
}

# Git CHeckout
gch() {
    git checkout $1
}


## Version Control
alias gs="git status"
alias ga="git add ."
# alias gc --> see file "~/.bashrc" ## git commit
alias gp="git push origin HEAD"
# alias gacp --> see file "~/.bashrc"
alias gpa="git pull --all"


## Docker
alias dpa="docker ps -a"

## Directory
alias diskusage="df -h"
alias folderusage="du -ch"
alias totalfolderusage="du -sh"
alias c="cd .."
alias la="ls -al"


## Various
alias opencustomaliases="code  ~/.custom_aliases"
alias updatecustomaliases="source ~/.bashrc"
alias updatethenupgrade="sudo apt-get update && sudo apt-get upgrade"