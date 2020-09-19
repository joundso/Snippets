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

if [ -f ~/.custom_aliases ]; then
        . ~/.custom_aliases
fi