#!/bin/bash
# Append current datetime to eof. If file does not exist, create it.

# args
FILE=$1

# functions
function checkmake(){
    if ! [ -w "$FILE" ]
    then
        > $FILE
        echo "$FILE was created."
    fi
}

# Verify that file exists, and if it doesn't create it
checkmake $FILE

if [ -w "$FILE" ]
then
    echo $(date) >> $FILE
fi