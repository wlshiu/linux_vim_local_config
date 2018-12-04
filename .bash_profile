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

PS1="\n\e[1;0m[\e[0;32m\u\e[0;35m@\e[0;32m\h\e[1;0m]\e[1;0m[\e[0;31m\w\e[1;0m]\n$ "
export PS1
