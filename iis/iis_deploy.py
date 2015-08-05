# WSGI module for use with Apache mod_wsgi or gunicorn

# # uncomment the following lines for logging
# # create a log.ini with `mapproxy-util create -t log-ini`
# from logging.config import fileConfig
# import os.path
# fileConfig(r'C:\mapproxy/log.ini', {'here': os.path.dirname(__file__)})
import sys

from logging.config import fileConfig
import os.path

# Enable MapProxy's own logging
this_dir = os.path.dirname(__file__)
mapproxy_root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), r'..'))

import site
site.addsitedir(os.path.join(mapproxy_root_dir, r'env', r'Lib', r'site-packages'))

log_config_file = os.path.join(this_dir, 'iis_log.ini')
log_output_dir = os.path.join(this_dir, 'logs')

if (not os.path.isdir(log_output_dir)):
    os.mkdir(log_output_dir)

fileConfig(log_config_file, {'here': log_output_dir})
#fileConfig(os.path.join(here, 'iis_log.ini'))

# Enable tracing. Run 'python -m win32traceutil'
if hasattr(sys, "isapidllhandle"): 
    import win32traceutil

    
# The entry point for the ISAPI extension.
def __ExtensionFactory__():
##    from paste.deploy import loadapp
##     from paste.script.util.logging_config import fileConfig

    #    D:\work\custom-software-group\code\github\mapproxy\config\demo-base-config\mapproxy.yaml
    yaml_file = os.path.abspath(os.path.join(mapproxy_root_dir,
                                             r'config',
                                             r'demo-base-config',
                                             r'mapproxy.yaml'))
    # yaml_file = r'D:\work\custom-software-group\code\github\mapproxy\config\demo-base-config\mapproxy.yaml'
    
    from mapproxy.wsgiapp import make_wsgi_app
    # application = make_wsgi_app(r'C:\mapproxy\mapproxy.yaml')
    application = make_wsgi_app(yaml_file)

    import isapi_wsgi
    return isapi_wsgi.ISAPIThreadPoolHandler(application)

    
# ISAPI installation
if __name__=='__main__':
    from isapi.install import ISAPIParameters, ScriptMapParams, VirtualDirParameters, HandleCommandLine
    
    params = ISAPIParameters()
    sm = [
        ScriptMapParams(Extension="*", Flags=0)
    ]
    
    vd = VirtualDirParameters(Name="mapproxy",
                              Description = "MapProxy",
                              ScriptMaps = sm,
                              ScriptMapUpdate = "replace"
                              )
    
    params.VirtualDirs = [vd]
    HandleCommandLine(params)
