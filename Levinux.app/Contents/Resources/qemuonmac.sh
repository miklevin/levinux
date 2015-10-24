cd ../MacOS

./i386-softmmu \
-kernel vmlinuz \
-initrd core.gz \
-hda home.qcow \
-hdb opt.qcow \
-hdc tce.qcow \
-tftp ../../../Reset/Server \
-redir tcp:2222::22 \
-redir tcp:8080::80 \
-redir tcp:8888::8888 \
-append "quiet noautologin loglevel=3 home=sda1 opt=sdb1 tce=sdc1"
