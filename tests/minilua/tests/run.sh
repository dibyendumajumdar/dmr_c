#!/bin/bash
set -e
tests_list=`find . -name '*.lua' | sed -e 's#^\./\(.*\)#\1#' | sort`

for f in $tests_list; do
	echo "running $f"
	../minilua $f
	if [ "$?" -ne "0" ]; then
                echo "$f failed"
        fi
done
