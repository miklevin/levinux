REM Load Linux in a corruption-proof and rot-proof way
set __COMPAT_LAYER=Win95
qemu.exe ^
-kernel vmlinuz ^
-initrd microcore.gz ^
-L . ^
-hda home.qcow ^
-hdb opt.qcow ^
-hdc tce.qcow ^
-tftp ../../../Reset/Server ^
-redir tcp:2222::22 ^
-redir tcp:8080::80 ^
-redir tcp:8888::81 ^
-append "quiet noautologin home=sda1 opt=sdb1 tce=sdc1" ^
>NUL 2>..\..\..\Reset\WinErrorLog.txt