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
    ) else if "%~x1"==".fb2" (
        set ext=fb2
    ) else (
        set ext=other
    )

    ebook-convert %1 "%~dpn1_%ext%.pdf" --remove-first-image --preserve-cover-aspect-ratio ^
        --paper-size b5 ^
        --margin-top 38 --margin-bottom 38 --margin-left 52 --margin-right 52 ^
        --pdf-page-numbers ^
        --pdf-serif-family "PT Serif" --pdf-sans-family "PT Sans" --pdf-mono-family "Cousine" ^
        --pdf-default-font-size 14 --pdf-mono-font-size 12 ^
        --minimum-line-height 150 ^
        --filter-css font-family,font-size

    echo %strongCyan%
    echo -------------------------------------------------------------------------------
    echo %defaultColor%

    shift
    if not "%~1"=="" goto LOOP

endlocal