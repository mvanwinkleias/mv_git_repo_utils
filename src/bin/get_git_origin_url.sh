#!/bin/bash

# In a project depot, cd into all of the directories and output
# the remote.origin.url
dir="${1:-d}"
start_dir=`pwd`
# echo "Dir: $dir"
cd "$dir"
git config --get remote.origin.url
cd "$start_dir"
