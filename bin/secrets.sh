#!/bin/bash

# make sure my USB drive is mounted
# See README for more information

LOCALMOUNTPOINT="/Volumes/NONAME"
TARGET=${LOCALMOUNTPOINT}/foobar.tar
SECRETS="${LOCALMOUNTPOINT}/secrets"

if mount | grep -q "on ${LOCALMOUNTPOINT}"; then
    echo "${LOCALMOUNTPOINT} is mounted" >/dev/null
else
    echo "${LOCALMOUNTPOINT} not mounted" >&2 ; exit 255
fi

if [[ ! -f ${SECRETS} ]]; then
     echo ${SECRETS} NOT FOUND. >&2 ; exit 255
 fi

if [[ -f ${TARGET} ]]; then
    DATE=$(date +%Y%m%d-%H%M)
    mv ${TARGET} ${LOCALMOUNTPOINT}/foobar-${DATE}.tar
fi
( cd ~ && tar -T ${SECRETS} -cjf ${TARGET})
