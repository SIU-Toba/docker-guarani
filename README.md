# docker-guaraní
Contenedor Docker para crear entorno de desarrollo de Guaraní 3 con una BD con datos de prueba. 

## Docs
La documentación se acumulará en la [wiki](https://github.com/SIU-Toba/docker-guarani/wiki)

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

### Accediendo a los sistemas

Una vez que están corriendo los contenedores se podrá acceder a las aplicaciones a través de las url:
 
 * [http://localhost:3000/toba_editor/2.6](http://localhost:3000/toba_editor/2.6)
 * [http://localhost:3000/autogestion](http://localhost:3000/autogestion)

Si se está usando Windows o Mac OS X la url no será localhost sino la ip de Boot2Docker.

### Recreando el ambiente

Para recrear el ambiente hay que borrar la carpeta **<PATH A GESTION>/docker-data** y luego ejecutar:
 
 ```
 sudo docker-compose up 
 ```