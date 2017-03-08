# run bash in a running docker instnace
_DC=$(docker ps  | grep testthing | awk ' { print $1} ' ) ; docker exec -t -i ${_DC}   /bin/bash
