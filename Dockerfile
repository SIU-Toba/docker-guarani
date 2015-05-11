FROM siutoba/docker-web

COPY guarani.sh /entrypoint.d/
RUN chmod +x /entrypoint.d/guarani.sh

