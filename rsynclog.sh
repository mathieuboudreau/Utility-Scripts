#!/bin/bash
# Execute an rsync, and keep a log of when it started and finished.

# args
SRC=$1
DEST=$2
LOGFILE=$3

# Setup vars for os identification
osplatform='unknown'
osnamestr=`uname`

# functions
function checkmake(){
    if ! [ -w "${SRC}logs/${LOGFILE}" ]
    then
        > "${SRC}logs/${LOGFILE}"
        echo "${SRC}logs/${LOGFILE} was created."
    fi
}

function identifyplatform(){
    if [[ $osnamestr == 'Darwin' ]]
    then
        osplatform='MacOSX'
    fi
}

# Verify that file exists, and if it doesn't create it
checkmake

# Identify platform
identifyplatform

if [ -w "${SRC}logs/${LOGFILE}" ]
then
    echo -e "\n**************************************************" >> "${SRC}logs/${LOGFILE}"
    echo "rsync started $(date)" >> "${SRC}logs/${LOGFILE}"
    echo "source: ${SRC}"  >> "${SRC}logs/${LOGFILE}"
    echo "destination: ${DEST}"  >> "${SRC}logs/${LOGFILE}"

    if [[ $osplatform == 'MacOSX' ]]
    then
        osascript -e 'display notification "Starting rsync transfer..." with title "rsync"'
    fi

    (rsync -av $SRC $DEST)

    echo "rsync exit status: ${?}" >> "${SRC}logs/${LOGFILE}"
    echo "rsync finished $(date)" >> "${SRC}logs/${LOGFILE}"
    echo -e "**************************************************\n" >> "${SRC}logs/${LOGFILE}"

    (rsync -av "${SRC}logs/$LOGFILE" "${DEST}logs/")

    if [[ $osplatform == 'MacOSX' ]]
    then
        osascript -e 'display notification "Finished rsync transfer." with title "rsync"'
    fi
fi
