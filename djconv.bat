@echo off

setlocal

:: there is invisible ESC character (ASCII code 27) after '=':
set esc=

set strongRed=%esc%[1;31m
set strongGreen=%esc%[1;32m
set strongMagenta=%esc%[1;35m
set defaultColor=%esc%[0m

echo %strongMagenta%
echo -------------------------------------------------------------------------------%defaultColor%

:LOOP
    echo(

    ddjvu -format=pdf -mode=black %1 "%~dpn1_djvu.pdf"

    if %ERRORLEVEL% equ 0 (
        echo %strongGreen%"%~dpn1_djvu.pdf" is created.%defaultColor%
    ) else (
        echo %strongRed%"%~dpn1_djvu.pdf" cannot be created.%defaultColor%
    )

    echo(

    cpdf -scale-to-fit usletterportrait "%~dpn1_djvu.pdf" -o "%~dpn1_djvu.pdf"

    if %ERRORLEVEL% equ 0 (
        echo %strongGreen%"%~dpn1_djvu.pdf" is resized.%defaultColor%
    ) else (
        echo %strongRed%"%~dpn1_djvu.pdf" cannot be resized.%defaultColor%
    )

    echo %strongMagenta%
    echo -------------------------------------------------------------------------------%defaultColor%

    shift
    if not "%~1"=="" goto LOOP

endlocal