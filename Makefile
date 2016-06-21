#!/usr/bin/make

VERSION=1.0.8

distfiles = AUTHORS COPYING NEWS README THANKS doc msmtpq-ng msmtpq-ng-mta packaging

all: dist-gzip

dist-gzip:
	rm -rf tmp
	mkdir -p tmp/msmtp-scripts-$(VERSION)
	git log --date=iso --stat >tmp/msmtp-scripts-$(VERSION)/ChangeLog
	cp -r $(distfiles) tmp/msmtp-scripts-$(VERSION)/
	tar -C tmp -cvzf msmtp-scripts-$(VERSION).tar.gz msmtp-scripts-$(VERSION)

clean:
	rm -f msmtp-scripts-*.tar.gz
	rm -rf tmp
