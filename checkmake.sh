#!/bin/bash
# Verify if the input file(name) exists and is writable.
# If it does not exist, create it.

FILE=$1
if [ -w "$FILE" ]
then
	echo "$FILE exists."
else
    > $FILE
	echo "$FILE was created."
fi