@echo off

:LOOP
    cd /d "%~dp1"

    inkscape --file="%~nx1" --export-pdf="%~n1.pdf" --export-latex

    shift
    if not "%~1"=="" goto LOOP