#!/bin/bash

OTS=SUCCESS

TS=FAIL

echo -n "" | ./msmtpq-ng/msmtpq-ng root || TS=PASS

echo "$TS: Sending empty body gives error."

[ "$TS" = "FAIL" ] && OTS=FAIL

export MSMTP=./tests/scripts/msmtp-fail

TS=PASS

echo "Subject: Test mail queueing

Test mail queueing" | ./msmtpq-ng/msmtpq-ng root

grep -q 'EX_UNAVAIL' ~/log/.msmtp.queue.log || TS=FAIL
grep -q 'Test mail queueing' ~/msmtp.queue/*.mail || TS=FAIL

echo "$TS: Sending a body queues mail"

[ "$TS" = "FAIL" ] && OTS=FAIL

if [ "$OTS" = "FAIL" ]; then
	exit 3
fi
