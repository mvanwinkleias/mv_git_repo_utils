#!/bin/bash

# Given two directories that have git repositories checked out
# in them, diff them and show what's missing in either.

source_a="$1"; shift
source_b="$1"; shift

output_a=`mktemp`
output_b=`mktemp`

ls -lthr "$source_a" | egrep '^d' | awk '{print $9}' | sort > "$output_a"
ls -lthr "$source_b" | egrep '^d' | awk '{print $9}' | sort > "$output_b"

diff "$output_a" "$output_b"

rm "$output_a" "$output_b"
