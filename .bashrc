# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# git
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# prompt
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    export PS1="[$PS1_HOST \W]\$(__git_ps1 '[%s]')\\$ "
else
    export PS1="[$PS1_HOST \W]\\$ "
fi

# user alias
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
