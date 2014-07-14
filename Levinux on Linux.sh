#!/bin/bash

pwd
cd ./Levinux\ on\ Mac.app/Contents/MacOS/
pwd
export LD_LIBRARY_PATH
./qemu-system-i386 -curses \
-kernel vmlinuz \
-initrd microcore.gz \
-L ./ \
-hda home.qcow \
-hdb opt.qcow \
-hdc tce.qcow \
-tftp ../../../Reset/Server \
-redir tcp:2222::22 \
-redir tcp:8080::80 \
-redir tcp:8888::81 \
-append "quiet noautologin home=sda1 opt=sdb1 tce=sdc1" 
