#!/bin/bash

find ./ -maxdepth 1 -mindepth 1 -type d | egrep -v '^./$' | xargs -n1 ./gp.sh
