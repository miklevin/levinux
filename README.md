> Levinux is a tiny Linux server based on QEMU that doesn't require an install
> or admin rights on the host PC. Great for learning and appliance projects.

# Beginning of Journal
--------------------------------------------------------------------------------
## Mon Apr  7 13:54:15 EDT 2014

Hello world! It's time to move Levinux into github and put it somewhere where a
bunch of eyes can start examining it. Levinux has a little ways to go to come
out of beta. The place that currently contains most of the documentation is on
my personal site: http://mikelev.in/ux/

I need better ncurses-supporting QEMU binaries with all optional hardware
support turned off, compiled for Windows, Mac and Linux. I also need to keep
track of and make available all the source that was used for GPL compliance.

This project has been going on for years, and is based on the amazing fact that
QEMU is one of the only virtual server products out there that can work without
an install on the host machine, and as a free and open source project, it can
run on Mac, Windows or other Linux machines. 

Few people realize how powerful it can be under those conditions to make the
same hard drive file in common with different QEMU binaries for each host
platform. You effectively get a floating virtual machine that carries the same
state (dev environment or whatever), no matter what x86 host machine you sit
down with.

This approach works particularly well with Dropbox, because of how the system
is broken up over several virtual hard drives, minimizing the amount of network
activity required to keep all instances of your system synchronized. It may be
the ultimate portable code execution environment to teach you generic
Linux/Unix and to ensure your code is with you for the rest of your life.
