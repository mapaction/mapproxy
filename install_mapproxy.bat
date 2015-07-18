rem call "C:\OSGeo4w64\bin\o4w_env.bat"

REM rem (Portable Python Setup)
REM set pydir=D:\work\custom-software-group\code\github\mapproxy\ppython\App
REM copy c:\Python27\get-pip.py %~dp0
REM %pydir%\python.exe get-pip.py

REM rem 32bit
  REM "%pydir%\Scripts\pip.exe" install ipython-3.2.1-py27-none-any.whl
  REM "%pydir%\Scripts\pip.exe" install Pillow-2.9.0-cp27-none-win32.whl
  REM "%pydir%\Scripts\pip.exe" install pyproj-1.9.4-cp27-none-win32.whl
  REM "%pydir%\Scripts\pip.exe" install lxml-3.4.4-cp27-none-win32.whl
  REM "%pydir%\Scripts\pip.exe" install Shapely-1.5.9-cp27-none-win32.whl
  REM "%pydir%\Scripts\pip.exe" install -r requirements-mapproxy.txt MapProxy


rem (installed Python, VirtualEnv setup)
rem IF NOT EXIST env (
    REM "%pydir%\Scripts\easy_install.exe" virtualenv
    REM "%pydir%\Scripts\virtualenv.exe" --system-site-packages env
    REM move env\Scripts\activate.bat env\Scripts\activate.bat.old
    REM type bat_header.txt > env\Scripts\activate.bat
    REM type env\Scripts\activate.bat.old >> env\Scripts\activate.bat
    REM env\Scripts\activate.bat
	
    set pydir=D:\work\custom-software-group\code\github\mapproxy\env

rem "Wheel" install files are available from 
rem http://www.lfd.uci.edu/~gohlke/pythonlibs/#pil

rem 64bit
    "%pydir%\Scripts\pip.exe" install ipython-3.2.1-py27-none-any.whl
    "%pydir%\Scripts\pip.exe" install Pillow-2.9.0-cp27-none-win_amd64.whl
    "%pydir%\Scripts\pip.exe" install pyproj-1.9.4-cp27-none-win_amd64.whl
    "%pydir%\Scripts\pip.exe" install lxml-3.4.4-cp27-none-win_amd64.whl
    "%pydir%\Scripts\pip.exe" install Shapely-1.5.9-cp27-none-win_amd64.whl
    "%pydir%\Scripts\pip.exe" install -r requirements-mapproxy.txt MapProxy
 
  rem pip install pyreadline MapProxy ipython lxml pillow pyproj Shapely
rem ) ELSE (
rem  env\Scripts\activate
rem )


rem pushd  mapactionproxy
rem mapproxy-util serve-develop osm.yaml
rem popd


