#!/bin/bash

# In a project depot, cd into all of the directories and output
# the remote.origin.url
dir="${1:-.}"
start_dir=`pwd`
# echo "Dir: $dir"
cd "$dir"
result=$( git config --get remote.origin.url )
status=0

# Check for untracked or uncommitted files
if [[ ! -z "$(git status --porcelain)" ]]
then
	status=1
fi

# Check for unpushed commits
if [[ ! -z "$( git log --branches --not --remotes)" ]]
then
	status=1
fi

tab=$( echo -e '\t' )
echo "${dir}${tab}${result}${tab}${status}"
cd "$start_dir"
