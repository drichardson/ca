#!/bin/bash
# Create a new Certificate Authority.
# Usage: create-ca.sh <name>

CA_NAME=$1
shift

if [ -z "$CA_NAME" ]; then
    echo "Missing Certificate Authority name"
    echo "Usage: create-ca.sh <name>"
    exit 1
fi

source ./common.sh

echo "Creating Certificate Authority named $CA_NAME..."

set -e

# Create the CA certificates
openssl req -new -x509 -days 3650 -extensions v3_ca -newkey rsa:2048 -keyout "$CAKEY" -out "$CACERT" -sha256 -subj "/CN=$CA_NAME"
chmod 400 "$CAKEY"
chmod 444 "$CACERT"

# Setup the serial number and index file.
INDEX="$CADATA/index.txt"
if [ -e "$INDEX" ]; then
    echo "Index file already exists. $INDEX"
    exit 1
fi
touch "$CADATA/index.txt"

SERIAL="$CADATA/serial"
if [ -e "SERIAL" ]; then
    echo "Serial file already exists. $SERIAL"
    exit 1
fi

echo 01 > "$SERIAL"

echo "OK - certificate authority created"
