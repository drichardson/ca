#!/bin/bash
# Generate a Certificate Signing Request

COMMON_NAME=$1

usage() {
    cat <<EOF
usage: make-csr.sh <common_name> 

arguments:
  common_name The CN field of the certificate. Output files formed from common_name.
EOF
}

if [ -z "$COMMON_NAME" ]; then
    echo "ERROR: Missing common_name"
    usage
    exit 1
fi

set -e
KEY="${COMMON_NAME}.key.pem"
CSR="${COMMON_NAME}.csr.pem"

openssl genrsa -out "$KEY" 2048
chmod 400 "$KEY"
openssl req -sha256 -new -key "$KEY" -out "$CSR" -subj "/CN=${COMMON_NAME}"
chmod 444 "$CSR"

echo "OK - created $KEY and $CSR"

