@echo off
@echo msvc 編譯前的準備工作 config.h.W32、config.h 和 NMakefile。
call :ConfigSCM
if not exist NMakefile copy NMakefile.template NMakefile
@echo 準備完成，可以使用 build_w32.bat 或 MS IDEs 進行編譯。
goto :EOF

:ConfigSCM
SET "OUTDIR=intermediate"
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
sed -n "s/^AC_INIT(\[GNU make\],\[\([^]]\+\)\].*/s,%%VERSION%%,\1,g/p" configure.ac > %OUTDIR%\config.h.W32.sed
echo s,%%PACKAGE%%,make,g >> %OUTDIR%\config.h.W32.sed
sed -f %OUTDIR%\config.h.W32.sed config.h.W32.template > config.h.W32
sed -f %OUTDIR%\config.h.W32.sed config.h.W32.template > config.h
goto :EOF
