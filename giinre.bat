@echo off

setlocal

git init

set /p "addr=Remote address: "

git remote add origin %addr%
git add --all
git commit -m "initial commit"
git push -u origin master

endlocal