geoseo
======

geoseo

Checkout the repository to your Harddrive and create symbolic link files from your local geoadmin instance to the repository.
```  
  ln -s $(pwd)/templates/*.mako /var/www/vhosts/geoportail-luxembourg/private/geoadmin/geoadmin/geoadmin/geoadmin/templates/
  ln -s $(pwd)/controllers/*.py /var/www/vhosts/geoportail-luxembourg/private/geoadmin/geoadmin/geoadmin/geoadmin/controllers/
  rm /var/www/vhosts/geoportail-luxembourg/private/geoadmin/geoadmin/geoadmin/geoadmin/config/routing.py 
  ln -s $(pwd)/config/*.py /var/www/vhosts/geoportail-luxembourg/private/geoadmin/geoadmin/geoadmin/geoadmin/config/
  sudo /etc/init.d/httpd restart && tail -f /var/www/vhosts/geoportail-luxembourg/logs/err*.log
```
