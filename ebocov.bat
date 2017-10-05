@echo off

setlocal

:: there is invisible ESC character (ASCII code 27) after '=':
set esc=

set strongRed=%esc%[1;31m
set defaultColor=%esc%[0m

echo %strongRed%
echo -------------------------------------------------------------------------------
echo %defaultColor%

:LOOP
    ebook-convert %1 "%~dpn1_cover%~x1" --cover "%~dpn1.jpg"

    echo %strongRed%
    echo -------------------------------------------------------------------------------
    echo %defaultColor%

    shift
    if not "%~1"=="" goto LOOP

endlocal