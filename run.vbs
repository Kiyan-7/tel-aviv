Set shell = CreateObject("WScript.Shell")
shell.Run """" & shell.ExpandEnvironmentStrings("%USERPROFILE%") & "\Downloads\tel-aviv.bat""", 0, False
