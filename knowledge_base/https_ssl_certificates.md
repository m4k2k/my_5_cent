---
tags:
    - openssl
    - certificate
    - ssl
    - https
---

# HTTPS, SSL, Certificate Knowhow

Table of Contents

- [HTTPS, SSL, Certificate Knowhow](#https-ssl-certificate-knowhow)
  - [Generate Webserver SSL Certificate](#generate-webserver-ssl-certificate)
    - [explanation](#explanation)
      - [open points /flaws](#open-points-flaws)
    - [setup environment](#setup-environment)
    - [generate certificate](#generate-certificate)
    - [final file/folder structure](#final-filefolder-structure)
  - [Certificate conversion](#certificate-conversion)
    - [windows only](#windows-only)
      - [cer -\> crt (win)](#cer---crt-win)
      - [crt -\> cer (win)](#crt---cer-win)
    - [linux (and windows)](#linux-and-windows)
      - [openssl reference](#openssl-reference)
      - [cer -\> crt](#cer---crt)
      - [crt -\> cer](#crt---cer)
  - [Theory](#theory)
    - [certificate file-formats](#certificate-file-formats)

## Generate Webserver SSL Certificate

### explanation

- in this example an https server ssl certificate is generated
- the setup uses docker and debian11 as openssl environment
- it can be used for `localhost` or local-ip `127.0.0.1`

#### open points /flaws

- security option `critical` is not used

### setup environment

- STEP1: mount current folder to `/test`
  - `docker run -it --mount "type=bind,source=$pwd,target=/test" --rm debian:11-slim /bin/bash`
- STEP2: `apt update`
- STEP3: `apt install openssl`
- STEP4: Prepare folders e.g. create `/test/certs` (prerequisite!)
- Preparation done

### generate certificate

- STEP1: create config file `/test/local.conf`

```nginx
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no
[req_distinguished_name]
C = US
ST = WA
L = NONE
O = NONE O
OU = NONE OU
CN = localhost
[v3_req]
basicConstraints = CA:TRUE, pathlen:1
keyUsage = keyEncipherment, dataEncipherment, nonRepudiation, digitalSignature
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = localhost
IP.1 = 127.0.0.1
IP.2 = 127.0.0.2
IP.3 = 127.0.0.3
IP.4 = ::1
```

- STEP2: generate certificate `openssl req -x509 -nodes -days 365 -newkey rsa:4096 -config /test/local.conf -keyout /test/local.key -out /test/certs/local.crt`
- STEP3: (optional) generate dhparm e.g. for reverse proxies `openssl dhparam -out /test/certs/dhparam.pem 4096`

### final file/folder structure

```nginx
/test
│   
└───local.conf      <<-- config file for openssl configuration
└───local.key       <<-- key file holding your private key for the certificate
│
└───/certs
    │
    └───dhparam.pem <<-- param file, used for reverse proxies
    └───local.crt   <<-- public certificate file
```

## Certificate conversion

### windows only

#### cer -> crt (win)

Input Binary -> Output Text (Base64)
`certutil -encode in_filename.cer out_filename.crt`

#### crt -> cer (win)

Input Text (Base64) -> Output Binary
`certutil -decode in_filename.crt out_filename.cer`

(partly) source: [link](https://mssec.wordpress.com/2014/03/06/what-is-the-difference-between-the-formats-der-encoded-and-base64-encoded-when-exporting-a-certificate/)

### linux (and windows)

#### openssl reference

```none-format
 -in filename       Input file
 -inform DER|PEM    Input format (DER or PEM)
 -outform DER|PEM   Output format (DER or PEM)
 -out outfile       Output file
```

#### cer -> crt

Input Binary -> Output Text (Base64)
`openssl x509 -inform DER -in YOUR_CERTIFICATE.cer -outform PEM -out YOUR_CERTIFICATE.crt`

#### crt -> cer

Input Text (Base64) -> Output Binary
`openssl x509 -inform PEM -in YOUR_CERTIFICATE.crt -outform DER -out YOUR_CERTIFICATE.cer`

## Theory

### certificate file-formats

- CER (*.cer) is an X.509 certificate, in binary form, DER encoded (binary file).
- CRT (*.crt) is an X.509 certificate, in binary form, (DER) encapsulated (by header and footer lines), PEM encoded (base-64 ascii text file).
- etc..

(partly) source: [link](https://stackoverflow.com/a/16587693)
