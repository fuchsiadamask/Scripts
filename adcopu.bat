@echo off

setlocal

git add --all

set /p "descr=Commit description: "

git commit -m "%descr%"
git push origin

endlocal