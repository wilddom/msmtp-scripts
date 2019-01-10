#!/bin/bash

OTS=SUCCESS

export MSMTP=./tests/scripts/msmtp-fail

TS=FAIL

echo -n "" | ./msmtpq-ng/msmtpq-ng root
[ -z "$(ls -A ~/.msmtp.queue/*.mail 2>/dev/null)" ] && TS=PASS

echo "$TS: Sending empty body gives error."

[ "$TS" = "FAIL" ] && OTS=FAIL

TS=PASS

echo "Subject: Test mail queueing

Test mail queueing" | ./msmtpq-ng/msmtpq-ng root

grep -q 'EX_UNAVAIL' ~/log/msmtp.queue.log 2>/dev/null || TS=FAIL
grep -q 'Test mail queueing' ~/.msmtp.queue/*.mail 2>/dev/null || TS=FAIL

echo "$TS: Sending a body queues mail"

[ "$TS" = "FAIL" ] && OTS=FAIL

if [ "$OTS" = "FAIL" ]; then
	exit 3
fi
