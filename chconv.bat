@echo off

setlocal

:: there is invisible ESC character (ASCII code 27) after '=':
set esc=

set strongBlue=%esc%[1;34m
set defaultColor=%esc%[0m

echo %strongBlue%
echo -------------------------------------------------------------------------------
echo %defaultColor%

:LOOP
    ebook-convert %1 "%~dpn1_chm.epub" --cover "%~dpn1.jpg"

    echo %strongBlue%
    echo -------------------------------------------------------------------------------
    echo %defaultColor%

    shift
    if not "%~1"=="" goto LOOP

endlocal