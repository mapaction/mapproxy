::
:: This installs MapProxy and all its dependencies in the virtualenv "env"
::
:: If there is not a C complier available to easy_install it is not able to 
:: probably install Shapely. Therefore Shapely and some other dependencies need
:: to be installed using pip, from wheel files that have been previously
:: downloaded.
::
:: MapProxy itself does not seem to install properly using pip and must be 
:: installed using easy_install.
::
call %~dp0\setup_virtualenv.cmd
::set pydir=%~dp0\env\Scripts

"%virdir%\Scripts\pip.exe" install "%~dp0\installers\wheels\Pillow-2.9.0-cp27-none-win32.whl"
"%virdir%\Scripts\pip.exe" install "%~dp0\installers\wheels\pyproj-1.9.4-cp27-none-win32.whl"
"%virdir%\Scripts\pip.exe" install "%~dp0\installers\wheels\lxml-3.4.4-cp27-none-win32.whl"
"%virdir%\Scripts\pip.exe" install "%~dp0\installers\wheels\PyYAML-3.11-cp27-none-win32.whl"
"%virdir%\Scripts\pip.exe" install "%~dp0\installers\wheels\Shapely-1.5.9-cp27-none-win32.whl"

"%virdir%\Scripts\easy_install.exe" -H None -f %~dp0\installers\eggs MapProxy
