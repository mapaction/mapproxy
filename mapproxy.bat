rem call "C:\OSGeo4w64\bin\o4w_env.bat"
set pydir=D:\work\custom-software-group\code\github\mapproxy\ppython\App

%pydir%\python.exe get-pip.py

rem IF NOT EXIST env (
rem   "%pydir%\Scripts\easy_install.exe" virtualenv
rem   "%pydir%\Scripts\virtualenv.exe" --system-site-packages env
rem   move env\Scripts\activate.bat env\Scripts\activate.bat.old
rem   type bat_header.txt > env\Scripts\activate.bat
rem   type env\Scripts\activate.bat.old >> env\Scripts\activate.bat
rem  env\Scripts\activate

rem "Wheel" install files are available from 
rem http://www.lfd.uci.edu/~gohlke/pythonlibs/#pil

rem 64bit
rem   "%pydir%\Scripts\pip.exe" install ipython-3.2.1-py27-none-any.whl
rem   "%pydir%\Scripts\pip.exe" install Pillow-2.9.0-cp27-none-win_amd64.whl
rem   "%pydir%\Scripts\pip.exe" install pyproj-1.9.4-cp27-none-win_amd64.whl
rem   "%pydir%\Scripts\pip.exe" install lxml-3.4.4-cp27-none-win_amd64.whl
rem   "%pydir%\Scripts\pip.exe" install Shapely-1.5.9-cp27-none-win_amd64.whl
rem   "%pydir%\Scripts\pip.exe" install -r requirements-mapproxy.txt MapProxy

rem 32bit
  "%pydir%\Scripts\pip.exe" install ipython-3.2.1-py27-none-any.whl
  "%pydir%\Scripts\pip.exe" install Pillow-2.9.0-cp27-none-win_amd64.whl
  "%pydir%\Scripts\pip.exe" install pyproj-1.9.4-cp27-none-win32.whl
  "%pydir%\Scripts\pip.exe" install lxml-3.4.4-cp27-none-win_amd64.whl
  "%pydir%\Scripts\pip.exe" install Shapely-1.5.9-cp27-none-win32.whl
  "%pydir%\Scripts\pip.exe" install -r requirements-mapproxy.txt MapProxy
 
  
  rem pip install pyreadline MapProxy ipython lxml pillow pyproj Shapely
rem ) ELSE (
rem  env\Scripts\activate
rem )


rem pushd  mapactionproxy
rem mapproxy-util serve-develop osm.yaml
rem popd


