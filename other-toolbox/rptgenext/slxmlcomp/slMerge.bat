@ECHO OFF
SETLOCAL
set myPath=%~dp0
set matlabExe=%myPath%..\..\..\bin\matlab.exe
set baseFile=%1
set mineFile=%2
set theirsFile=%3
set targetFile=%4

"%matlabExe%" -r "slxmlcomp.internal.link.slMerge('%baseFile%','%mineFile%', '%theirsFile%', '%targetFile%', true)" -wait
