#!/bin/bash


old_cwd=$( pwd )
path="$1"

cd $path
echo "----- Pulling: $path"
git pull
cd "$old_pwd"
