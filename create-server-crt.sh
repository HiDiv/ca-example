#!/bin/sh

openssl genrsa -out private/mail.localhost.key.pem 2048
chmod 400 private/mail.localhost.key.pem

openssl req -config openssl.cnf -key private/mail.localhost.key.pem -new -sha256 -out csr/mail.localhost.csr.pem \
-addext "subjectAltName = DNS:mail.localhost, IP:127.0.0.1"

openssl ca -config openssl.cnf -extensions server_cert -days 375 -notext -md sha256 -in csr/mail.localhost.csr.pem \
-out certs/mail.localhost.cert.pem
chmod 444 certs/mail.localhost.cert.pem
