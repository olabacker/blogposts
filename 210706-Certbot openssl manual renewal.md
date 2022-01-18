Create a pfx file wih openssl by using manual dns challenge 🔑

### Create cert with certbot manually

```ps
certbot certonly --manual
```

### Create pfx from cert and key

```ps
 openssl pkcs12 -inkey .\privkey.pem -in .\cert.pem -export -out cert.pfx
```