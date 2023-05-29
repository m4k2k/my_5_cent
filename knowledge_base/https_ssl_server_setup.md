
# Generate Webserver SSL Certificate

## explanation

* in this example an https server ssl certificate is generated
* the setup uses docker and debian11 as openssl environment
* it can be used for `localhost` or local-ip `127.0.0.1`

### open points /flaws

* security option `critical` is not used

## setup environment

* STEP1: mount current folder to `/test`
  * `docker run -it --mount "type=bind,source=$pwd,target=/test" --rm debian:11-slim /bin/bash`
* STEP2: `apt update`
* STEP3: `apt install openssl`
* STEP4: Prepare folders e.g. create `/test/certs` (prerequisite!)
* Preparation done

## generate certificate

* STEP1: create config file `/test/local.conf`

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

* STEP2: generate certificate `openssl req -x509 -nodes -days 365 -config /test/local.conf -newkey rsa:4096 -keyout /test/local.key -out /test/certs/local.crt`
* STEP3: (optional) generate dhparm e.g. for reverse proxies `openssl dhparam -out /test/certs/dhparam.pem 4096`

## final file/folder structure

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
