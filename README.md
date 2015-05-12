# docker-guaraní
Contenedor Docker para crear entorno de desarrollo de Guaraní.

## Requerimientos
Se debe tener instalado [Docker](https://docs.docker.com/installation/) y [docker-compose](https://docs.docker.com/compose/install/).

## Uso
Para utilizar estos contenedores se debe clonar este proyecto y crear el archivo *docker-compose.yml* partiendo del archivo
template *docker-compose-template*.
```
cp docker-compose-template.yml docker-compose.yml
#Editar parametros en docker-compose.yml
```
Una vez creado y completado el archivo se debe ejecutar lo siguiente:

```
sudo docker-compose up -d
```

Alternativamente se puede correr manualmente sin la necesidad de docker-compose:

```
sudo docker run --name pg_data -v /var/lib/postgresql/data postgres:9.4 true
```

```
sudo docker run -i -t --name pg -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres:9.4
```

```
sudo docker run -i -t --name web -e TOBA_ID_DESARROLLADOR=<ID> -p "3000:80" --link pg:pg -v <PATH A GESTION>:/var/local/gestion siutoba/docker-guarani
```

Una vez que están corriendo los contenedores se podrá acceder a la aplicación a través de la url: [http://localhost:3000/toba_editor/2.6](http://localhost:3000/toba_editor/2.6)
Si se está usando Windows o Mac OS X la url no será localhost sino la ip de Boot2Docker.

## Desarrollo
Si se desea agregar algo a la imagen de Guaraní lo mejor es utilizar los builds de docker-compose. Para hacer esto hay que
reemplazar la línea *image: siutoba/docker-guarani* por *build: .*. Esto hará que docker-compose genere la imagen a partir
del *Dockerfile* en lugar de bajarla. Para que se vayan impactando los cambios hay que ejecutar el siguiente comando para
forzar la regeneración de la imagen:

```
sudo docker-compose build
```
