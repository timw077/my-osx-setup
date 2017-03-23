#!/bin/bash
# I stole most of this code from StackOVerFlow. 

cd || {
  echo "Unable to cd to home." >&2
  exit 1
}
Candidates=$(echo .serverauth.*)
if [ -z "$Candidates" ];then
  printf "No xserverauth files found. exiting."
  exit 1
fi

for Candidate in $Candidates ; do
  PID=${Candidate#.serverauth.}
  echo ${PID}
  echo kill -0 ${PID} 2>&-
  kill -0 ${PID} 2>&-
  if [ $? != 0 ];then # The PID is not currently active
    printf "Removing orphaned xserverauth file \"$Candidate\".\n";
    rm $Candidate || {
      printf "Failed to remove file \"$Candidate\".\n" >&2.
    }
  else printf "Ignoring the running xserverauth file \"$Candidate\".\n";
  fi
done
