> Levinux is a tiny Linux server based on QEMU that doesn't require an install
> or admin rights on the host PC. Great for learning and appliance projects.

https://www.youtube.com/watch?v=p7xf85wgVKo

# Beginning of Journal
--------------------------------------------------------------------------------
## Mon Jul 14 21:12:38 EDT 2014

Updated the Mac binary to get rid of the illegal instruction 4 error. Only
tested with OS X 10.8.5 currently. Earlier versions and Maverick testing
needed. Many corresponding dylib files updated. bios.bin in macbios folder may
no longer be necessary, replaced by bios-256k.bin.

Github pulls on the Mac were blowing away file permissions, so I experimented
with committing chmod +x changes to the RunOnMac.sh and Reset from a Mac files.
All looks good. Double-clicking the package after a git clone now works. I
should consider doing the same for Linux and perhaps Windows. 

It turns out that my auto-selection bash script logic for choosing the 32 or 64
bit files had been fubar for a long time. Running Levinux on a 64 bit version
resulted in the 32 bit version running, which seems to work much more smoothly
than when I first had to make the split. Performance is NOT a feature of
Levinux, so I'm setting it to always be 32 Bit, which is a major simplification
of the scripts and dependency management.

Also, I am really starting so see the advantages of Levinux being in git now.
When I make changes like this, I merely only need to do a commit of the files I
worked on and a push, and not have to worry about a full reset of the system
and recovering a fresh directory state, promising more rapid development.

Now to rev the numbers to 2.4.

--------------------------------------------------------------------------------
## Fri Apr 11 10:35:47 EDT 2014

Latest status:

I was asked on the forum: > What are the chances that the TCL kernel and
Extensions can be updated while the search is on for help with QEMU compiling?

...to which I repled:

My plans is to update everything from latest sources: Linux kernel, version of
Tiny Core Linux, and qemu binaries. The challenge of Levinux is that it is a
difficult to reproduce magic cocktail, and that the old versions have many
fewer dependencies and run very well. Moving to the new stuff always topples
the house of cards. Error messages get generated and the recipe build-times
become many times longer.

To solve this, I am very inspired by the Aboriginal Linux project by Rob
Landley http://landley.net/aboriginal/. My idea is to make Levinux self-build
all its components, so it can effectively freshen itself up. I will create the
cross-compiling environment to make the Mac, Windows and Linux qemu binaries
INSIDE Levinux (yes, compiles will take forever), but it will also gather all
the other latest components from source, such as Tiny Core Linux version 5,
with it’s new Linux kernel (the vmlinuz file) included.

I’ll probably switch everything over to Python 3. The trick is to do this while
preserving everything special about Levinux. The deflated distro is still under
20 megs, and it only inflates to about 60. This updating may make the resulting
size over 100 MB, mostly due to dependency-bloat of the latest QEMU’s and bloat
from Python 2.x to Python 3.x.

Anyway I’m pretty determined to do it, and the real motivation is how cool and
interesting it’s going to be to make Levinux self-freshening. My plan is to
make a hidden menu option: Rebuild Levinux for Mac, Windows, Linux. When you
make your choice, a process starts that could take 12 hours, but when it’s done
you will be able to surf to a localhost-accessible website and grab the new zip
file and copy it off the guest onto the host, and see if its any better.
Because it’s all scripted, I will be able to perpetually refine it and keep
Levinux modern.

I’ll probably also be able to offer different spins on Levinux with
optimizations for different host platforms, and versions that feature different
Linux than Tiny Core, and different languages than Python.

ETA: Who knows? I’ll do my best.

--------------------------------------------------------------------------------
## Thu Apr 10 17:26:26 EDT 2014

It occurs to me that in the same spirit as Aboriginal Linux, a goal of Levinux
should be its ability to build its own hosting environment. This would solve
the "good qemu binary" challenge, because it would simply be a Levinux recipe
that builds an entirely new up-to-date QEMU binary that Levinux could run on. I
could even use it to gather up the dependencies into the correct locations, and
spin out support for a number of additional host environments. Testing will
still be a unique challenge, in having to have hosts to test on when virtual
machines don't cut it (like testing on various non-virtualize-able versions of
OS X). But as far as doing the build, it will all be a hidden or maybe
third-level menus (the initial boot and post-Python-build being the first two
menus). 

What would that look like? Hmmm. Maybe something like sticking with the
as-small-as-possible no-recipes-run yet ~20MB distribution file, but after
initial boot, you are presented with some very different paths, one of them
being "Build new QEMU binaries and support files" which when selected will make
a SECOND instance of Levinux right on the host!!! It could magically appear
next to the current instance. Wow! Can TFTP transmit files BACK UP?

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
