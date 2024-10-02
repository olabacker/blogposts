Command to cleanup docker images and containers | [docker] 

If docker is taking too much space a system prune might be a good idea.

```sh
docker system prune -a
```

This cleans 

* all stopped containers
* all networks not used by at least one container
* all images without at least one container associated to them
* all build cache