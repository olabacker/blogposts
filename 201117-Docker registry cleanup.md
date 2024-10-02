Garbage collection in a private docker registry | [docker] [registry]

If your private docker registry is full and contains layers marked for deletion, run this command with the config file present.

```sh
registry garbage-collect config.yml
```

config.yml example

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