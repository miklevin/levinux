Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.CurrentDirectory = ".\Levinux On Mac.app\Contents\MacOS\"
Return = WshShell.Run("RunOnWindows.bat", 0, False)
set WshShell = Nothing
