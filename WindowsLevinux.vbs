Set Shell = CreateObject("WScript.Shell")
Shell.RUN "attrib -r .\*.* /s"
Shell.CurrentDirectory = ".\Pipulate.app\Contents\MacOS\"
Shell.RUN "qemu32.bat >NUL 2>NUL", 0, False
set Shell = Nothing
