alias u='cd ..'
alias v='vim'
alias gs='git status'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -v'

findAndReplace() {
    if [ ! $# -eq 2 ]
    then
        echo "usage: findAndReplace <TEXT_TO_REPLACE> <REPLACEMENT>"
    else
        find . -name ".git" -prune -o -type f -exec sed -i "s/$1/$2/g" {} +
    fi
}

findAndDeleteLines() {
    if [ ! $# -eq 1 ]
    then
        echo "usage: findAndDeleteLines <PATTERN>"
    else
        find . -name ".git" -prune -o -type f -exec sed -i "/$1/g" {} +
    fi
}
