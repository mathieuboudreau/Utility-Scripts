#!/bin/bash
# Execute an rsync, and keep a log of when it started and finished.

# args
SRC=$1
DEST=$2
LOGFILE=$3

# functions
function checkmake(){
    if ! [ -w "${SRC}logs/${LOGFILE}" ]
    then
        > "${SRC}logs/${LOGFILE}"
        echo "${SRC}logs/${LOGFILE} was created."
    fi
}

# Verify that file exists, and if it doesn't create it
checkmake

if [ -w "${SRC}logs/${LOGFILE}" ]
then
    echo -e "\n**************************************************" >> "${SRC}logs/${LOGFILE}"
    echo "rsync started $(date)" >> "${SRC}logs/${LOGFILE}"
    echo "source: ${SRC}"  >> "${SRC}logs/${LOGFILE}"
    echo "destination: ${DEST}"  >> "${SRC}logs/${LOGFILE}"

    (rsync -av $SRC $DEST)

    echo "rsync exit status: ${?}" >> "${SRC}logs/${LOGFILE}"
    echo "rsync finished $(date)" >> "${SRC}logs/${LOGFILE}"
    echo -e "**************************************************\n" >> "${SRC}logs/${LOGFILE}"

    (rsync -av "${SRC}logs/$LOGFILE" "${DEST}logs/")
fi
