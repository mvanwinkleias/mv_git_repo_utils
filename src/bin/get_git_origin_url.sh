#!/bin/bash

# In a project depot, cd into all of the directories and output
# the remote.origin.url
dir="${1:-.}"
start_dir=`pwd`
# echo "Dir: $dir"
cd "$dir"
result=$( git config --get remote.origin.url )
status=0

if [ -z "$(git status --porcelain)" ]
then
	:
else
	status=1
fi
tab=$( echo -e '\t' )
echo "${dir}${tab}${result}${tab}${status}"
cd "$start_dir"
