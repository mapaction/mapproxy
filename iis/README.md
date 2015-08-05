IIS
===
Files in this directory are related to deploying MapProxy to IIS.

Dependencies
------------
* MapProxy as installed using install_mapproxy.cmd
* IIS installed. (Need to check which IIS features are required and also assumed to be pre-installed).

Preparation
-----------
* Use `fetch_mapproxy_and_dep_installers.cmd` to get required install files for deployment to IIS as well as MapProxy itself.
* Install MapProxy using `install_mapproxy.cmd`
* Run `iis\install_prerequisite_iis_components.cmd`. This will enable the various IIS6 compatibility features required by [ISAPI_WSGI](https://github.com/hexdump42/isapi-wsgi). Roughly the [equivalent of this]( https://technet.microsoft.com/en-us/library/bb397374%28v=exchg.80%29.aspx)

Deploying to IIS
----------------
* Run `install_iis_adapter.cmd`. This will deploy MapProxy to a virtual directory like this; http://myserver/mapproxy
