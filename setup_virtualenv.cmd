
set pydir=C:\Python27
set virdir=%~dp0\env

IF NOT EXIST "%virdir%\Scripts\python.exe" (
    "%pydir%\Scripts\easy_install.exe" -H None -f %~dp0\installers\eggs virtualenv
    "%pydir%\Scripts\virtualenv.exe" --system-site-packages "%virdir%"
    move "%virdir%\Scripts\activate.bat" "%virdir%\Scripts\activate.bat.old"
    type "%~dp0\bat_header.txt" > "%virdir%\Scripts\activate.bat"
    type "%virdir%\Scripts\activate.bat.old" >> "%virdir%\Scripts\activate.bat"
)
