#!/bin/bash

this_dir=${1:-`pwd`}


# Finds all git repositories under the current directory.
# https://stackoverflow.com/questions/11981716/how-to-quickly-find-all-git-repos-under-a-directory
# echo "This dir: $this_dir"

find "$this_dir" -type d \
	\( -execdir test -e {}/.ignore \; -prune \) \
	-o \( -execdir test -d {}/.git \; -prune -print \)
