#!/bin/bash

repo="$1"

src_base_dir=${src_base_dir:-~/src/git}

if [[ -z "$repo" ]]
then
	>&2 echo "Repo to clone is first argument."
	exit 1
fi

stripped_repo=$repo
host=''
group_name=''

if [[ "$repo" == http* || "$repo" == ssh* ]]
then
	echo "This is an http/ssh thing."
	## Remove protocol part of url  ##
	stripped_repo="${stripped_repo#http://}"
	stripped_repo="${stripped_repo#https://}"
	stripped_repo="${stripped_repo#ssh://}"

	# Host is everything up until the first /
	host=$( echo "$stripped_repo" | cut -d '/' -f 1  )
	host=$( echo "$host" | cut -f1 -d":")
	
	
	group_name=$( dirname "${stripped_repo#*/}" )

elif [[ "$repo" == *@*:* ]]
then
 	echo "This is a user@site:thing"
	host=$( echo "$repo" | awk -F':' '{print $1}' | awk -F '@' '{print $2}' )
	group_name=$( dirname "${repo#*:}" )
else

	>&2 "I don't recognize this repo type..."
	exit 1
fi

echo "Stripped repo: $stripped_repo"
echo "Host: $host"
echo "Group name: $group_name"

if [[ -z "$host" || -z "$group_name" ]]
then
	>&2 "I was unable to extract the host or group name for this repo..."
	exit 1
fi

clone_dir="$src_base_dir/$host/$group_name"
echo "Clone dir:"
echo "$clone_dir"
exit
mkdir -p "$clone_dir"
cd "$clone_dir"

git clone $repo
