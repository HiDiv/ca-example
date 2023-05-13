#!/bin/sh
rm -rf certs crl csr newcerts private index.txt serial 1>/dev/null 2>&1

mkdir certs crl csr newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial

openssl genrsa -out private/ca.key.pem 4096
chmod 400 private/ca.key.pem

openssl req -config openssl.cnf -key private/ca.key.pem -new -x509 -days 7300 -sha256 -extensions v3_ca -out certs/ca.cert.pem
chmod 444 certs/ca.cert.pem
