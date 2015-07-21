
set curl="C:\Program Files (x86)\Git\bin\curl.exe"

:: Make the various dirs for stuff to be downloaded to:
mkdir %~dp0\installers\wheels
mkdir %~dp0\installers\eggs


:: Get the Wheel files.
:: These can be downloaded from:
:: http://www.lfd.uci.edu/~gohlke/pythonlibs/3i673h27/Pillow-2.9.0-cp27-none-win32.whl
:: etc
pushd %~dp0\installers\wheels

set url=http://www.lfd.uci.edu/~gohlke/pythonlibs/3i673h27/{
set url=%url%Pillow-2.9.0-cp27-none-win32,
set url=%url%pyproj-1.9.4-cp27-none-win32,
set url=%url%lxml-3.4.4-cp27-none-win32,
set url=%url%PyYAML-3.11-cp27-none-win32,
set url=%url%Shapely-1.5.9-cp27-none-win32,
set url=%url%}.whl


popd

:: Get the Egg files.
:: These can be downloaded using easy_install:
call setup_virtualenv.cmd
%~dp0\env\Scripts\easy_install.exe -zmaxd %~dp0\installers\eggs MapProxy

