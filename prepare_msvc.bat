@echo off
@echo msvc �sĶ�e���ǳƤu�@ config.h.W32�Bconfig.h �M NMakefile�C
call :ConfigSCM
if not exist NMakefile copy NMakefile.template NMakefile
@echo �ǳƧ����A�i�H�ϥ� build_w32.bat �� MS IDEs �i��sĶ�C
goto :EOF

:ConfigSCM
SET "OUTDIR=intermediate"
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
sed -n "s/^AC_INIT(\[GNU make\],\[\([^]]\+\)\].*/s,%%VERSION%%,\1,g/p" configure.ac > %OUTDIR%\config.h.W32.sed
echo s,%%PACKAGE%%,make,g >> %OUTDIR%\config.h.W32.sed
sed -f %OUTDIR%\config.h.W32.sed config.h.W32.template > config.h.W32
sed -f %OUTDIR%\config.h.W32.sed config.h.W32.template > config.h
goto :EOF
