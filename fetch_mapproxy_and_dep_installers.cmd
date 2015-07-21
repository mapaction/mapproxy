
set curl="C:\Program Files (x86)\Git\bin\curl.exe"

:: Make the various dirs for stuff to be downloaded to:
mkdir %~dp0\installers\wheels
mkdir %~dp0\installers\eggs
mkdir %~dp0\installers\exe


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
set url=%url%isapi_wsgi-0.4.2-py2-none-any,
set url=%url%pywin32-219-cp27-none-win32
set url=%url%}.whl

%curl% --user-agent "Mozilla/4.0" --silent --show-error "%url%" --output "#1.whl"

popd


:: Get the Egg files.
:: These can be downloaded using easy_install:
call setup_virtualenv.cmd
%~dp0\env\Scripts\easy_install.exe -zmaxd %~dp0\installers\eggs MapProxy


:: Get the EXE files.
pushd %~dp0\installers\exe

:: According to various posts on the web (eg http://unix.stackexchange.com/
:: questions/31821/how-do-i-use-curl-to-download-content-from-sourceforge) it
:: ought to be possible to download from sourceforge using curl with a nice 
:: tidy-looking URL like this one:
:: set url="http://downloads.sourceforge.net/projects/pywin32/files/pywin32/Build%20219/pywin32-219.win32-py2.7.exe/download"
::
:: However this doesn't seem to work for me, but this horrific looking URL does:
:: Also note that the & character have been escaped using ^& (ref http://ss64.com/nt/syntax-esc.html)
::set url=http://downloads.sourceforge.net/project/pywin32/pywin32/Build^%20219/pywin32-219.win32-py2.7.exe^?^r=http^%3A^%2F^%2Fsourceforge.net^%2Fprojects^%2Fpywin32^%2Ffiles^%2Fpywin32^%2FBuild^%2520219^%2F^&ts^=1437492709^&use_mirror^=netcologne

set url=http://sourceforge.net/projects/pywin32/files/pywin32/Build%20219/pywin32-219.win32-py2.7.exe/download

echo "%url%"

%curl% --location --output pywin32-219.win32-py2.7.exe --silent --show-error "%url%"

popd
