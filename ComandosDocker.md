
`docker --version`permite ver la version de docker. 

``docker images``permite ver imagesnes.

``docker run`` permite crear un contenedor.

ejemplo de creacion de contenedor basico:

---

```docker 
docker run --name mysqlv1 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:latest
```

`docker container ps` permite visualizar los contenedores que estan en ejecucion.

`docker ps -a` permite visualizar todos los contenedores en ejecucion o no.

`docker stop id o nombre del contenedor ` detiene el contenedor.

`docker start id o nombre del contenedor` inicia un contenedor.

`docker rm id o nombre del contenedor ` eliminar un contenedor - pero se debe detener primero el contenedor.

`docker rm -f id o el nombre del cotenedor` forza la eliminacion del contenedor sin reiniciarlo.

