# Git Add Commit Push
gacp() {
    # Add, commit and pushes changed files to the current branch
    git add .
    git commit -m "$1"
    git push origin HEAD
}

# Git Commit
gc() {
    git commit -m "$1"
}

# Git CHeckout
gch() {
    git checkout $1
}

if [ -f ~/.custom_aliases ]; then
        . ~/.custom_aliases
fi