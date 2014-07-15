#!/bin/bash

osascript -e 'tell app "Terminal"
    tell application "Finder"
    set myFolder to parent of (path to me) as alias
    end
    set myPosixFolder to POSIX path of myFolder
    do script "DYLD_LIBRARY_PATH=" & myPosixFolder & "Levinux\\ on\\ Mac.app/Contents/MacOS && export DYLD_LIBRARY_PATH && cd " & myPosixFolder & "Levinux\\ on\\ Mac.app/Contents/MacOS && ./i386-softmmu -curses -kernel vmlinuz -initrd microcore.gz -hda home.qcow -hdb opt.qcow -hdc tce.qcow -L ./macbios/ -tftp ../../../Reset/Server -redir tcp:2222::22 -redir tcp:8080::80 -redir tcp:8888::81 -append \"quiet noautologin home=sda1 opt=sdb1 tce=sdc1\" 2>../../../Reset/MacErrorLog.txt && exit"
    tell application "Terminal"
       activate
       set background color of window 1 to {0,0,0,0}
       set bounds of window 1 to {100, 100, (571+100), (366+100)}
    end tell
end tell'
exit
