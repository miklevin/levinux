Set Shell = CreateObject("WScript.Shell")
Shell.CurrentDirectory = ".\Pipulate.app\Contents\MacOS\"
Shell.RUN "qemu.bat >NUL 2>NUL", 0, False
set Shell = Nothing