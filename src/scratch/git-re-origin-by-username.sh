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
