Compilation of useful docker commands 🐳 | [docker]

## Build

Basic command for building an image from a Dockerfile

```powershell
docker build -t [tag] -f [dockerfile path] [build root]
```

## Docker swarm node ports

Required ports for a docker swarm node to function properly

* TCP `2376`
* TCP `2377`
* TCP `7946`
* UDP `7946`
* UDP `4789`

## Cleanup disk space

If docker is taking too much space a system prune might be a good idea.

```sh
docker system prune -a
```

This cleans 

* all stopped containers
* all networks not used by at least one container
* all images without at least one container associated to them
* all build cache


## Restrict log size

To restrict the size of the log files created by docker, add the following to the daemon.json file located in `/etc/docker/daemon.json`.

```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
```

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


## Garbage collection in a private docker registry

If your private docker registry is full and contains layers marked for deletion, run this command with the config file present.

```sh
registry garbage-collect config.yml
```

Config yml example

```yml
version: 0.1
log:
  fields:
  service: registry
storage:
    cache:
        blobdescriptor: inmemory
    filesystem:
        rootdirectory: /var/lib/registry
    delete:
        enabled: true
http:
    addr: :5000
    headers:
        X-Content-Type-Options: [nosniff]
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3
```

## Enable localhost communication in docker compose

If your container needs to communicate with its host the following can be added to its compose file. 

```yml
service_name:
  extra_hosts:
    - host.docker.internal:host-gateway
```

The containers in this service can then communicate with its host by calling `host.docker.internal` from within the container.