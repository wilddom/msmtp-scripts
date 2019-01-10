#!/bin/bash

OTS=SUCCESS

dpkg-buildpackage -b -uc -us || OTS=FAIL

if [ "$OTS" == "SUCCESS" ]; then
	echo "PASS: Debian package build succeeded"
else
	echo "FAIL: Debian package build failed"
	exit 3
fi
