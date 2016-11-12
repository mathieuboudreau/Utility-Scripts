#!/bin/bash

# Opens a virtualenv and runs a python script
# Used to run some scripts using cron that require specific virtual environments
#
# arg1: Conda virtual environment name
# arg2: Source folder of script
# arg3: script filename

source activate $1
cd $2
python $3
