Create a pfx file wih openssl by using manual dns challenge 🔑

## Introduction

This is a quick guide on how to create a pfx file with openssl by using the manual dns challenge with certbot. First off, you need to have a domain and a dns zone for that domain. The dns zone should be hosted by a dns provider which supports dns challenges. The dns provider should also support the creation of txt records. The txt record is used to verify the ownership of the domain.

## Create cert with certbot manually

Certbot is a tool for creating and renewing certificates. It can be used to create a certificate manually by using the dns challenge. This is done by creating a txt record in the dns zone of the domain. The txt record contains a token which is used to verify the ownership of the domain.

```sh
certbot certonly --manual --key-type rsa
```

## Create pfx from cert and key

This is done by using openssl. The cert and key can be found in the certbot folder.

```sh
 openssl pkcs12 -inkey .\privkey.pem -in .\cert.pem -export -out cert.pfx
```

The cert.pfx file is now ready to be used.