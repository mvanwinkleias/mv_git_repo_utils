#!/bin/bash

verbose=0

git_pull_command=( \
	git pull \
)

function verbose_output
{
	if [[ "$verbose" == "1" ]]
	then
		echo "$@"
	fi
}

function usage
{
	echo "-v : enable verbose"
}
while getopts "v" o; do
    case "${o}" in
        v)
            verbose=1
            ;;
        *)
            usage
			exit 1
            ;;
    esac
done

shift $((OPTIND-1))

old_cwd=$( pwd )
path="$1"

cd_back=0
if [[ ! -z "$path" ]]
then
	cd $path
	cd_back=1
else
	path="."
fi

verbose_output "----- Pulling: $path"

if [[ "$verbose" == 1 ]]
then
	git pull
else
	git pull > /dev/null
fi

if [[ "$cd_back" == 1 ]]
then
	cd "$old_cwd"
fi
