alias curl-auth='curl -v --cacert cadc-si-deploy/certs/haproxy-ca-cert.pem --cert cadc-si-deploy/certs/cadcproxy.pem'
curl-auth -T cadc-si-deploy/test-file.fits https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
curl-auth --head https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
