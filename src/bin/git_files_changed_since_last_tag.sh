#!/bin/bash

git diff --name-only HEAD $(git describe --tags --abbrev=0)
