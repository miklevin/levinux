--------------------------------------------------------------------------------
                    _                 _
                   | |     _____   __(_)_ __  _   ___  __
                   | |    / _ \ \ / /| | '_ \| | | \ \/ /
                   | |___|  __/\ V / | | | | | |_| |>  <
                   |_____|\___| \_/  |_|_| |_|\__,_/_/\_\

                               Beta Version 3.0

                     A Re-spin of Tiny Core Linux and QEMU
                   ~20 MB, runs from Dropbox and USB Drives
                    and requires no install or Admin rights
                    Also is sort of a game challenging you
                      to learn Linux, Python, vim and git

--------------------------------------------------------------------------------

# Installation Instructions

Download the zip, unarchive it and...

1. If on Windows, double-click Pipulate.vbs.
2. If on Mac OSX, double-click Pipulate.
3. If on Linux, double-click Pipulate.sh and select Run in Terminal.

## Machine-specific issues

1. Windows may prompt you to allow it to run and unblock firewall.
2. Mac OS X may require you to right-click or Control-click and open.
3. Ubuntu 14.04 Nautilus / Edit / Preferences / Behavior / Executable Text
   Files, "Select Ask Each Time"

## Including additional packages

Inclusion of additional packages is simple, but requires a few steps be taken to optimize and set up.

1. Download the package and any dependencies from http://distro.ibiblio.org/tinycorelinux/6.x/x86/tcz/ (dependencies are listed in the {package}.tcz.dep file).
2. Add the downloaded `.tcz` files to `/Reset/Server/Ingredients/Custom`
3. Add the name of the downloaded package **without the `.tcz` file extension** to `/Reset/Server/Ingredients/extras.lst`

**Optional** `/Reset/Server/Ingredients/install_extras.sh` can be duplicated and point at a file other than `extras.lst`.  This can allow for different packages to be grouped and have group output silenced by pointing the output to `/dev/null`
**Note:** Ensure you do not write below the last line in the `extras.lst` file
