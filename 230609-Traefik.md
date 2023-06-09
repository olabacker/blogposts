Using traefik to serve certificate and simple routing | [trafik]


```docker
version: '3.7'

services:
  traefik:
    image: traefik:v2.4
    command:
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.websecure.address=:443"
      - "--certificatesresolvers.myresolver.acme.tlschallenge=true"
      - "--certificatesresolvers.myresolver.acme.email=youremail@test.net"
      - "--certificatesresolvers.myresolver.acme.storage=acme.json"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./certs:/certs
    labels:
      - "traefik.http.routers.api.rule=Host(`monitor.yourdomain.com`)"
      - "traefik.http.routers.api.service=api@internal"
      - "traefik.http.routers.api.middlewares=auth"
      - "traefik.http.routers.api.tls.certresolver=myresolver"
  
  app1:
    image: yourdockerimage1
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app1.rule=Host(`application1.test.net`)"
      - "traefik.http.routers.app1.entrypoints=websecure"
      - "traefik.http.routers.app1.tls.certresolver=myresolver"
  
  app2:
    image: yourdockerimage2
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app2.rule=Host(`application2.test.net`)"
      - "traefik.http.routers.app2.entrypoints=websecure"
      - "traefik.http.routers.app2.tls.certresolver=myresolver"

```