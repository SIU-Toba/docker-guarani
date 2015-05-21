# docker-guaraní
Contenedor Docker para crear entorno de desarrollo de Guaraní 3 con una BD con datos de prueba.

## Requerimientos
 * Se debe tener instalado [Docker](https://docs.docker.com/installation/) y [docker-compose](https://docs.docker.com/compose/install/).
 * Hay que tener working copys de los sistemas en la máquina HOST (Guaraní Gestión y Autogestión). Si pertenecen al SIU hay que bajarlos del repositorio SIU y si son de alguna institución desde su respectivo nodo en [Colab](https://colab.siu.edu.ar/trac/guarani3)

```
# Desde SIU
# Checkout Gestión
svn co https://repositorio.siu.edu.ar/svn/guarani/trunk/guarani_3 <PATH A GESTION>

# Checkout Autogestión
svn co https://repositorio.siu.edu.ar/svn/g3w2/trunk3 <PATH A AUTOGESTION>
```

```
# Desde Colab
# Checkout Gestión
svn co https://colab.siu.edu.ar/svn/guarani3/nodos/<NODO INSTITUCION>/gestion/trunk/<VERSION> <PATH A GESTION>

# Checkout Autogestión
svn co https://colab.siu.edu.ar/svn/guarani3/nodos/<NODO INSTITUCION>/3w/trunk/<VERSION> <PATH A AUTOGESTION>
```

## Inicialización

Para utilizar estos contenedores se debe clonar este proyecto y crear el archivo **docker-compose.yml** partiendo del archivo
template **docker-compose-template.yml**.

```
cp docker-compose-template.yml docker-compose.yml
#Editar parámetros en docker-compose.yml
```

Una vez creado y completado el archivo se debe ejecutar lo siguiente:

```
sudo docker-compose up 
```

También se puede agregar el flag **-d** al comando anterior para que se corra como daemon (no lockea la terminal desde la que se corrió el comando).

### Jasper

Si se desea correr un servidor jasper se debe agregar el link **jasper** al contenedor web y descomentar el bloque que levanta
el contenedor de jasper.
Para más información ver el archivo **docker-compose-template.yml**.

### Inicialización manual

Alternativamente se puede correr manualmente sin la necesidad de docker-compose ejecutando los siguientes comandos:

```
sudo docker run --name pg_data -v /var/lib/postgresql/data postgres:9.4 true
```

```
sudo docker run -i -t --name pg -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres:9.4
```

```
sudo docker run -i -t --name web -e TOBA_ID_DESARROLLADOR=<ID> -p "3000:80" --link pg:pg -v <PATH A GESTION>:/var/local/gestion siutoba/docker-guarani
```

### Accediendo a los sistemas

Una vez que están corriendo los contenedores se podrá acceder a las aplicaciones a través de las url:
 
 * [http://localhost:3000/toba_editor/2.6](http://localhost:3000/toba_editor/2.6)
 * [http://localhost:3000/autogestion](http://localhost:3000/autogestion)

Si se está usando Windows o Mac OS X la url no será localhost sino la ip de Boot2Docker.

## Uso
Para acceder a los contenedores a través de una consola se debe ejecutar el siguiente comando:

```
sudo docker exec -it <NOMBRE CONTENEDOR> /bin/bash
```

El nombre del contenedor se puede obtener utilizando el comando:

```
sudo docker ps
```

## Desarrollo
Si se desea agregar algo a la imagen de Guaraní lo mejor es utilizar los builds de docker-compose. Para hacer esto hay que
reemplazar la línea **image: siutoba/docker-guarani** por **build: .**. Esto hará que docker-compose genere la imagen a partir
del **Dockerfile** en lugar de bajarla. Para que se vayan impactando los cambios hay que ejecutar el siguiente comando para
forzar la regeneración de la imagen:

```
sudo docker-compose build
```
