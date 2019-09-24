#!/bin/bash

path="$1"

cd $path
echo "----- Pulling: $path"
git pull
cd ..
