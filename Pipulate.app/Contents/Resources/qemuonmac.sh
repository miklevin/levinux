cd ../MacOS

./i386-softmmu \
-kernel vmlinuz \
-initrd core.gz \
-hda home.qcow \
-append "quiet"