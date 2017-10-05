@echo off

setlocal

set "path=C:\MediaInfo;C:\Program Files\ImageMagick-7.0.6-Q16;C:\mozjpeg"

set _mindim=1424

:LOOP
    for /f "tokens=1,2" %%a in ('mediainfo --Inform^="Image;%%Width%% %%Height%%" %1') do (
            set _width=%%a
            set _height=%%b
        )

    :: resize first to reduce memory usage:
    if %_width% GTR %_height% (
        :: fixed height, proportional width:
        magick %1 -resize x%_mindim% "%~dpn1_res%~x1"
    ) else (
        :: fixed width, proportional height:
        magick %1 -resize %_mindim%x "%~dpn1_res%~x1"
    )

    :: convert if needed:
    if "%~x1"==".png" (
        magick "%~dpn1_res.png" "%~dpn1_res.jpg"
    )

    :: rename if needed:
    if "%~x1"==".jpeg" (
        ren "%~dpn1_res.jpeg" "%~n1_res.jpg"
    )

    :: optimize:
    cjpeg -optimize -outfile "%~dpn1_res_opt.jpg" "%~dpn1_res.jpg"

    shift
    if not "%~1"=="" goto LOOP

endlocal