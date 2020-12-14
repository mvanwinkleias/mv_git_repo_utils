#!/bin/bash

# Initializes a repo
# Adds everything
# Commits
#
# Useful for checking templates that provide a .gitignore
# For example, when you create a project from a template
# and build it, git isn't supposed to want to track
# transient files.

git init .
git add .
git commit -m 'cheap init and checkin.'

