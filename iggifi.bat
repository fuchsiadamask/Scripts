@echo off

setlocal

set file=.gitignore

git rm -r --cached .gitattributes .gitignore

echo.>>%file%
echo # .gitattributes and .gitignore itself>>%file%
echo .gitattributes>>%file%
echo .gitignore>>%file%

endlocal