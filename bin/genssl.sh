#!/bin/bash
# openssl will use a config file called `openssl.cnf` in the *CWD*
# You an use this to simplify certificate creation.
# see /etc/pki/tls/openssl.cnf on RHEL 6

Name=${1:-localhost.localdomain}

# OPENSSL="/usr/bin/openssl -config ~/etc/openssl.conf"

# Create private key.
echo "Create private key"
openssl genrsa -out ${Name}.key 2048

# Hey! This is private! Keep it protected!
chmod 600 ${Name}.key

# Extracting Public Key
echo "Extract the public key"
openssl rsa -in ${Name}.key -pubout -out ${Name}.public.key

# Generate a certificate request
echo "Generate a CSR"
#openssl req -config ~/etc/openssl.conf -new -key ${Name}.key -out ${Name}.csr
openssl req -new -key ${Name}.key -out ${Name}.csr

# Self Sign CSR
echo "Sign it, but feel free to delete this ${Name}.crt and get a real CA signed key."
openssl x509 -req -days 740 -in ${Name}.csr -signkey ${Name}.key -out ${Name}.crt

# Read the file to double check
openssl x509 -outform PEM -in ${Name}.crt -text -out ${Name}.txt
