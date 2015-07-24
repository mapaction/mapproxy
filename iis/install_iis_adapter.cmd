:: Install pyWin32 extensions. This should be installed into the core python
:: install, not the virtualenv
C:\Python27\Scripts\pip.exe install "%~dp0\..\installers\wheels\pywin32-219-cp27-none-win32.whl"
C:\Python27\python.exe C:\Python27\Scripts\pywin32_postinstall.py -install

:: Install ISAPI_WSGI, into the virtualenv
"%~dp0\..\env\Scripts\pip.exe" install "%~dp0\..\installers\wheels\isapi_wsgi-0.4.2-py2-none-any.whl"

:: Need to configure IIS DefaultAppPool to allow 32bit apps to run
rem ref need:
rem https://code.google.com/p/isapi-wsgi/issues/detail?id=10
rem ref possible solution
rem http://forums.iis.net/t/1189907.aspx?Enable+32+bit+applications+in+IIS
rem try this
rem .Opening command prompt and navigating to the directory %systemdrive%\Inetpub\AdminScripts
rem 2.Type: cscript.exe adsutil.vbs set W3SVC/AppPools/Enable32BitAppOnWin64 true
%windir%\System32\cscript.exe c:\inetpub\AdminScripts\adsutil.vbs set W3SVC/AppPools/DefaultAppPool/Enable32BitAppOnWin64 true

:: Set the max number of worker processes in the DefaultAppPool
rem %windir%\System32\cscript.exe c:\inetpub\AdminScripts\adsutil.vbs set cscript adsutil.vbs set w3svc/apppools/defaultapppool/maxprocesses 4

:: Is this too liberal? would permissions on just the `iis` dir be sufficent?
icacls "%~dp0\.." /grant "NT AUTHORITY\IUSR:(OI)(CI)(RX)"
icacls "%~dp0\.." /grant "Builtin\IIS_IUSRS:(OI)(CI)(RX)"

:: Make MapProxy log files dir and make it writable to IIS
mkdir "%~dp0\logs"
icacls "%~dp0\logs" /grant "NT AUTHORITY\IUSR:(OI)(CI)(W)"
icacls "%~dp0\logs" /grant "Builtin\IIS_IUSRS:(OI)(CI)(W)"

:: Create the IIS virtualdir
%windir%\system32\inetsrv\appcmd.exe stop site /site.name:"Default Web Site"
"%~dp0\..\env\Scripts\python.exe" "%~dp0\..\iis\iis_deploy.py" install
%windir%\system32\inetsrv\appcmd.exe start site /site.name:"Default Web Site"
