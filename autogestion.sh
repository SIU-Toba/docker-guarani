#!/bin/bash

HOME_3W=/var/local/autogestion

cp /var/local/autogestion_conf/* ${HOME_3W}/instalacion
cp ${HOME_3W}/instalacion/login_template.php ${HOME_3W}/instalacion/login.php
chown -R www-data ${HOME_3W}/instalacion/log;


ln -s ${HOME_3W}/instalacion/alias.conf /etc/apache2/sites-enabled/autogestion.conf
