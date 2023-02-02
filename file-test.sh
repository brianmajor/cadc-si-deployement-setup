alias curl-auth='curl -v --cacert certs/haproxy-ca-cert.pem --cert certs/cadcproxy.pem'
curl-auth -T test-file.fits https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
curl-auth --head https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
