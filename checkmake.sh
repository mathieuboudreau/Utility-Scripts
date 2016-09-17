#!/bin/bash
# Verify if the input file(name) exists and is writable

file=$1
if [ -w "$file" ]
then
	echo "$file exists."
else
    > $1
	echo "$file was created."
fi