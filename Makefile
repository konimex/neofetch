all:
	@echo Run \'make install\' to install Neofetch

install:
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -p $(DESTDIR)/usr/share/man/man1
	mkdir -p $(DESTDIR)/etc/neofetch
	mkdir -p $(DESTDIR)/usr/share/neofetch/ascii/distro
	cp -p neofetch $(DESTDIR)/usr/bin/neofetch
	cp -p neofetch.1 $(DESTDIR)/usr/share/man/man1/neofetch.1
	cp -p config/config $(DESTDIR)/etc/neofetch/config
	cp -p ascii/distro/* $(DESTDIR)/usr/share/neofetch/ascii/distro

uninstall:
	rm -f $(DESTDIR)/usr/bin/neofetch
	rm -f $(DESTDIR)/usr/share/man/man1/neofetch.1
	rm -f -r $(DESTDIR)/usr/share/neofetch
	rm -f -r $(DESTDIR)/etc/neofetch
