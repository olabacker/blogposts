Using traefik to serve certificate and routing | [traefik]

## Introduction

Traefik is a reverse proxy that can be used to route traffic to different services. It can also be used to serve certificates for the services. It seems to have a good implementation of using ACME to automatically generate and renew certificates from Let's Encrypt, however, I already have a certificate that I want to use. 

## Docker compose

Below is an example of a docker-compose file that can be used to run traefik and two services. The services are configured to use the same certificate. The certificate is stored in the `certs` folder and the file is mounted to the traefik container.


```yml
version: "3.8"

services:

  traefik:
    image: traefik:v3.0
    command:
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--providers.file.directory=/etc/traefik/dynamic"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
    ports:
      - "80:80"
      - "443:443"
      - "8080:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock:ro"
      - "./certs:/etc/certs/"
      - "./certs-traefik.yml:/etc/traefik/dynamic/certs-traefik.yaml"

  awesomeservice:
    image: olabacker/awesomeservice:0.0.2
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.awesomeservice.rule=Host(`awesomeservice.olabacker.net`)"
      - "traefik.http.routers.awesomeservice.entrypoints=websecure"
      - "traefik.http.routers.awesomeservice.tls=true"

  coolservice:
    image: olabacker/coolservice:0.0.1
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.coolservice.rule=Host(`coolservice.olabacker.net`)"
      - "traefik.http.routers.coolservice.entrypoints=websecure"
      - "traefik.http.routers.coolservice.tls=true"
    
  exceptionalservice:
    image: olabacker/exceptionalservice:0.0.1
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.exceptionalservice.rule=Host(`exceptionalservice.olabacker.net`)"
      - "traefik.http.routers.exceptionalservice.entrypoints=web"
```

The first two services are configured with the `websecure` entrypoint and the `tls` label. This will make traefik serve the certificate for the services. The third service is configured with the `web` entrypoint. This will make traefik route the traffic to the service but not serve the certificate. `websecure` is set to port 443 and `web` is set to port 80.


If the container is hosted on another port it can be set using the `loadbalancer.server.port` label. For example:

`traefik.http.services.name-of-service.loadbalancer.server.port=666`


## certs-traefik.yml

Below is an example of a `certs-traefik.yml` file that can be used to serve certificates for the services. The certificates are stored in the `certs` folder and the file is mounted to the traefik container.

```yml
tls:
  certificates:
    - certFile: /etc/certs/cert.pem
      keyFile: /etc/certs/key.pem
```