call "C:\OSGeo4w64\bin\o4w_env.bat"
IF NOT EXIST env (
  easy_install virtualenv
  virtualenv --system-site-packages env
  mv env\Scripts\activate.bat env\Scripts\activate.bat.old
  type bat_header.txt > env\Scripts\activate.bat
  type env\Scripts\activate.bat.old >> env\Scripts\activate.bat
  env\Scripts\activate
  pip install pyreadline MapProxy ipython lxml pillow
  cd mapactionproxy
  mapproxy-util serve-develop osm.yaml
) ELSE (
  env\Scripts\activate
  cd mapactionproxy
  mapproxy-util serve-develop osm.yaml
)
