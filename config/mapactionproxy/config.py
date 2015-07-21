# WSGI module for use with Apache mod_wsgi or gunicorn
from logging.config import fileConfig
import os.path
here = os.path.dirname(__file__)
fileConfig(os.path.join(here, 'log.ini', {'here': here})

from mapproxy.wsgiapp import make_wsgi_app
application = make_wsgi_app(os.path.join(here, 'osm.yaml'))
