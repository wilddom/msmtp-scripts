msmtp-scripts
-------------

![Travis CI results](https://travis-ci.org/cshoredaniel/msmtp-scripts.svg?branch=master)

These scripts are wrappers around the msmtp SMTP client
that add additional functionality.

The primary purpose is to allow the use of msmtp as
replacement for sendmail with including queueing,
and the option to require that email be confirmed
after some delay before sending it out.

Most of the scripts are modified from the msmtpq
script originally from the msmtp project
https://sourceforge.net/projects/msmtp/
