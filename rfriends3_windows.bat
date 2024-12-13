@echo off
rem -----------------------------------------
rem rfriends3 簡易インストーラー
rem
rem 2023/06/19 by mapi
rem 2023/09/15 by mapi
rem 2024/07/05 by mapi
rem 2024/12/13 by mapi github
rem -----------------------------------------
echo rfriends3インストーラー for windows Ver. 1.20
echo.
echo rfriends3をダウンロードし解凍します。
echo ウェブサーバを起動中の場合は、必ず終了させてください。
echo.

set /p ans="処理を開始しますか　(y/n) ?"
if /i "%ans%"=="y" goto ex1
echo 処理を中止します。
goto stp
:ex1
rem set dir=http://rfbuddy.s296.xrea.com/temp/
rem set dir=http://rfriends.s1009.xrea.com/files3/
rem set dir=http://ceres.s501.xrea.com/files3/
set dir=https://github.com/rfriends/rfriends3/releases/latest/download
set file=rfriends3_latest_full_x64.zip

curl %dir%%file% --output %file%
unzip %file%"
xcopy /Y /E rfriends3 ..\rfriends3
rd /s /q rfriends3
del %file% /Q

cd ..\rfriends3
cscript rf3server.vbs
copy /Y rf3server.lnk "%USERPROFILE%\DESKTOP\"

rem echo [InternetShortcut]> rfriends3.url
rem echo URL="http://localhost:8000">> rfriends3.url
rem copy /Y rfriends3.url "%USERPROFILE%\DESKTOP\"

:stp
pause
