#!/bin/bash

tags=$( git tag )
if [[ -z "$tags" ]]
then
	git log --oneline --pretty="format:%ci %s (%h)"
	exit $?
fi

git log $(git describe --tags --abbrev=0)..HEAD --oneline --pretty="format:%ci %s (%h)" || exit $?
git log --tags --simplify-by-decoration --pretty="format:%ci %d" || exit $?
