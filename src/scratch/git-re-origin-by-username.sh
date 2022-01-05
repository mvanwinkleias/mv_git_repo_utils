#!/bin/bash

# Because I use multiple accounts for things, I ended up having
# to "redo" the origins for a lot of projects because of how
# I have ssh keys aliased by hostnames.
#
# This resets the origin to something else.

# git remote -v \
#     | awk -F':' '{print $2}' \
#     | awk '{print $1}' \
#     | head -n1 \
#     | xargs -n1 -i git remote set-url origin 'git@github.com-mvanwinkleias:{}'
# git remote set-url origin git@github.com-mvanwinkleias:
# git pull 

remote_user="$1"; shift
origin="$1"; shift

function debug
{
	echo "Remote user: $remote_user"
	echo "Origin: $origin"
	echo "Left: $left"
	echo "Right: $right"
}

if [[ -z "$remote_user" ]]
then
	>&2 echo "First argument is remote user..."
	exit
fi

if [[ -z "$origin" ]]
then
	origin=$(git remote -v | head -n1 | awk '{print $2}')
fi

left=$( echo "$origin" | awk -F':' '{print $1'} )
right=$( echo "$origin" | awk -F':' '{print $2'} )

# debug

new_origin="${left}-${remote_user}:$right"

echo "# remote set-url $new_origin"
