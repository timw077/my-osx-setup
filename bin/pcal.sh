#date 
find ~/Desktop/cal.ps -newer ~/.calendar | grep cal.ps >/dev/null 
_Rc=$?
 
if [[ $1 = "now" ]]
then 
    _Rc=99
fi

if [[ ${_Rc} -ne 0 ]]
then 
    /usr/local/bin/pcal -L "script version 2008.10" -R "Published:$(date "+%Y %m %d")"  $(date "+%m %Y") 12  > ~/Desktop/cal.ps 
fi 

open ~/Desktop/cal.ps 
 # Missing Terry's Birthday, Brian's Anniversary, Evis' Birth year
