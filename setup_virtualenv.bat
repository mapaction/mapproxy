
set pydir=C:\Python27

IF NOT EXIST env (
    "%pydir%\Scripts\easy_install.exe" virtualenv
    "%pydir%\Scripts\virtualenv.exe" --system-site-packages env
    move env\Scripts\activate.bat env\Scripts\activate.bat.old
    type bat_header.txt > env\Scripts\activate.bat
    type env\Scripts\activate.bat.old >> env\Scripts\activate.bat
)
	
set pydir=D:\work\custom-software-group\code\github\mapproxy\env
env\Scripts\activate.bat
