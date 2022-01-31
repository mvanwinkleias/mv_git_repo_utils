#!/bin/bash

function remove_line_with_arrow
{
	grep -Ev '\s+->\s+'
}

function remove_leading_asterisk
{
	| sed 's/^\*//'
}

function git_get_all_remote_bramches
{
	git branch -r \
	| remove_line_with_arrow \
	| awk '{print $1}'
}
# grep -Ev -f <(git branch -r | awk '{print $1}') <(git branch -vv | grep origin | awk '{print $1'})
