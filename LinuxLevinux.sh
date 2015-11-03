#!/bin/bash

if command -v resize >/dev/null; then
	resize -s 25 80 >/dev/null
else
	echo "Resize is not installed.  Levinux is best used in a 25x80 terminal." 2>&1
fi

cd ./Levinux.app/Contents/MacOS/

./qemu-system-i386 -curses \
-kernel vmlinuz \
-initrd core.gz \
-L ./ \
-hda home.qcow \
-hdb opt.qcow \
-hdc tce.qcow \
-tftp ../../../Reset/Server \
-redir tcp:2222::22 \
-redir tcp:8080::80 \
-redir tcp:8888::8888 \
-append "quiet noautologin loglevel=3 home=sda1 opt=sdb1 tce=sdc1" 
