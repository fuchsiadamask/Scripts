@echo off

setlocal

set foo=%~n0

xelatex -synctex=1 -interaction=nonstopmode -shell-escape "%foo%.tex"

endlocal