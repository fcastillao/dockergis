```
docker build /t={IMAGE_NAME} ./ 	
```
use ``./`` if in root of the dockerfile, use the path to the dockerfile otherwise


```
docker run --name={CONTAINER_NAME} -e POSTGRES_PASSWORD={SOME_PASSWORD} {IMAGE_NAME} -D 
```
its recomended to set the password, but its not necessary
dont skip the -D



```
docker run -it --link {CONTAINER_NAME}:postgres --rm postgres     sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
```
if a password is set up it will be asked
