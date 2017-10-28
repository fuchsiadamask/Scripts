@echo off

cd /d "%~dp1"

xelatex -synctex=1 -interaction=nonstopmode -shell-escape "%~nx1"