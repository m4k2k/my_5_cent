---
tags:
    - password
    - key
---
# Security CMD Collection

## Generate keys / passwords

### Powershell - 48 char

Generate a random secure password: `-join ((33..126) | Get-Random -Count 48 | ForEach-Object { [char]$_ })`

example output: `"697*1_tlI'Z=XY?&)w:h>Joq`isTArF-5#P]Ef,e/";Bz(LV"`

### OpenSSL - Base64 (32 Char)

alternative in linux, generate base64 random key:
`openssl rand -base64 32`
