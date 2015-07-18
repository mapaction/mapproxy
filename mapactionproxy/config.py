# WSGI module for use with Apache mod_wsgi or gunicorn
from logging.config import fileConfig
import os.path
import isapi_wsgi


here = os.path.dirname(__file__)
fileConfig(os.path.join(here, 'log.ini', {'here': here})

from mapproxy.wsgiapp import make_wsgi_app
application = make_wsgi_app(os.path.join(here, 'osm.yaml'))

# The entry points for the ISAPI extension.
def __ExtensionFactory__():
    return isapi_wsgi.ISAPISimpleHandler(application)

if __name__=='__main__':
    # If run from the command-line, install ourselves.
    from isapi.install import *
    params = ISAPIParameters()
    # Setup the virtual directories - this is a list of directories our
    # extension uses - in this case only 1.
    # Each extension has a "script map" - this is the mapping of ISAPI
    # extensions.
    sm = [
        ScriptMapParams(Extension="*", Flags=0)
    ]
    vd = VirtualDirParameters(Name="mysite",
                              Description = "ISAPI-WSGI ISAPISimpleHandler mapproxy mysite",
                              ScriptMaps = sm,
                              ScriptMapUpdate = "replace"
                              )
    params.VirtualDirs = [vd]
    HandleCommandLine(params)