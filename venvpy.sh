#!/bin/bash

# Opens a virtualenv and runs a python script
# Used to run some scripts using cron that require specific virtual environments
#
# arg1: Conda virtual environment name
# arg2: Source folder of script
# arg3: script filename

# --args--
VENV=$1
PYPACKAGEPATH=$2
PYSCRIPT=$3

source activate $VENV
cd $PYPACKAGEPATH
python $PYSCRIPT
