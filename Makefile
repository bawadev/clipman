#!/usr/bin/make -f
PREFIX ?= /usr
DESTDIR ?=

.PHONY: all install uninstall

all:
	@echo "Nothing to build. Use 'make install' to install."

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 clipman $(DESTDIR)$(PREFIX)/bin/clipman
	install -m 755 clipman-gui $(DESTDIR)$(PREFIX)/bin/clipman-gui
	install -d $(DESTDIR)$(PREFIX)/share/applications
	install -m 644 clipman.desktop $(DESTDIR)$(PREFIX)/share/applications/
	install -d $(DESTDIR)/usr/share/man/man1
	install -m 644 debian/clipman.1 $(DESTDIR)/usr/share/man/man1/clipman.1
	install -d $(DESTDIR)$(PREFIX)/share/doc/clipman
	install -m 644 LICENSE README.md screenshot.png $(DESTDIR)$(PREFIX)/share/doc/clipman/
	install -d $(DESTDIR)/etc/xdg/autostart
	install -m 644 debian/clipman.service $(DESTDIR)/etc/xdg/autostart/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/clipman
	rm -f $(DESTDIR)$(PREFIX)/bin/clipman-gui
	rm -f $(DESTDIR)$(PREFIX)/share/applications/clipman.desktop
	rm -f $(DESTDIR)/usr/share/man/man1/clipman.1.gz
	rm -rf $(DESTDIR)$(PREFIX)/share/doc/clipman
	rm -f $(DESTDIR)/etc/xdg/autostart/clipman.service
