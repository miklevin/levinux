qemu.exe ^
-kernel vmlinuz ^
-initrd core.gz ^
-hda home.qcow ^
-append "quiet noautologin loglevel=3 waitusb=5 home=sda1"