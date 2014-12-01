# Beginning of Journal
--------------------------------------------------------------------------------
## Mon Dec  1 15:00:36 EST 2014

Pshwew! After a bunch of Windows 7 crashes after boot and login of Levinux, I
switched to Takeda Toshiya's version 12.5 of QEMU from
http://homepage3.nifty.com/takeda-toshiya/

The large file size increase is from the inclusion of the /bin subfolder, which
can be left out.

--------------------------------------------------------------------------------
## Mon Dec  1 14:24:03 EST 2014

I'm editing this out of the Recipe.sh that gets copied over from the host.
Something in here is crashing the boot. 

#Set up an ssh and sftp server (allows you to get in from the host machine)
sudo -u tc tce-load -wi dropbear > /dev/null
sudo -u tc tce-load -wi sftp-server > /dev/null
sudo -u tc tce-load -wi busybox-httpd > /dev/null
mkdir /home/tc/htdocs

tftp -g -l /home/tc/htdocs/index.html -r /Ingredients/index.html 10.0.2.2
tftp -g -l /home/tc/htdocs/style.css -r /Ingredients/style.css 10.0.2.2
tftp -g -l /home/tc/htdocs/favicon.ico -r /Ingredients/favicon.ico 10.0.2.2
tftp -g -l /home/tc/Python.sh -r /Ingredients/Python.sh 10.0.2.2
tftp -g -l /etc/dropbear/dropbear_dss_host_key -r /Ingredients/dropbear_dss_host_key 10.0.2.2
tftp -g -l /etc/dropbear/dropbear_rsa_host_key -r /Ingredients/dropbear_rsa_host_key 10.0.2.2
tftp -g -l /etc/rc.local -r /Ingredients/rc.local 10.0.2.2
echo -e "etc/rc.local\netc/init.d/dropbear\netc/dropbear\nusr/bin/dbclient\nusr/bin/dropbear\nusr/bin/dropbearconvert\nusr/bin/dropbearkey\nusr/bin/scp\nusr/bin/ssh\nusr/sbin/dropbearmulti" >> /opt/.filetool.lst

cd /tmp
echo "/etc/init.d/dropbear start" >> /opt/bootsync.sh
echo "/usr/local/httpd/sbin/httpd -p 80 -h /home/tc/htdocs -u tc:staff" >> /opt/bootsync.sh
echo "export GIT_SSL_NO_VERIFY=true" >> /home/tc/.ashrc
echo "sh /etc/rc.local" >> /opt/bootsync.sh
cd /home/tc

#Set up a password for tc user (necessary for sftp and other remote tools)
echo -e "foo\nfoo" | passwd tc > /dev/null
echo -e "etc/passwd\netc/shadow" >> /opt/.filetool.lst

filetool.sh -b >> /dev/null

--------------------------------------------------------------------------------
## Mon Dec  1 11:01:53 EST 2014

Okay, so think through next steps with this in mind:

  1. Pipulate / Levinux
  2. Client work / monthly reports
  3. Department planning / end-of-year stuff

The year-end stuff is the most important, because my boss is waiting for it and
it can only come from me. The team will step up for the monthly reports. As far
as Pipulate/Levinux, I am on the cusp of a breakthrough, and losing momentum
can be disastrous. It's all about mitigating time issues.

Mon Dec  1 13:16:02 EST 2014
Do just a quick bit of research to know what your next steps are with Levinux,
and then switch gears to department planning.

--------------------------------------------------------------------------------
## Mon Dec  1 10:36:44 EST 2014

Back at the office where I have a Windows 7 machine as my primary work machine.
I will also be setting up my Dell Pro Venue 8 here as a Windows 8.x machine,
with the nifty docking station I helped Kickstart. The main problem is going to
be enough network ports, because when I tried connecting the Linksys router
that I configured as a switch, it appeared to effect the Internet connection
here, so I'm hesitant to do that again. And so, it's very difficult to have
more than one machine at a time connected here, which is also an issue when I
bring in my Mac Laptops. It's one of the larger hardware priorities to fix
here.

On a more positive note, I tested the latest remix of Levinux here, and the old
problem that used to occur on Windows 7 didn't happen. That's an extra console
window getting stuck open when Levinux is launched. Not sure what fixed it, but
I'm glad I'm taking this new approach involving keeping the file arrangement as
close to "natural" as I can from major stable (albeit it ancient) qemu
distributions, like Q for the Mac and Takeda Toshiya's for Windows. Suddenly,
it works on OS X 10.10, 10.8.5, Windows XP, Windows 7, and I bet a lot more
once I get around to testing. Stay close to the beaten track. There's a reason
these QEMU distros haven't disappeared despite their age. I will have to get
their respective source code so as to stay in GPL compliance, but its going to
be a lot easier now that I'm documenting process and versions so well.

I am making a few other improvements to my workflow. I'm using the Dropbox
account that I set up for Levinux versions, and I'll always keep the archives
of Levinux on there, PLUS one git pull of the current Levinux project (this
working directory) and one git pull of the current Pipulate project. That means
that no matter where I'm doing my work, it will propagate to all my work
machines, and even if I forget to do a git commit/push before I leave wherever
I happen to be working that day, I can always pick up right where I left off on
any of my other machines. That's the right "balance" for Dropbox. I can't use
my giant archive of my life history on every machine I work on. This creates a
sort of super-cross-backed-up dynamic between Dropbox and Github.

These journal entries may pop up in either the Levinux CHANGELOG.md (this) or
journal.txt in the Pipulate project. I will use them fairly interchangeably,
based on what the priority of the day may be. There is too much garbage in the
Levinux distros to pollute the main Pipulate branch. People interested in JUST
Pipulate and not Levinux should not be forced to mess around with a virtual
machine or wade through tons of files that are not actually pertinent to
running Pipulate if you're installing it on your own machine.

It's the Monday after Thanksgiving, December 1st, and the monthly reports for
the SEO clients are going to be due. We have the latest round of monthly work
ahead of us. Hopefully, we can crank them out and deliver them as quickly as
possible to be able to move onto more real deliverable work. I also have things
due to my boss having to do with department planning. And so that makes 3
things to balance:

  1. Pipulate / Levinux
  2. Client work / monthly reports
  3. Department planning / end-of-year stuff

I know it's odd this sort of thinking and day-to-day detail ending up in the
changelog of a github project like Levinux, but that's part of what makes these
projects different. They are to become (already are) inextricable from my
day-to-day work, and by putting a sterilized version of my thoughts (no client
names or details revealed), I keep my mind where it belongs -- in code and
technical matters -- rather than the infinitely distracting alternative of web
browsers and the Internet.

--------------------------------------------------------------------------------
## Fri Nov 28 15:50:58 EST 2014

I extracted core.gz and vmlinuz from Core-current.iso of Tiny Core Linux and
put it in MacOS folder, along with a home.qcow file. Updated launch script also
with quite param. FYI, here's the OLD launch script for Mac:

#!/bin/bash

cd "${0%/*}"

./i386-softmmu \
-kernel vmlinuz \
-initrd microcore.gz \
-hda home.qcow \
-hdb opt.qcow \
-hdc tce.qcow \
-L ./macbios/ \
-tftp ../../../Reset/Server \
-redir tcp:2222::22 \
-redir tcp:8080::80 \
-redir tcp:8888::81 \
-append "quiet noautologin home=sda1 opt=sdb1 tce=sdc1" \
1>/dev/null 2>../../../Reset/MacErrorLog.txt

--------------------------------------------------------------------------------
## Fri Nov 28 14:39:34 EST 2014

Okay, Levinux Beta 3 is about remastering Levinux to have as few possible steps
and the most well documented steps to do a remaster. It should also result in
the most stable Levinux able to run on the broadest range of Mac and Windows
desktops. Linux desktops will come again later, but if you're already on a
Linux desktop, you don't need Levinux as much as a Windows or PC person. And
so... we start with:

Mac QEMU Q-0.9.1d118 - 10.2mb the one labeled Download latest nightly.
http://www.kju-app.org/builds/download.php?download=nightlies/Q-0.9.1d118.dmg
This is a fork of qemu from many years ago that lets you save stand-alone
versions for flash drives. I have never seen a QEMU for Mac that ran on a wider
variety of Mac OS X versions ever since, and I have tried a lot including
compiling my own and from MacPorts and Homebrew. Q is still best for Levinux
purposes.

Windows QEMU from TAKEDA Toshiya version 0.12.2 7.5 MB from 
at http://homepage3.nifty.com/takeda-toshiya/qemu/index.html
This is an ancient and consistently reliable and made available version of QEMU
for Windows, which like Q for the Mac, just runs on such a wide variety of
Windows desktops, and at only 7.5mb, delivers everything Levinux needs with a
very small footprint. I've tried compiling my own and using more modern binary
distros of QEMU for Windows.

Tiny Core Linux for x86 version 5.4 from
http://tinycorelinux.net/5.x/x86/release/TinyCore-current.iso
I keep trying to go to other Linuxes, but for a hundred tiny reasons, keep
getting drawn back to Tiny Core. There's some question whether I'll use the
TinyCore-current.iso 15MB (currently in this repo) or just Core-current.iso 8MB
which is text-only. I am no longer trying to keep file size SO SMALL, and if
there's any advantage in distributing the graphical version, I will.

Platypus 4.8 for Mac OS from
http://www.sveinbjorn.org/platypus
This software packs scripts to look and behave like stand-alone executables on
the Mac using the same trick Q uses to make stand-alone instances of QEMU.
Because the stand-alone versions are for some reason broken from Q, I used
Platypus to launch a script called qemuonmac.sh which remains editable. I then
combined the Platupus output with the Q output keeping directory structures
intact, and updated qemuonmac.sh to have the commands:

cd ../MacOS

./i386-softmmu -cdrom TinyCore-Current.iso

The Mac looks for most of its qemu-related resources from
Pipulate.app/Resources/ leaving Pipulate.app/MacOS available to have all the
Windows qemu distribution dumped into it. In such a way, the Windows and Mac
qemu files can live together in perfect harmony, hidden in a Mac Software
Bundle and everything finding what's needed when the launchers are
double-clicked. For the Windows version, I had to make a qemu.bat file which
gets called from a Pipulate.vbs file that sits at the same level as the
Pipulate.app software bundle folder.

And that's where we are at currently. It's stable and probably even useful to a
lot of people in this form who want to test different .iso files with QEMU. But
it's not quite where I need it to be. 

--------------------------------------------------------------------------------
## Fri Nov 28 14:06:38 EST 2014

I am starting a pretty big remastering of Levinux. The current status is merely
the latest Tiny Core Linux combined with an old fork of QEMU for the Mac called
Q and an old pre-compiled binary of QEMU for Windows. Stay tuned. I'll get it
back to where Levinux was, and combine it with my Pipulate project.

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
