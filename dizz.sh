#!/bin/bash
time /usr/bin/pacman -Ql | cut -d ' ' -f 2- | sort -u > db.txt
time find /arch /bin /boot /etc /lib /opt /sbin /usr 2>/dev/null | while read i; do
	if [ ! -d "$i" ]; then
		echo "$i"
	fi;
done | sort -u > fs.txt
time comm -23 fs.txt db.txt > non-db.txt
