@echo off
setlocal ENABLEDELAYEDEXPANSION
set directoryPath=%~dp0

::variables
call :setESC
set directoryPath=%~dp0
set defaultIP=%ESC%[41m00.00.000.00%ESC%[0m
set consoleIP=%defaultIP%
set defaultMail=%ESC%[41mKMGB-DI2TL00000%ESC%[0m
set accountMail=%defaultMail%
set defaultSCID=00000000-0000-0000-0000-000000000000
set titleSCID=%defaultSCID%
set currentSubfolderPath=%cd%

::create appdata folder, I don't even check if it already exists because it won't break anything lol
mkdir %appdata%\XboxSaveLoader\Config\
cls
::
::
::

:MENU
title XboxSaveLoader
cls
call :PRINT_HEADER "  Main Menu"
echo [A] Set IP of the console (currently: %consoleIP%)
echo [B] Set XBOX account email (currently %accountMail%)
echo [S] Set title's SCID (currently %titleSCID%)
echo [C] Save config
echo [D] Load config
echo [E] Export the current save 
echo [Z] About
call :PRINT_DIVIDER
if %directoryPath% NEQ !cd!\ (
	echo [0] GO BACK
	call :PRINT_DIVIDER
)
set /A index=1
for /f "delims=" %%D in ('dir /a:d /b') do (
	set dirs[!index!]=%%D
	set /A "r=!index! %% 2"

	cd %%D
	set isDirectorySave[!index!]=false
	set tempIsSaveFlag=false
	for %%f in (*.xml) do (
		if "%%~xf"==".xml" (
		set isDirectorySave[!index!]=true
		set tempIsSaveFlag=true
		)
	)
	cd..
	
	set colorCode=[100m
	::print every second directory as gray
	if !r! GTR 0 (
		set colorCode=100m
	) else (
		set colorCode=07m
	)
	
	::set folder type text tag variable
	set folderType=%ESC%[33mFolder%ESC%[0m
	if !tempIsSaveFlag! EQU true set folderType=%ESC%[34mSave%ESC%[0m
	
	echo [!index!] !folderType! %ESC%[!colorCode!%%D%ESC%[0m 


	
	set /A index+=1
	set tempIsSaveFlag=
)

call :PRINT_DIVIDER
set /p choice="    Enter your choice: "

if /i %choice% EQU A (
	call :PRINT_DIVIDER
	set /p consoleIP="    Enter your console's IP: "
	goto :MENU
)
if /i %choice% EQU B (
	call :PRINT_DIVIDER
	set /p accountMail="    Enter your XBOX account email: "
	goto :MENU
)
if /i %choice% EQU S (
	call :PRINT_DIVIDER
	set /p titleSCID="    Enter your SCID: "
	goto :MENU
)
if /i %choice% EQU C (
	echo %consoleIP%> %appdata%\XboxSaveLoader\Config\consoleIP.ini
	echo %accountMail%> %appdata%\XboxSaveLoader\Config\accountMail.ini
	echo %titleSCID%> %appdata%\XboxSaveLoader\Config\titleSCID.ini
	goto :MENU
)
if /i %choice% EQU D (
	set /p consoleIP=< %appdata%\XboxSaveLoader\Config\consoleIP.ini
	set /p accountMail=< %appdata%\XboxSaveLoader\Config\accountMail.ini
	set /p titleSCID=< %appdata%\XboxSaveLoader\Config\titleSCID.ini
	
	goto :MENU
)
if /i %choice% EQU Z (
	call :ABOUT
	goto :MENU
)
if /i %choice% EQU E (
	call :DEFAULTS_CHECK
	set /p exportSaveName="    Enter a title for the current save: "
	goto :SAVE_EXPORT
)
if /i %choice% EQU 0 (
	if %directoryPath% NEQ !cd!\ (
		cd..
		goto :MENU
	)
		
)
call :DEFAULTS_CHECK

set currentSubfolderPath=%cd%
cd !dirs[%choice%]!

:: if cd failed %cd% will be tha same as before - then call error message 
if %cd% NEQ %currentSubfolderPath%\!dirs[%choice%]! call :INCORRECT_CHOICE
cd..

if !isDirectorySave[%choice%]! EQU false (
	::if choice is not a save
	cd !dirs[%choice%]!
	
	goto :MENU
)
::if choice is a save
cls 
echo %ESC%[32mSetting the save path to:%ESC%[0m
cd !dirs[%choice%]!
@echo off
for %%f in (*.xml) do (
	if "%%~xf"==".xml" set foundName=%%f
)
set savePath=%currentSubfolderPath%\!dirs[%choice%]!\!foundName!
echo %ESC%[32m%savePath%%ESC%[0m
echo %ESC%[32mLaunching GamingXboxVS22%ESC%[0m
call "C:\Program Files (x86)\Microsoft GDK\Command Prompts\GamingXboxVars.cmd" GamingXboxVS2022
echo %ESC%[32mConnecting to the console%ESC%[0m
xbconnect %consoleIP%
echo %ESC%[32mImporting the save...%ESC%[0m
xbstorage import "%savePath%" /msa:%accountMail%@xboxtest.com /scid:6c280100-1cfe-40bd-9f32-53a32eba7bf3 /force
call :PRINT_HEADER "    %ESC%[32mDONE!%ESC%[0m"
pause
cd %directoryPath%
goto :MENU

:SAVE_EXPORT
cls
echo %ESC%[32mSetting the save directory to:%ESC%[0m
set savePath=%directoryPath%X_____EXPORTED_SAVES\%exportSaveName%
set savePathWithFilename=%directoryPath%X_____EXPORTED_SAVES\%exportSaveName%\save_game_bus1.xml

:OVERWRITE_CHECK
cd %directoryPath%
cd %savePath%
if %savePath% EQU %cd% (
	cls
	call :PRINT_HEADER "  WARNING"
	echo.
	echo Save file at:
	echo %savePath%
	echo already exists. Do you wish to overwrite?
	echo.
	echo [Y] YES
	echo [N] NO
	echo.
	set /p choice="    Enter your choice: "
	if /i !choice! EQU Y ( 
		goto :POST_OVERWRITE_CHECK
	) 
	if /i !choice! EQU N ( 
		cd %directoryPath%
		goto :MENU
	)
	goto :OVERWRITE_CHECK
)
:POST_OVERWRITE_CHECK
cls
echo %ESC%[32m%savePath%%ESC%[0m
echo %ESC%[32mCreating the save directory...%ESC%[0m
	mkdir %savePath%
	cd %savePath%
echo %ESC%[32mLaunching GamingXboxVS22%ESC%[0m
call "C:\Program Files (x86)\Microsoft GDK\Command Prompts\GamingXboxVars.cmd" GamingXboxVS2022
echo %ESC%[32mConnecting to the console%ESC%[0m
xbconnect %consoleIP%
echo %ESC%[32mExporting the save...%ESC%[0m
xbstorage export "%savePathWithFilename%" /msa:%accountMail%@xboxtest.com /scid:6c280100-1cfe-40bd-9f32-53a32eba7bf3 /force 
call :PRINT_HEADER "    %ESC%[32mDONE!%ESC%[0m"
pause
cd %directoryPath%
goto :MENU

:INCORRECT_CHOICE
cls
call :PRINT_HEADER "   ERROR"
echo.
echo Incorrect choice!
echo.
echo.
pause
goto :MENU

:PRINT_DIVIDER
echo    ----------------------------------------------------
goto :eof

:PRINT_HEADER
echo    ----------------------------------------------------
echo                        %~1
echo    ----------------------------------------------------
goto :eof

:ABOUT
cls
call :PRINT_HEADER XboxSaveLoader
echo Version: 1.64.2 (multi level save bank structure update+SCID changing; happy birthday to me :D) 25th April 2024
echo.
echo Config parameters are stored at the following path:
echo %appdata%\XboxSaveLoader\Config\
echo.
echo Author: Apolonia Niesciur
echo.
echo Credit to:
echo   Krzysztof Musial (credit for couple QoL feature ideas)
echo Special thanks to:
echo   Igor Samek
echo   Przemyslaw Dadun
call :PRINT_DIVIDER
pause
goto :eof

:DEFAULTS_CHECK
if %consoleIP% EQU %defaultIP% (
	cls
	call :PRINT_HEADER "   ERROR"
	echo.
	echo Please set the console IP!
	echo.
	echo.
	pause
	goto :MENU
)
if %accountMail% EQU %defaultMail% (
	cls
	call :PRINT_HEADER "   ERROR"
	echo.
	echo Please set the Xbox account email!
	echo.
	echo.
	pause
	goto :MENU
)
goto :eof

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0