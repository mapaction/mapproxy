# MapProxy setup

* Get https://github.com/mapaction/mapproxy/archive/master.zip
* Unzip it
* run mapproxy.bat


http://stackoverflow.com/questions/6823316/python-on-iis-how


```
C:\Python27>DISM /Online /norestart /quiet /Enable-Feature /FeatureName:IIS-CGI

cd <dir\where\my\python\scripts\are\stored>
icacls . /grant "NT AUTHORITY\IUSR:(OI)(CI)(RX)"
icacls . /grant "Builtin\IIS_IUSRS:(OI)(CI)(RX)"

C:\Python27\Scripts\easy_install.exe isapi_wsgi
python isapi_wsgi.py install

python get-pip.py

Maybe need to run this is pip is not already installed
python get-pip.py

.\scripts\pip install pypiwin32

python.exe C:\Python27\Lib\site-packages\isapi_wsgi-0.4.2-py2.7.egg\isapi_wsgi.py install

.\Scripts\easy_install.exe pyproj
.\Scripts\easy_install Shapely
pip install Pillow
.\Scripts\easy_install MapProxy
