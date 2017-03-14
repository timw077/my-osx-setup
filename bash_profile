_bash_Profile="dot bash profile" 
export _bash_Profile 

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ "${BASH-no}" != "no" ]; then
	[ -r ~/.bashrc ] && . ~/.bashrc
fi



