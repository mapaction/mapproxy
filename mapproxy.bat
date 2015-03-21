call "C:\OSGeo4w64\bin\o4w_env.bat"
IF NOT EXIST env (
  easy_install virtualenv
  virtualenv --system-site-packages env
  env\Scripts\activate
  pip install pyreadline MapProxy ipython lxml
  mapproxy-util create -t base-config mapactionproxy
  cd mapactionproxy
  mapproxy-util serve-develop osm.yaml
) ELSE (
  env\Scripts\activate
  cd mapactionproxy
  mapproxy-util serve-develop osm.yaml
)
