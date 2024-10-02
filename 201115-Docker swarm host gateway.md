Enable localhost communication in docker compose | [docker]

If your container needs to communicate with its host the following can be added to its compose file. 

```yml
service_name:
  extra_hosts:
    - host.docker.internal:host-gateway
```

The containers in this service can then communicate with its host by calling `host.docker.internal` from within the container.