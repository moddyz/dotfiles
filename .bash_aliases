alias u='cd ..'
alias v='vim'
alias gs='git status'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -v'

findAndReplace() {
    if [ $# -ne 2 ]
    then
        echo "usage: findAndReplace <TEXT_TO_REPLACE> <REPLACEMENT>"
    else
        find . -name ".git" -prune -o -type f -exec sed -i "s/$1/$2/g" {} +
    fi
}

findAndDeleteLines() {
    if [ $# -ne 1 ]
    then
        echo "usage: findAndDeleteLines <PATTERN>"
    else
        find . -name ".git" -prune -o -type f -exec sed -i "/$1/g" {} +
    fi
}

formatCppCode() {
    if [ $# -ne 0 ]
    then
        echo "usage: formatCppCode"
    else
        find . \
            -name ".git" -prune -o \
            -name "build" -prune -o \
            -name "thirdparty" -prune -o \
            -name "*.h" -type f -exec clang-format -i --verbose {} + -o \
            -name "*.cpp" -type f -exec clang-format -i --verbose {} +
    fi
}

formatPythonCode() {
    if [ $# -ne 0 ]
    then
        echo "usage: formatPythonCode"
    else
        find . \
            -name ".git" -prune -o \
            -name "build" -prune -o \
            -name "thirdparty" -prune -o \
            -name "*.py" -type f -exec black -l 120 {} +
    fi
}

prependEnv() 
{
    if [ $# -ne 2 ]
    then
        echo "usage: prependEnv <ENV_VAR> <ENV_VALUE>"
    else
        ENV_VALUE=`printenv $1`
        export $1="$2${ENV_VALUE:+${ENV_VALUE}:}"
    fi
}

appendEnv() 
{
    if [ $# -ne 2 ]
    then
        echo "usage: appendEnv <ENV_VAR> <ENV_VALUE>"
    else
        ENV_VALUE=`printenv $1`
        export $1="${ENV_VALUE:+${ENV_VALUE}:}$2"
    fi
}

syncCXXTemplate()
{
    rm -rf /tmp/CXXTemplate
    git clone https://github.com/moddyz/CXXTemplate /tmp/CXXTemplate
    cp -r /tmp/CXXTemplate/cmake/tools/* ./cmake/tools/
    cp /tmp/CXXTemplate/.clang-format ./
}
