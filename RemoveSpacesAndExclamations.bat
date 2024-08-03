@echo off
title XboxSaveLoader utility

echo This script will remove all exclamation marks and spaces from all folder names in the currect directory.
echo.
pause
cls

setlocal

call :treeProcess
goto :eof

:treeProcess
	rem Do whatever you want here over the files of this subdir, for example:

    for /f "delims=" %%D in ('dir /a:d /b') do  call :removeExclamation "%%D"
    for /f "delims=" %%D in ('dir /a:d /b') do  call :removeSpace "%%D"
	for /D %%d in (*) do (
		cd %%d
		call :treeProcess
		cd ..
	)
	exit /b

:removeExclamation
	echo Checking file: %~1
    set "FROM=%~1"
    set "TO=%FROM:!=%"
    ren "%FROM%" "%TO%"
	goto :eof
	
:removeSpace
    set "FROM=%~1"
    set "TO=%FROM: =%"
    ren "%FROM%" "%TO%"
	goto :eof