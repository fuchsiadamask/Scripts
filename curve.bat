@echo off

:LOOP
    ps2pdf -dNoOutputFonts %1 "%~dpn1_curved.pdf"

    shift
    if not "%~1"=="" goto LOOP