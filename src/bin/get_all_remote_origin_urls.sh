#!/bin/bash

start_dir=`pwd`
for dir in `find ./ -maxdepth 1 -mindepth 1 -type d | egrep -v '^./$' `
do
	# echo "Dir: $dir"
	cd "$dir"
	git config --get remote.origin.url
	cd "$start_dir"
done
