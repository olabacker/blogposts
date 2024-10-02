Compilation of useful docker commands 🐳 | [docker]

## Build

Basic command for building an image from a Dockerfile

```powershell
docker build -t [tag] -f [dockerfile path] [build root]
```





## Restrict log size



## Enter a container

Command for entering a shell inside the container

```sh
docker exec -it [CONTAINER] sh
```



## Specify port on target host

To make a port only available on the host(s) a service is running on, it should specify the mode to `host`. 

```yml
- target: 443
  published: 443
  protocol: tcp
  mode: host
```




#