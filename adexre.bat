@echo off

setlocal

git init

set /p "addr=Remote address: "

git remote add origin %addr%

git add --all
git commit -m "added to remote"
git push -u origin master

endlocal