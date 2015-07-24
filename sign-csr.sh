#!/bin/bash
# Sign a (CSR) Certificate Signing Request

source ./common.sh

usage() {
    cat <<EOF
usage: sign-csr.sh <certificate_signing_request> <output>

arguments:
  certificate_signing_request - The request to sign.
  output                      - The name of the signed certificate to product.
EOF
}

CSR=$1
if [ -z "$CSR" ]; then
    echo "ERROR: Missing certificate_signing_request."
    usage
    exit 1
fi

CERT=$2
if [ -z "$CERT" ]; then
    echo "ERROR: Missing output"
    usage
    exit 1
fi

openssl ca -keyfile "$CAKEY" -cert "$CACERT" -extensions usr_cert -notext -md sha256 -in "$CSR" -out "$CERT" -config openssl.conf

echo "OK - signed $CSR"

