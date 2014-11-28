cd ../MacOS

./i386-softmmu \
-kernel vmlinuz \
-initrd core.gz \
-hda home.qcow \
-hda opt.qcow \
-hdc tce.qcow \
-append "quiet noautologin loglevel=3 waitusb=5 home=sda1 opt=sdb1 tce=sdc1"
