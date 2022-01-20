Compilation of useful docker commands 🐳

🐳

## Docker cleanup

```
docker system prune -a
```
This cleans 

* all stopped containers
* all networks not used by at least one container
* all images without at least one container associated to them
* all build cache


## Build

```
docker build -t [tag] -f [dockerfile path] [build root]
```


## Specify port on target host

```yml
- target: 443
  published: 443
  protocol: tcp
  mode: host
```


## Garbage collection in registry

If your private docker registry is full and contains layers marked for deletion, run this command with the config file present.
```ps
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

## Enable localhost communication in yml

```yml
service_name:
  extra_hosts:
    - host.docker.internal:host-gateway
```