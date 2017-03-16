#!/bin/bash
# openssl will use a config file called `openssl.cnf` in the *CWD*
#
# This script users cert.conf that should look like this ONE LINE:
# /emailAddress=user@example.com/C=US/ST=State/L=City/O=Company Name/OU=Department Name
#
# Otherwise the openssl command will prompt you for the information.

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
if [[ -f cert.conf ]]
then
    SUBJ=$(grep -v "\#" cert.conf | head -1 )
    # See note about about what this file should look like
    openssl req -new -key ${Name}.key -out ${Name}.csr -subj "${SUBJ}/CN=${Name}"
else
    openssl req -new -key ${Name}.key -out ${Name}.csr
fi

# Self Sign CSR
echo "Sign it, but feel free to delete this ${Name}.crt and get a real CA signed key."
openssl x509 -req -days 740 -in ${Name}.csr -signkey ${Name}.key -out ${Name}.crt

# Read the file to double check
openssl x509 -outform PEM -in ${Name}.crt -text -out ${Name}.txt
