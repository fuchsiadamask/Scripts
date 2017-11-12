@echo off

cd /d "%~dp1"

lualatex --synctex=1 --interaction=nonstopmode --shell-escape "%~nx1"