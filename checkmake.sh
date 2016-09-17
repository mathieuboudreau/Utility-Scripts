#!/bin/bash
# Verify if the input file(name) exists and is writable

file=$1
if [ -w "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
fi