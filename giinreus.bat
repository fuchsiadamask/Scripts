@echo off

setlocal

git init

set /p "name=User name: "
set /p "email=User email: "

git config user.name %name%
git config user.email %email%

set /p "addr=Remote address: "

git remote add origin %addr%
git add --all
git commit -m "initial commit"
git push -u origin master

endlocal