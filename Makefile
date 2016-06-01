#!/usr/bin/make

VERSION=1.0.0

distfiles = AUTHORS COPYING NEWS README THANKS doc msmtpq-ng msmtpq-ng-mta

all: dist-gzip

dist-gzip:
	rm -rf tmp
	mkdir tmp
	git log --date=iso --stat >tmp/ChangeLog
	cp -r $(distfiles) tmp/
	tar -C tmp -cvzf msmtp-scripts-$(VERSION).tar.gz .

clean:
	rm -f msmtp-scripts-*.tar.gz
	rm -rf tmp
