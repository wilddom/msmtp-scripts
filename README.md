msmtp-scripts
-------------


![Travis CI results](https://travis-ci.org/cshoredaniel/msmtp-scripts.svg?branch=master)

## Revived

I had deprecated this (see below) but for a couple of specific simple use cases
it's still useful and a user request prompted me to unarchive it.

## Overview

These scripts are wrappers around the msmtp SMTP client
that add additional functionality.

The primary purpose is to allow the use of msmtp as
replacement for sendmail with including queueing,
and the option to require that email be confirmed
after some delay before sending it out.

Most of the scripts are modified from the msmtpq
script originally from the msmtp project
https://sourceforge.net/projects/msmtp/

## Deprecation Notice

### Use Cases

* Embedded devices where a user does not have a full blown mail server on their local network and we don't want to lose mail due to lose of connectivity to the internet.
  * Specifically we're here for the use case when the mail is non-critical so if a major event (i.e. total power loss,
  resulting in loss of queue in RAM) happens it's not the end of the world, but you'd still prefer not to lose the mail 
  to a temporary internet issue.  In that case other solutions may be overkill or, like ssmtp, you'll lose mail if the outgiong
  mail server is unreachable at the time.
  * But: If mail loss is an issue, it would be better to have a way to host a turnkey mail server for local and vpn mail only on the local network
* Laptops and other mobile devices
  * But: Laptops running linux can easily support postfix so not a real need
  * But: Mobile devices don't generally use system email services
  * But: Windows mostly doesn't use system email services (although things like AMD's RAID Xpert(sp?) do have the option to send email notifications).
  * Devices where space is a premium but where mail service is wanted
  * But: msmtp is really bigger than is ideal for this anyway
    Counter: that's why I'm planning on working on a C-based successor.
  
### Additional Notes

* Was initially created as a quick hack and addin CI proper coverage testing is going to take a bit.
* Was written in bash/POSIX sh and would be better to have it written in C (for size) for used on embedded systems.
