#!/bin/bash

OTS=SUCCESS

dpkg-buildpackage -b --no-sign || OTS=FAIL

if [ "$OTS" == "SUCCESS" ]; then
	echo "PASS: Debian package build succeeded"
else
	echo "FAIL: Debian package build failed"
	exit 3
fi
