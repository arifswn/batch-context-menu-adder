ECHO ON
@echo off
title Context Menu Adder v1.0
color 0b
cls

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
setlocal enableextensions disabledelayedexpansion
s
set Regs=Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
attrib +s +r +h "%temp%\*.bat"
attrib +s +r +h "%temp%"
reg add "HKLM\%Regs%\Folder\Hidden\SHOWALL" /v "CheckedValue" /t REG_DWORD /d 0 /f>nul

:CONFIRM
cls
echo.
echo ________________________________________________________________________________
echo.
echo                                .:: Sinau Tech ::.
echo                           .:: https://sinautech.id ::.
echo.
echo ________________________________________________________________________________
echo.
echo       NNNNNNN NNNN      NNNN     NNNN     NNNNNN   NNNNNN   NNNNNN NNNNN
echo       NN      NN NN    NN NN    NN  NN    NN   NN  NN   NN  NN     NN  NN
echo       NN      NN  NN  NN  NN   NN    NN   NN    NN NN    NN NNNNNN NNNNN
echo       NN      NN   NNNN   NN  NN NNNN NN  NN   NN  NN   NN  NN     NN  NN
echo       NNNNNNN NN          NN NN        NN NNNNNN   NNNNNN   NNNNNN NN   NN
echo ________________________________________________________________________________
echo.
echo Context Menu Adder v1.0
echo.
echo Context Menu Adder is a portable application.
echo Add your favorite shorcut in context menu : Program, Website Link.
echo A single entry is made on the desktop right-click menu.
echo.
echo ________________________________________________________________________________
echo.
echo .:: Main Menu ::.
echo.
echo 1) Added Single Context Menu
echo 2) About
echo 3) Exit
echo.
set /p "cho=Enter Your Choice : "
if %cho%==1 goto SINGLE
if %cho%==2 goto ABOUT
if %cho%==3 goto EXIT
echo Invalid Choice!>err.txt
echo Try Again...>>err.txt
msg %username% /TIME:3<err.txt
del err.txt
goto CONFIRM

:SINGLE
cls
echo.
echo       NNNNNNN NNNN      NNNN     NNNN     NNNNNN   NNNNNN   NNNNNN NNNNN
echo       NN      NN NN    NN NN    NN  NN    NN   NN  NN   NN  NN     NN  NN
echo       NN      NN  NN  NN  NN   NN    NN   NN    NN NN    NN NNNNNN NNNNN
echo       NN      NN   NNNN   NN  NN NNNN NN  NN   NN  NN   NN  NN     NN  NN
echo       NNNNNNN NN          NN NN        NN NNNNNN   NNNNNN   NNNNNN NN   NN
echo.
echo ________________________________________________________________________________
set /p "menu=Enter Your Menu Name : "
set /p "prog=Enter Your Path Program : "
echo.
set /p "gen=Enter Y Generate REG File / N Cancel Generate : "
if %gen%==Y (
if exist "%menu%.reg" del /a /f "%menu%.reg"
if exist "%menu%_Undo.reg" del /a /f "%menu%_Undo.reg"
echo Windows Registry Editor Version 5.00>"%menu%.reg"
echo.>>"%menu%.reg"
echo [HKEY_CLASSES_ROOT\Directory\Background\shell\%menu%]>>"%menu%.reg"
echo "Icon"="%prog:\=\\%">>"%menu%.reg"
echo.>>"%menu%.reg"
echo [HKEY_CLASSES_ROOT\Directory\Background\shell\%menu%\command]>>"%menu%.reg"
echo @="%prog:\=\\%">>"%menu%.reg"
echo Windows Registry Editor Version 5.00>"%menu%_Undo.reg"
echo.>>"%menu%_Undo.reg"
echo [-HKEY_CLASSES_ROOT\Directory\Background\shell\%menu%]>>"%menu%_Undo.reg"
echo "Icon"="%prog:\=\\%">>"%menu%_Undo.reg"
echo.>>"%menu%_Undo.reg"
echo [-HKEY_CLASSES_ROOT\Directory\Background\shell\%menu%\command]>>"%menu%_Undo.reg"
echo @="%prog:\=\\%">>"%menu%_Undo.reg"
if not exist "%menu%.reg" (
echo REG File Not Found! Failed Generate to Reg File.>err.txt
echo Send your problem at e-mail : arifswn1@gmail.com>>err.txt
msg %username% /TIME:15<err.txt
del err.txt
exit)
if not exist "%menu%_Undo.reg" (
echo REG File Not Found! Failed Generate to Reg File.>err.txt
echo Send your problem at e-mail : arifswn1@gmail.com>>err.txt
msg %username% /TIME:15<err.txt
del err.txt
exit)
msg %username% /TIME:5 Successfully Generate REG File...
exit)
if %gen%==N goto CONFIRM
echo Invalid Choice!>err.txt
echo Try Again...>>err.txt
msg %username% /TIME:3<err.txt
del err.txt
goto SINGLE

:ABOUT
cls
echo ________________________________________________________________________________
echo.
echo                                .:: Sinau Tech ::.
echo                           .:: https://sinautech.id ::.
echo.
echo ________________________________________________________________________________
echo.
echo       NNNNNNN NNNN      NNNN     NNNN     NNNNNN   NNNNNN   NNNNNN NNNNN
echo       NN      NN NN    NN NN    NN  NN    NN   NN  NN   NN  NN     NN  NN
echo       NN      NN  NN  NN  NN   NN    NN   NN    NN NN    NN NNNNNN NNNNN
echo       NN      NN   NNNN   NN  NN NNNN NN  NN   NN  NN   NN  NN     NN  NN
echo       NNNNNNN NN          NN NN        NN NNNNNN   NNNNNN   NNNNNN NN   NN
echo ________________________________________________________________________________
echo.
echo                               .:: Main Features ::.
echo.
echo Context Menu Adder v1.0 :
echo    - Improve! User Interface
echo    - Improve! Support Win XP/7/8/10
echo    - Portable Application
echo    - Clear Recent Files
echo    - File Size Checking
echo    - Added Single Context Menu
pause>nul
goto CONFIRM

:EXIT
attrib -h -s -r "%temp%\*.bat"
attrib -h -s -r "%temp%"
REG ADD "HKLM\%Regs%\Folder\Hidden\SHOWALL" /v "CheckedValue" /t REG_DWORD /d 1 /f>nul
del /a /f "%temp%\*.bat"
exit /b
