#!/usr/bin/env bash

while [[ "$1" ]]; do
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

[[ -z "$BINDIR" ]] && BINDIR="bin"
[[ -z "$CONFDIR" ]] && CONFDIR="etc/neofetch"
[[ -z "$ASCIIDIR" ]] && ASCIIDIR="share/neofetch/ascii/distro"
[[ -z "$MANDIR" ]] && MANDIR="share/man/man1"
[[ -z "$PREFIX" ]] && PREFIX="usr"


mkdir -p "${DESTDIR}"/"${PREFIX}"/"${BINDIR}"
mkdir -p "${DESTDIR}"/"${PREFIX}"/"${CONFDIR}"
mkdir -p "${DESTDIR}"/"${PREFIX}"/"${ASCIIDIR}"
mkdir -p "${DESTDIR}"/"${PREFIX}"/"${MANDIR}"

cp -p neofetch "${DESTDIR}"/"${PREFIX}"/"${BINDIR}"
cp -p config/config "${DESTDIR}"/"${PREFIX}"/"${CONFDIR}"
cp -p ascii/distro/* "${DESTDIR}"/"${PREFIX}"/"${ASCIIDIR}"
cp -p neofetch.1 "${DESTDIR}"/"${PREFIX}"/"${MANDIR}"
