#!/bin/bash

# In a git depot, cd to all of the directories and run a pull

find ./ -maxdepth 1 -mindepth 1 -type d | egrep -v '^./$' | xargs -n1 ./gp.sh
