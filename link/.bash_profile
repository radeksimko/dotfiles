# Path
export PATH=/opt/local/bin:/usr/local/bin:/opt/local/sbin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH # NPM
export PATH=/usr/local/mysql/bin:$PATH # MySQL
export PATH=/usr/local/pear/bin:$PATH # Pear
export PATH=/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH # Ruby
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH # sed

export MANPATH=/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH

# Locales
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Prompt
export PS1="\\u@\\h:\\W $ "
export HISTFILESIZE=5000

export JAVA_HOME=$(/usr/libexec/java_home)
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# AWS credentials
[ -f ~/.aws ] && . ~/.aws

# Homebrew GH token
[ -f ~/.homebrew ] && . ~/.homebrew

alias guard="bundle exec guard"
alias rake="bundle exec rake"
alias chrome="open -a '/Applications/Google Chrome.app'"
alias editor='subl'
alias sed='gsed'

# Git
alias g="git"
alias gs="g status"
alias ga="g add -A"

# XDebug
export XDEBUG_CONFIG="idekey=sublime.xdebug"

# Finished adapting your PATH environment variable for use with MacPorts.
[ -f ~/.launchctl-completion.bash ] && . ~/.launchctl-completion.bash

genpasswd() {
	local l=$1
	[ "$l" == "" ] && l=20
	head -30 /dev/random | uuencode -m - | tail -3 | head -1 | sed 's/[^A-z0-9_]/Y/g' | head -c ${l}
	echo ""
}
[ -f ~/.git-bash-completion.sh ] && . ~/.git-bash-completion.sh

# GIT bash current branch
# by HABR (modified by Dundee)
export PSORIG="$PS1"
function GITBRANCH() {
        branch="$(git branch 2>/dev/null | grep '*' | cut -d" " -f2-)"
        dirty="$(git status -s 2>/dev/null)"
        if [ -n "$dirty" ] ; then
                color="1;33m"
        else
                color="0;33m"
        fi

        if [ -n "$branch" ] ; then
                export PS1=$PSORIG$(echo -en "\[\033[$color\]$branch\[\033[0;33m\] > \[\033[00m\]")
        else
                export PS1="$PSORIG"
        fi
}

# TODO: VirtualENV issue fix

PROMPT_COMMAND="GITBRANCH;"

# TODO detection by geoip - location name / provider name / hostname

# TODO screen detection
function screen_detection() {
    if [ $TERM == 'screen' ]; then
        export PS1="\e[1m\e[34m zzz $PSORIG\e[39m\e[21m"
    else
        export PS1="$PSORIG"
    fi
}

#PROMPT_COMMAND="$PROMPT_COMMAND screen_detection;"
