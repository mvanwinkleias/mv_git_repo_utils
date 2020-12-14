#!/bin/bash

tags=$( git tag )

if [[ -z "$tags" ]]
then
	first_checkin=$( git log --oneline | tail -1 | awk '{print $1}' )
	git diff --name-only HEAD $first_checkin
	exit $?
fi
git diff --name-only HEAD $(git describe --tags --abbrev=0)
