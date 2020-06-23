@echo off
:SetUp
SETLOCAL ENABLEDELAYEDEXPANSION
set expl=0

:Loading
mode 100,100
echo ---------------------*Decompressing database
echo Komply is Loading   -*
echo ---------------------*
if exist Files/database.zip (
	if exist Files/7z.exe (
	echo Normal Decompressing done
	Files/7z.exe e Files/database.zip
	) ELSE (echo Error please download 7z.exe if it did not come with the auto-compile)
) ELSE (echo Error please download database if it did not come with the auto-compile)
ping localhost -n 4 >NUL
echo ---------------------*Decompressing database
echo Komply is Loading   -*Checking for latest updates
echo ---------------------*

ping localhost -n 4 >NUL
mode 50,12

:start
echo 1) System Repair
echo 2) Start Explorer
echo 3) Start Explorer (unsafe mode)
set /p option=Choose: 
if !option! == 1 goto repair
if %option% == 2 (set /a expl=1 && goto repair)
if %option% == 3 goto expl
goto start

:repair
if exist c:\windows\system32\hal.dll (
echo C:\windows\system32\hal.dll found
goto REPCHECK
) ELSE (echo hal.dll Missing Can't recover)

:REPCHECK
if !expl!==0 goto rep0
if !expl!==1 goto rep1

:rep0
echo Fixed
	PING localhost -n 3 >NUL
	cls
	goto start
	
:rep1
start explorer.exe
	echo Started
	PING localhost -n 3 >NUL
	cls
	goto start



