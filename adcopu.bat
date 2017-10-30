@echo off

setlocal

:BEGIN
    set /p "choise=Add all/tracked [A/U]? "

    if %choise%==A goto ALL
    if %choise%==a goto ALL
    if %choise%==U goto UPDATE
    if %choise%==u goto UPDATE

    goto BEGIN

:ALL
    git add -A
    goto CONTINUE

:UPDATE
    git add -u

:CONTINUE
    set /p "descr=Commit description: "

    git commit -m "%descr%"
    git push origin

endlocal