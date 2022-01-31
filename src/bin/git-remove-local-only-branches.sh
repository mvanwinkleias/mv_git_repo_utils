#!/bin/bash

function remove_line_with_arrow
{
	grep -Ev '\s+->\s+'
}

function remove_leading_asterisk
{
	sed 's/^\*//'
}

function git_get_all_remote_branches
{
	git branch -r \
	| remove_line_with_arrow \
	| awk '{print $1}'
}
# grep -Ev -f <(git branch -r | awk '{print $1}') <(git branch -vv | grep origin | awk '{print $1'})

# git remote prune origin

# The sed command below might be overkill.  Apparently you can't
# create branch names with spaces in them, but what's going on here is
# it removes everything after the commit hash.
# | sed -E 's/^[ \t]*//;s/\S+\s\[.*$//' \
git branch -vv \
| grep 'gone]' \
# | xargs -n1 git branch -d

# It's looking like because git allows for branch names like gone]
# that we might have to find a better way of doing things.

