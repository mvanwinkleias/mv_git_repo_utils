#!/bin/bash

git log $(git describe --tags --abbrev=0)..HEAD --oneline --pretty="format:%ci %s (%h)"
git log --tags --simplify-by-decoration --pretty="format:%ci %d"
