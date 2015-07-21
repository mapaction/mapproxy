
set pydir=C:\Python27

IF NOT EXIST "%~dp0\env" (
    "%pydir%\Scripts\easy_install.exe" virtualenv
    "%pydir%\Scripts\virtualenv.exe" --system-site-packages "%~dp0\env"
    move "%~dp0\env\Scripts\activate.bat" "%~dp0\env\Scripts\activate.bat.old"
    type "%~dp0\bat_header.txt" > "%~dp0env\Scripts\activate.bat"
    type "%~dp0\env\Scripts\activate.bat.old" >> "%~dp0\env\Scripts\activate.bat"
)
