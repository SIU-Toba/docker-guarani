FROM siutoba/docker-web
MAINTAINER ablanco@siu.edu.ar

COPY gestion.sh /entrypoint.d/
COPY autogestion.sh /entrypoint.d/
RUN mkdir /var/local/autogestion_conf/
COPY var/autogestion/* /var/local/autogestion_conf/

RUN chmod +x /entrypoint.d/*.sh

