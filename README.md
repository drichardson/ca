Certificate Authority
=====================
This directory contains scripts for managing a simple CA (Certificate Authority) used to
generate TLS certificates for application servers. Because this Certificate Authority
is run by you and is not a well known CA (i.e., it is not included in consumer operating systems),
applications must include the CA certificate in order to verify peers when connecting to
application servers.

Once the certificate authority is created, it's the responsibility of the user of the script
to maintain the generated CA data such as CA cert and key, index, serial numbers, signed certs, etc.
It's intended that these files be checked into source control or be regularly backed up.

Scripts
-------
- `create-ca.sh`: Create a new Certificate Authority
- `make-csr.sh`: Make a Certificate Signing Request
- `sign-csr.sh`: Sign a Certificate Signing Request

Creating a Certificate Authority
--------------------------------
Run `create-ca.sh` to create a new certificate authority. Once you do, the root certificate
for the authority will be installed to cadata/cacert.pem and signed certificates will
be stored under cadata/newcerts when `sign-csr.sh` is run. 

Other CA Tools
--------------
* [Easy RSA](https://github.com/OpenVPN/easy-rsa) - better and easier to use than this project.
