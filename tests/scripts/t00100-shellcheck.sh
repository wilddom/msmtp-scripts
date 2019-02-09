#!/bin/sh

OTS=SUCCESS

for script in msmtpq-ng/msmtpq-ng msmtpq-ng/msmtpq-ng-queue msmtpq-ng-mta/msmtpq-ng-mta msmtpq-ng-mta/msmtpq-ng-queue-mta; do
	shellcheck -e SC1090,SC1091 -s dash $script || OTS=FAIL

	if [ "$OTS" = "FAIL" ]; then
		echo "FAIL: Linting (shellcheck) fails for $script"
		exit 3
	else
		echo "PASS: Linting (shellcheck) succeeds for $script"
	fi
done
