--------------------------------------------------------------------------------
                    _                 _
                   | |     _____   __(_)_ __  _   ___  __
                   | |    / _ \ \ / /| | '_ \| | | \ \/ /
                   | |___|  __/\ V / | | | | | |_| |>  <
                   |_____|\___| \_/  |_|_| |_|\__,_/_/\_\

                              Beta Version 2.4
             Portable Linux Server and Programming Environment

--------------------------------------------------------------------------------

##Contents
* About Levinux
* Installing Levinux
    * Mac OSX
    * Windows
    * Linux
* Beginning Levinux
    * Booting Levinux
    * Connecting to Levinux
    * Next Steps
* Bugs
* Road Map
* Contributions

##About Levinux
Levinux is a tiny virtual Linux server that runs without admin rights or an
install. It will run directly from USB or Dropbox on Mac, Windows, or Linux.
This makes Levinux an ideal learning environment and a great way to run and
keep your code safe for life. Levinux is and introduction to "short stack"
development which becomes more and more relevant as Linux becomes more
ubiquitous. Levinux is a remix of Tiny Core Linux and QEMU. Tiny Core Linux is
an extremely small Linux based on how "embedded systems" work, and QEMU is a PC
emulator that runs on many platforms.

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

##Bugs
- Timeouts on the original Recipie.sh tftp transfer
- Windows QEMU still in SDL mode and captures mouse pointer

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

##Places to rev version number
1. Top of this README.txt file
2. Levinux/Reset/Server/Recipe.sh
3. Levinux/Reset/Server/Ingredients/index.html
4. Levinux/Reset/Server/Ingredients/rc.local
5. On the website at http://mikelev.in/ux/


