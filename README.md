msmtp-scripts
-------------


![Travis CI results](https://travis-ci.org/cshoredaniel/msmtp-scripts.svg?branch=master)

## DEPRECATED

I've decided to deprecate this (see below for why).

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
  * But: It would be better to have a way to host a turnkey mail server for local and vpn mail only on the local network
  * But: Most consumer devices don't send email, and 'enterprise-y' or in situations like OpenWrt, the user would be better serviced by using something like ssmtp and local mail VM (or add it to a device like a Raspberry Pi).
* Laptops and other mobile devices
  * But: Laptops running linux can easily support postfix so not a real need
  * But: Mobile devices don't generally use system email services
  * But: Windows mostly doesn't use system email services (although things like AMD's RAID Xpert(sp?) do have the option to send email notifications; likewise other 'enterprise-y' tools, however in that case there is probably an availble local mail server).
  * But: Most Windows laptops could run a mail server 'app' if this were really needed; likewise mobile devices
* Devices where space is a premium but where mail service is wanted
  * But: msmtp is really bigger than is ideal for this anyway
  * But: in that case is there really enough space for the queue
  * But: better to have a local mail server (see above)

### Additional Notes

* Was initially created as a quick hack and to add CI proper coverage testing, and such would involve enough effort that before spending the time it's necessary to consider the usefulness.
* Was written in bash and would be better to have it written in C (for size) for used on embedded systems (but see discussion above for why 'Use Cases' for why that is probably more effort than it is worth).
