@echo off

setlocal

set "path=C:\Program Files\ImageMagick-7.0.6-Q16"

:LOOP
    magick %1 -background white -flatten "%~dpn1.jpg"

    shift
    if not "%~1"=="" goto LOOP

endlocal