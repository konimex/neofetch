PREFIX = /usr

all:
	@echo Run 'make install' to install Neofetch.

install:
	DESTDIR="${DESTDIR}" PREFIX="$(PREFIX)" ./install.sh
