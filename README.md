--------------------------------------------------------------------------------
                    _                 _
                   | |     _____   __(_)_ __  _   ___  __
                   | |    / _ \ \ / /| | '_ \| | | \ \/ /
                   | |___|  __/\ V / | | | | | |_| |>  <
                   |_____|\___| \_/  |_|_| |_|\__,_/_/\_\

                              Beta Version 2.3
             Portable Linux Server and Programming Environment

--------------------------------------------------------------------------------

##Contents
* About Levinux
* Installing Levinux
    * Mac OSX
    * Windows
    * Linux
    * Tested Systems
* Beginning Levinux
    * Booting Levinux
    * Connecting to Levinux
    * The Next Step
* File Manifest
* Bugs
* Road Map
* Dependencies
    * Linux
    * Mac OSX 
* Contributions
* Change-log 

##About Levinux
Levinux is a tiny virtual Linux server that runs without installation from USB
or Dropbox on Mac, Windows, or Linux. This makes Levinux an ideal learning
environment and a great way to run and keep your code safe for life. Levinux is
and introduction to "short stack" development which becomes more and more
relevant as Linux becomes more ubiquitous. Levinux is a remix of Tiny Core
Linux and QEMU. Tiny Core Linux is an extremely small Linux based on how
"embedded systems" work, and QEMU is a PC emulator that runs on many platforms.


##Installing Levinux
###Mac OSX
For Mac OSX users, extract the ".zip" file to any folder on your computer, and
run the application labelled "Levinux on Mac". This will boot Levinux and start
to download the necessary software packages for Levinux to properly function,
such as git and Python. To download these packages, you will need a less-
restrictive firewall than most, otherwise Levinux will not be able to connect
to the software repositories.

###Windows
For Windows users, extract the ".zip" file and run the VBScript script file
"Levinux on Windows.vbs". This will boot Levinux and start downloading the
software packages, such as Python and git, for Levinux. Note that like the
instructions for Mac OSX, you will need a less-restrictive firewall, otherwise
the downloads will fail.

###Linux
Extract the ".zip" file and run the script "Levinux on Linux.sh". This will
connect to the software repositories and start downloading the necessary
packages for Levinux to function properly. On some systems, however, the script
will fail to run, or open in a text editor. To solve this problem, change the
permissions on the script to executable, and then try running the script.
Unfortunately, since there are so many different distributions of Linux, this
readme cannot provide specific instructions for all of them.

###Tested Systems
* Mac OS X 10.8.5 64-bit
* Windows 7 Enterprise 64-bit SP1
* Windows XP Professional 32-bit SP3
* Ubuntu 13.04 32-bit
* Ubuntu 13.04 64-bit
* OpenSUSE 64-bit

##Beginning Levinux
###Booting Levinux 
After downloading, extracting and running the OS-specific script, Levinux will
start to boot. Levinux is based on Tiny Core Linux, so the boot order and
options are similar. For more documentation, go to the Tiny Core Linux site. At
this point, Levinux will also load the additional software extensions like
Python and git. This may take some time depending on the system. After this has
finished, a 'splash screen' is presented with 4 options which you can select.

1. Learn More - To Learn more about this Levinux virtual computer
2. Exit to Login - Exits 'splash screen' to a normal Linux command line login
3. Shut Down - Safely shuts down Levinux. Use this to shut down Levinux instead of closing the window.
4. Get Python - Gets Python, vim and git from repositories

###Connecting To Levinux
Unlike many other Linux distributions, Levinux requires you to connect with it
through a SSH, which is the secure way to get the type-in user interface to
servers.

On Mac or Linux, open up a terminal and type in "ssh tc@localhost -p 2222" and
when prompted for the password enter "foo". This will connect you to the
account tc at the Levinux computer located on this computer (therefore
"localhost") at port 2222. For Windows users, you will need to download another
application to use Levinux. The most reliable is PuTTY. In PuTTY enter
"localhost" into the "Host Name (or IP address)" field, and replace "22" with
"2222" in the "Port" field.Then click "Open" to open the connection. PuTTY will
now connect you to Levinux in a new window. Enter your username "tc" and
password "foo" when prompted.Type "exit" to end the connection. You will now be
connected to Levinux with a Linux prompt.

###The Next Step
To proceed to the next step, you will need to access the provided
documentation. This is hosted by Levinux. To access it once Levinux is booted,
you can type "localhost:8080" into any browser to load the documentation
about how to use Levinux and how to get started programming with it.

##File Manifest
```
- Levinux
    - README.txt
    - Levinux on Windows.vbs 
    - Levinux on Linux.sh 
    - Levinux on Mac.app 
        -Contents
            -MacOS
                -macbios
                    -bios.bin
                    -vgabios-cirrus.bin
                 -bios.bin
                 -common
                 -efi-e1000.rom
                 -en-us
                 -fmod.dll
                 -home.qcow
                 -home-fresh.qcow
                 -i386-softmmu
                 -kvmvapic.bin
                 -libglib-2.0.0.dylib
		 -libgmp.10.dylib
		 -libgnutls.28.dylib
		 -libgthread-2.0.0.dylib
		 -libhogweed.2.3.dylib
		 -libintl.8.dylib
		 -libjpeg.8.dylib
		 -libnettle.4.5.dylib
		 -libp11-kit.0.dylib
		 -libpixman-1.0.dylib
		 -libtasn1.6.dylib
                 -LICENSE
                 -linuxboot.bin
                 -microcore.gz
                 -opt.qcow
                 -opt-fresh.qcow
                 -pxe-e1000.bin
                 -pxe-rtl8139.bin
                 -pxe-rtl8139.rom
                 -qemu.exe
                 -qemu-system-i386
                 -qemu-system-x86_64
                 -RunOnMac.sh
                 -RunOnWindows.bat
                 -SDL.dll
                 -stderr.txt
                 -stdout.txt
                 -tce.qcow
                 -tce-fresh.qcow
                 -vapic.bin
                 -vgabios-cirrus.bin
                 -vmlinuz
             -Resources
                 -q_icon.icns
             -Info.plist   
    -Reset
        -Reset from a Mac.app
            -Contents
                -MacOS
                    -Reset From a Mac
                -Resources
                    -MainMenu.nib
                        -designable.nib
                        -keyedobjects.nib
                    -appIcon.icns
                    -AppSettings.plist
                    -script
                -Info.plist 
        -Server
            -Ingredients
                -.vimrc.vimrc
                -blackboard.vim
                -bottle.py
                -dropbear_dss_host_key
                -dropbear_rsa_hot_key
                -favicon.ico
                -index.html
                -Python.sh
                -python.vim
                -rc.local
                -style.css
                -webapp.py
            -Recipe.sh
        -home-backup.qcow
        -Reset from Linux.sh
        -Reset from Windows.bat
        -WARNING.bat
        -WinErrorLog.txt
```
##Bugs
- Timeouts on the original Recipie.sh tftp transfer

##Road Map
- Update core.gz and vmlinuz to the latest Tiny Core Linux versions
- Figure out how to do a static compile with Homebrew to eliminate .dylib's
- Compile Windows qemu using curses mode eliminate pointer grabbing
- Figure out how to configure compiles for extremely minimal qemu's.
- A lesson on how Levinux is put together & why (QEMU networking, port mapping)
- A tutorial on pulling down new software from the Tiny Core Linux repository
- [Done] A tutorial teaching how to SSH into your Levinux
- [Done] A tutorial how to reach that text file from localhost:8080
- [Done] A turorial on how Levinux works so well with Dropbox for Code for Life.
- [Done] A tutorial how to use vim to create a new text file (vim intro)
- [Done] A tutorial on how to push code up to Github, Bitbucket or Google Code


##Change-log
Tue Oct 29 15:51:26 EDT 2013
Now both Linux and Mac QEMU's are compiled from source.
Compiled QEMU 1.6.1 from source for 64 bit Linux
Compiled QEMU 1.6.1 from Homebrew for Mac
Added a bunch of .dylib files for new Mac dependencies
Switched Linux start script to text-only curses mode
Radically altered Mac startup script to enable curses mode (AppleScript used)
Moved keymap files out of subfolder into MacOS for Mac qemu requirement
Added efi-e1000.rom for Mac qemu requirement

Thu Oct 24 16:49:27 EDT 2013
This is the first major step towards not relying on magic cocktail binaries
Compiled qemu from source for 32-bit Linux, QEMU version 1.6.1
Compiled with --static --enable-curses option for text-only mode
Added -curses parameter to 32-bit branch of Linux launch script
Removed libaio.so.1
Removed libcaca.so.0
Removed libcurl-gnutls.so.4
Removed libgnutls.so.26
Removed librados.so.2
Removed librbd.so.1
Removed librtmp.so.0
Removed libSDL-1.2.so.0
Removed libslang.so.2

Mon Oct 11 13:06:00 EDT 2013
Broke webapp2 and dependencies out into optional Libraries menu
Added color coding to show which libraries are already installed

Thu Oct  3 13:57:31 EDT 2013
Added WebOb, Paste, and webapp2 to be more like Google App Engine web dev env
Added requests package because it's the right thing to do
For OpenSUSE 64, added libcaca.so.0
For OpenSUSE 64, added libcurl-gnutls.so.4
For OpenSUSE 64, added libgnutls.so.26
For OpenSUSE 64, added libpng12.so.0
For OpenSUSE 64, added librtmp.so.0
For OpenSUSE 64, added libslang.so.2
For OpenSUSE 64, added libtasn1.so.3

Tue Oct  1 14:39:47 PDT 2013
Added libSDL-1.2.so.0 for 64 bit Ubuntu compatibility
Added menu for Client Libraries, starting with Google API Python Client

Wed Sep 25 17:34:59 EDT 2013
Edited Python.sh to remove pip version dependency. Made pip persistent.

Tue May 21 13:03:53 EDT 2013
Revised README.txt
Added kvmvapic.bin
Added pxe-rtl8139.rom

Mon May 20 14:30:08 EDT 2013
Added librbd.so.1 for 32 bit Linux
Added librados.so.2 for 32 bit Linux
Changed LD_LIBRARY_PATH to search both ./linux64/:./

Thu May 16 14:07:19 PDT 2013
Replaced incorrect qemu-system-x86_64 binary with good from Ubuntu 64-bit
Fixed chmod command in Linux launch script to set execution bit correctly
Created MacOS/linux64 directory and put 64-bit version of libaio.so.1 in there
Put missing libraries for 64 bit: librdb.so.1 and librados.so.2 in linux64

Tue May  7 15:22:53 EDT 2013
Replaced qemu linux binary with qemu-system-i386 and qemu-system-x86_64
Changed Linux launch script to auto-sense 32 or 64 bit and use correct binary
Added tce-load -wi python-distribute to Python.sh
Added sudo easy_install pip to Python.sh
Added entries to .filetool.lst to make pip persistent
Added pxe-rtl8139.bin and vapic.bin to MacOS folder per net feedback
Changed LD_LIBRARY_PATH for 64-bit version. Only 3 dependencies! Binary is big!

Tue Apr 30 13:31:58 EDT 2013
Added curl and expat2 repository pull requirements for git to Python.sh
Added echo "export GIT_SSL_NO_VERIFY=true" >> /home/tc/.ashrc to Recipe.sh

Sat Apr 20 05:51:45 EDT 2013
Dramatically improved index.html at localhost:8080
Added instructions on how to SSH from Mac or Windows.
Added instructions on how to edit HTML with vi.
Added Clout-ware, history, community messages and such.

Thu Apr 18 18:29:17 EDT 2013
Added the bottle.py single-file web framework. Put in Ingredients due to https.
Added port redirection to allow 8888 through.
Added /home/tc/pydocs folder for bottle.py
Created a webapp.py default app for bottle.py
Added favicon.ico to prevent 404s and added it Recipe.sh and Python.sh tftp
Upper-cased Python.sh to be consistent with Recipe.sh

Tue Apr 16 13:19:53 EDT 2013
Added set +e to Linux & OS X reset scripts to ensure it doesn't exit out.
Added menu item #4 to fetch Python / added python.sh to Ingredients.
Fetching vim with Python. Color coding has lots of dependencies including XLibs!
Fetching git with Python. Changed my mine from Mercurial. Git is better to know.
Added .vimrc, python.vim and blackboard.vim to Ingredients.
Made menu item #4 change based on whether or not Python is installed.
Switched from g-wan to busybox-httpd. Speeds up initial boot.
Added an index.html to the Ingredients folder and tftp it into place.

Mon Apr 15 16:50:14 EDT 2013
Added *conflicted* to Reset scripts to clean up Dropbox conflict cruft.
Instruct how to run from Linux terminal if double-click only loads text editor.
Redirecting all stderr output as [Platform]ErrorLog.txt into /Reset folder.

Thu Feb 14 17:08:41 EST 2013
Gave up on compiling my own QEMU binaries (for now) and using what was in
Levinux Proof of Concept, but removed unnecessary files and added a number of
dependency files after testing on various default OSes.

##Places to rev version number
1. Top of this README.txt file
2. Levinux/Reset/Server/Recipe.sh
3. Levinux/Reset/Server/Ingredients/index.html
4. Levinux/Reset/Server/Ingredients/rc.local
5. On the website at http://mikelev.in/ux/


