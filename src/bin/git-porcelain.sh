#!/bin/bash

# Exits non-zero if git "notices" changes

if [ -z "$(git status --porcelain)" ]; then 
	:
else 
	>&2 echo "git: Git thinks there are un-tracked files, or something to be committed."
	>&2 echo "A goal of this project is to not have to worry about"
	>&2 echo "tracking transient files in revision control."
	>&2 echo "check git status and compare it with the .gitignore."
	git status
	exit 1
fi
