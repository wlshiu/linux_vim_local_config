# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# PATH=$PATH:$HOME/bin:usr/local/gcc-arm-none-eabi-4_7-2013q3/bin
PATH=$PATH:$HOME/bin:/usr/local/gcc-arm-none-eabi-4_9-2015q1/bin

export PATH

LS_COLORS="di=00;94:ex=00;32:ln=00;36:"
LS_COLORS="*.so=1:33:*.a=1;33:$LS_COLORS"
# export LS_COLORS

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's@* \(.*\)@ (\1)@'
}

# PS1="\n\e[1;0m[\e[0;32m\u\e[0;35m@\e[0;32m\h\e[1;0m]\e[1;0m[\e[0;31m\w\e[1;0m]\n$ "
PS1="\n\e[1;0m[\e[0;32m\u\e[0;35m@\e[0;32m\h\e[1;0m]\e[1;0m[\e[0;31m\w\e[1;0m]\e[0;33m\$(parse_git_branch)\e[1;0m\n$ "
export PS1

export GTAGSCONF=$HOME/.vim/gtags.conf

vdiff() {
    if [ "${#}" -ne 2 ]; then
        echo -e "vdiff requires two arguments"
        echo -e "  comparing dirs: vdiff dir_a dir_b"
        echo -e "  comparing files: vdiff file_a file_b"
        return 1
    fi

    local left="${1}"
    local right="${2}"

    if [ -d "${left}" ] && [ -d "${right}" ]; then
        vim +"DirDiff ${left} ${right}"
    else
        vim -d "${left}" "${right}"
    fi
}

alias ls='ls --color'
alias vi='vim'
alias grep='grep --color=auto'
alias diff='diff --color -u'

set completion-ignore-case on

export NCURSES_NO_UTF8_ACS=1
