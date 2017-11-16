@echo off

setlocal

:: there is invisible ESC character (ASCII code 27) after '=':
set esc=

set strongCyan=%esc%[1;36m
set strongMagenta=%esc%[1;35m
set defaultColor=%esc%[0m

echo %strongCyan%
echo -------------------------------------------------------------------------------
echo %strongMagenta%

:LOOP
    :BEGIN
        cd /d "%~dp1"

        set /p "choise=Use parent/grandparent/grandgrandparent directory as a name? [p/g/gg]? "

        echo %defaultColor%

        if %choise%==p goto PARENT
        if %choise%==g goto GPARENT
        if %choise%==gg goto GGPARENT

        goto BEGIN

    :PARENT
        for %%a in ("%~dp1.") do set "name=%%~nxa"

        cd ..

        goto CONTINUE

    :GPARENT
        for %%a in ("%~dp1..") do set "name=%%~nxa"

        cd ..\..

        goto CONTINUE

    :GGPARENT
        for %%a in ("%~dp1..\..") do set "name=%%~nxa"

        cd ..\..\..

    :CONTINUE
        ebook-convert %1 "%name%_html.epub"

        call ebconv "%name%_html.epub"

        echo %strongCyan%
        echo -------------------------------------------------------------------------------
        echo %defaultColor%

    shift
    if not "%~1"=="" goto LOOP

endlocal