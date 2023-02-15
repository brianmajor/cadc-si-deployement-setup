alias curl-auth='curl -v --cacert certs/haproxy-ca-cert.pem --cert certs/cadcproxy.pem'
curl-auth -T test-file.fits https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
curl-auth --head https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
curl -v -X GET --header 'Accept: text/plain' 'http://localhost:8084/baldur/perms?OP=read&ID=TEST1:JUNK/test-file.fits'

curl-auth -v -X GET --header 'Accept: text/plain' 'https://localhost:443/baldur/perms?OP=read&ID=TEST1:JUNK/test-file.fits'

curl -v -X GET --header 'Accept: text/plain' 'http://localhost:8084/baldur/perms?OP=read&ID=TEST1:JUNK/test-file.fits'