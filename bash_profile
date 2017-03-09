_bash_Profile="dot bash profile" 
export _bash_Profile 

if [ "${BASH-no}" != "no" ]; then
	[ -r ~/.bashrc ] && . ~/.bashrc
fi



