@echo off
@echo msvc �sĶ�e���ǳƤu�@ config.h.W32�Bconfig.h �M NMakefile�C
cd ..
SET "OUTDIR=intermediate" 
SET "rootDir=%cd%"
SET "configure_ac=%rootDir%\configure.ac"
SET "configure_tpl=%rootDir%\config.h.W32.template"
SET "configure_sed=%OUTDIR%\config.h.W32.sed"
cd %~dp0
if not exist library mklink /j library "../../Library"

if not exist "%configure_ac%"  call :Error 1
if not exist "%configure_tpl%" call :Error 2
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
call :ConfigSCM
if not exist "config.h" call :Error 3
@echo �ǳƧ����A�i�H�ϥ� build_w32.bat �� MS IDEs �i��sĶ�C
goto :EOF

:ConfigSCM
sed -n "s/^AC_INIT(\[GNU make\],\[\([^]]\+\)\].*/s,%%VERSION%%,\1,g/p" "%configure_ac%" > "%configure_sed%"
echo s,%%PACKAGE%%,make,g >> "%configure_sed%"
sed -f "%configure_sed%" "%configure_tpl%" > config.h
goto :EOF

:Error
EXIT /B %1
goto :EOF