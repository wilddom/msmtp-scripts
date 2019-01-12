#!/bin/sh

OTS=SUCCESS

export MSMTP_SKIP_CONF=true
export MSMTP_OVERRIDE_CONF=./tmp/msmtpq-fail.rc

TS=FAIL

echo -n "" | ./msmtpq-ng/msmtpq-ng root
[ -z "$(ls -A ~/.msmtp.queue/*.mail 2>/dev/null)" ] && TS=PASS

echo "$TS: Sending empty body gives error."

[ "$TS" = "FAIL" ] && OTS=FAIL

TS=PASS

echo "Subject: Test mail queueing

Test mail queueing" | ./msmtpq-ng/msmtpq-ng root

grep -q 'EX_UNAVAIL' ./tmp/msmtp.queue.log 2>/dev/null || TS=FAIL
grep -q 'Test mail queueing' ./tmp/msmtp.queue/*.mail 2>/dev/null || TS=FAIL

echo "$TS: Sending a body queues mail"

[ "$TS" = "FAIL" ] && OTS=FAIL

if [ "$OTS" = "FAIL" ]; then
	exit 3
fi
