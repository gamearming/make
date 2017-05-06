@echo off
@echo msvc 編譯前的準備工作 config.h.W32、config.h 和 NMakefile。
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
@echo 準備完成，可以使用 build_w32.bat 或 MS IDEs 進行編譯。
goto :EOF

:ConfigSCM
sed -n "s/^AC_INIT(\[GNU make\],\[\([^]]\+\)\].*/s,%%VERSION%%,\1,g/p" "%configure_ac%" > "%configure_sed%"
echo s,%%PACKAGE%%,make,g >> "%configure_sed%"
sed -f "%configure_sed%" "%configure_tpl%" > config.h
goto :EOF

:Error
EXIT /B %1
goto :EOF