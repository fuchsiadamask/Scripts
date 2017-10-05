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
    if "%~x1"==".epub" (
        set ext=epub
    ) else if "%~x1"==".mobi" (
        set ext=mobi
    ) else if "%~x1"==".azw3" (
        set ext=azw3
    ) else (
        set ext=other
    )

    ebook-convert %1 "%~dpn1_%ext%_cover.epub" --cover "%~dpn1.jpg"

    echo %strongRed%
    echo -------------------------------------------------------------------------------
    echo %defaultColor%

    shift
    if not "%~1"=="" goto LOOP

endlocal