#!/bin/bash

OTS=SUCCESS

shellcheck -e SC1090,SC1091 -s dash ./msmtpq-ng/msmtpq-ng || OTS=FAIL

if [ "$OTS" = "FAIL" ]; then
	echo "FAIL: Linting (shellcheck) fails for msmtpq-ng/msmtpq-ng"
	exit 3
else
	echo "PASS: Linting (shellcheck) succeeds for msmtpq-ng/msmtpq-ng"
fi
