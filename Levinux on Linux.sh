#!/bin/bash

pwd
cd ./Levinux\ on\ Mac.app/Contents/MacOS/
pwd
declare myqemu
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  myqemu="qemu-system-x86_64"
  if ! [ -x "qemu-system-x86_64" ]; then
    chmod +x qemu-system-x86_64
  fi
else
  myqemu="qemu-system-i386"
  if ! [ -x "qemu-system-i386" ]; then
    chmod +x qemu-system-i386
  fi
fi

export LD_LIBRARY_PATH
./$myqemu -curses \
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
