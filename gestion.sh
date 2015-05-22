#!/bin/bash

if [ -z "$TOBA_ID_DESARROLLADOR" ]; then
    TOBA_ID_DESARROLLADOR=0;
fi

if [ -z "$TOBA_PASS" ]; then
    echo "Se utiliza el password default de toba (OjO)";
    TOBA_PASS=toba;
fi

HOME_GESTION=/var/local/gestion

if [ -z "$(ls -A "$HOME_GESTION/lib/toba/instalacion")" ]; then
    echo -n postgres > /tmp/clave_pg;
    echo -n ${TOBA_PASS} > /tmp/clave_toba;
    ${HOME_GESTION}/lib/toba/bin/instalar -d ${TOBA_ID_DESARROLLADOR} -t 0 -h pg -p 5432 -u postgres -b toba_guarani -c /tmp/clave_pg -k /tmp/clave_toba;
    ${HOME_GESTION}/lib/toba/bin/toba proyecto cargar -d ${HOME_GESTION} -p guarani -i desarrollo -a 1;
    printf "\n" | ${HOME_GESTION}/bin/guarani instalar -j;
    echo 'chequea_sincro_svn = 1' >> ${HOME_GESTION}/lib/toba/instalacion/instalacion.ini;
	echo "menu = 2" > ${HOME_GESTION}/menu.ini;
	chown -R www-data ${HOME_GESTION}/lib/toba/instalacion/i__desarrollo;
fi

ln -s ${HOME_GESTION}/lib/toba/instalacion/toba.conf /etc/apache2/sites-enabled/toba_guarani.conf;
ln -s ${HOME_GESTION}/lib/toba/instalacion/toba.conf /etc/apache2/sites-available/toba_guarani.conf;
