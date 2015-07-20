rem call "C:\OSGeo4w64\bin\o4w_env.bat"

REM rem (Portable Python Setup)
REM set pydir=D:\work\custom-software-group\code\github\mapproxy\ppython\App
REM copy c:\Python27\get-pip.py %~dp0
REM %pydir%\python.exe get-pip.py

rem set pydir=C:\mapproxy\Python27

set pydir=%~dp0\env
rem %~dp0\env\Scripts\activate.bat

REM rem 32bit
REM     "%pydir%\Scripts\pip.exe" install wheels\ipython-3.2.1-py27-none-any.whl
    "%pydir%\Scripts\pip.exe" install "%~dp0\wheels\Pillow-2.9.0-cp27-none-win32.whl"
    "%pydir%\Scripts\pip.exe" install "%~dp0\wheels\pyproj-1.9.4-cp27-none-win32.whl"
    "%pydir%\Scripts\pip.exe" install "%~dp0\wheels\lxml-3.4.4-cp27-none-win32.whl"
    "%pydir%\Scripts\pip.exe" install "%~dp0\wheels\PyYAML-3.11-cp27-none-win32.whl"
    "%pydir%\Scripts\pip.exe" install "%~dp0\wheels\Shapely-1.5.9-cp27-none-win32.whl"
rem     "%pydir%\Scripts\pip.exe" install -r requirements-mapproxy.txt MapProxy


rem (installed Python, VirtualEnv setup)
rem IF NOT EXIST env (
    REM "%pydir%\Scripts\easy_install.exe" virtualenv
    REM "%pydir%\Scripts\virtualenv.exe" --system-site-packages env
    REM move env\Scripts\activate.bat env\Scripts\activate.bat.old
    REM type bat_header.txt > env\Scripts\activate.bat
    REM type env\Scripts\activate.bat.old >> env\Scripts\activate.bat
    REM env\Scripts\activate.bat
	
rem http://www.lfd.uci.edu/~gohlke/pythonlibs/3i673h27/PyYAML-3.11-cp27-none-win_amd64.whl
rem http://www.lfd.uci.edu/~gohlke/pythonlibs/3i673h27/PyYAML-3.11-cp27-none-win32.whl


rem "Wheel" install files are available from 
rem http://www.lfd.uci.edu/~gohlke/pythonlibs/#pil

rem 64bit
rem     "%pydir%\Scripts\pip.exe" install wheels\ipython-3.2.1-py27-none-any.whl
rem     "%pydir%\Scripts\pip.exe" install %~dp0\wheels\Pillow-2.9.0-cp27-none-win_amd64.whl
rem     "%pydir%\Scripts\pip.exe" install %~dp0\wheels\pyproj-1.9.4-cp27-none-win_amd64.whl
rem     "%pydir%\Scripts\pip.exe" install %~dp0\wheels\lxml-3.4.4-cp27-none-win_amd64.whl
rem     "%pydir%\Scripts\pip.exe" install %~dp0\wheels\PyYAML-3.11-cp27-none-win_amd64.whl
rem     "%pydir%\Scripts\pip.exe" install %~dp0\wheels\Shapely-1.5.9-cp27-none-win_amd64.whl
rem    "%pydir%\Scripts\easy_install.exe" MapProxy
    "%pydir%\Scripts\easy_install.exe" -H None -f %~dp0\eggs MapProxy


rem    "%pydir%\Scripts\pip.exe" install -r requirements-mapproxy.txt MapProxy
 
  rem pip install pyreadline MapProxy ipython lxml pillow pyproj Shapely
rem ) ELSE (
rem  env\Scripts\activate
rem )


rem pushd  mapactionproxy
rem mapproxy-util serve-develop osm.yaml
rem popd


