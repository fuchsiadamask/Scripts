@echo off

setlocal

:: there is invisible ESC character (ASCII code 27) after '=':
set esc=

set strongCyan=%esc%[1;36m
set defaultColor=%esc%[0m

echo %strongCyan%
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

    ebook-convert %1 "%~dpn1_%ext%.pdf" --remove-first-image --preserve-cover-aspect-ratio ^
        --pdf-page-numbers ^
        --margin-top 38 --margin-bottom 38 --margin-left 52 --margin-right 52 ^
        --paper-size b5 ^
        --pdf-sans-family "Source Sans Pro" --pdf-serif-family "Crimson Text" --pdf-mono-family "Cousine" ^
        --pdf-default-font-size 16 --pdf-mono-font-size 12 ^
        --filter-css font-family,font-size

    echo %strongCyan%
    echo -------------------------------------------------------------------------------
    echo %defaultColor%

    shift
    if not "%~1"=="" goto LOOP

endlocal