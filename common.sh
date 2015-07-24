#!/bin/bash

export CADATA="cadata"
export CERTDIR="$CADATA/newcerts"
export CAKEY="$CADATA/cakey.pem"
export CACERT="$CADATA/cacert.pem"

mkdir -p "$CADATA" || exit 1
mkdir -p "$CERTDIR" || exit 1
