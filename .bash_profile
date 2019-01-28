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
# export LS_COLORS

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
    
# PS1="\n\e[1;0m[\e[0;32m\u\e[0;35m@\e[0;32m\h\e[1;0m]\e[1;0m[\e[0;31m\w\e[1;0m]\n$ "
PS1="\n\e[1;0m[\e[0;32m\u\e[0;35m@\e[0;32m\h\e[1;0m]\e[1;0m[\e[0;31m\w\e[1;0m]\[\033[01;32m\]$(parse_git_branch)\[\033[00m\]\n$ "
export PS1
