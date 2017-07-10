#!/bin/sh

while [ "$1" ]; do
	case "$1" in
		"--destdir") DESTDIR="$2" ;;
		"--bindir") BINDIR="$2" ;;
		"--confdir") CONFDIR="$2" ;;
		"--prefix") PREFIX="$2" ;;
		"--asciidir") ASCIIDIR="$2" ;;
		"--mandir") MANDIR="$2" ;;
	esac
	shift
done

[ -z "$BINDIR" ] && BINDIR="/bin"
[ -z "$ASCIIDIR" ] && ASCIIDIR="/share/neofetch/ascii/distro"
[ -z "$MANDIR" ] && MANDIR="/share/man/man1"
[ -z "$CONFDIR" ] && CONFDIR="/etc/neofetch"

mkdir -p "${DESTDIR}""${PREFIX}""${BINDIR}"
mkdir -p "${DESTDIR}""${PREFIX}""${ASCIIDIR}"
mkdir -p "${DESTDIR}""${PREFIX}""${MANDIR}"

sed -i -e "s|ASCIIDIR|${PREFIX}${ASCIIDIR}|g" neofetch

cp -p neofetch "${DESTDIR}""${PREFIX}""${BINDIR}"
cp -p config/config.conf "${DESTDIR}""${PREFIX}""${CONFDIR}"
cp -p ascii/distro/* "${DESTDIR}""${PREFIX}""${ASCIIDIR}"
cp -p neofetch.1 "${DESTDIR}""${PREFIX}""${MANDIR}"

if [ -z "$PREFIX" ] || [ "$PREFIX" = "/usr" ]; then
	mkdir -p "${DESTDIR}""${CONFDIR}"
	sed -i -e "s|CONFDIR|${CONFDIR}|g" neofetch
	cp -p config/config.conf "${DESTDIR}""${CONFDIR}"
else
	mkdir -p "${DESTDIR}""${PREFIX}""${CONFDIR}"
	sed -i -e "s|CONFDIR|${PREFIX}${CONFDIR}|g" neofetch
	cp -p config/config.conf "${DESTDIR}""${PREFIX}""${CONFDIR}"
fi
