CONFIG_FOLDER=/Users/abhishekghosh/Desktop/E4R-final/cadc-storage-inventory

docker network create si

docker run -d \
	--name pg10db \
	-p 5432:5432 -p 5433:5432 \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/postgresql:/config:ro  \
	--volume=${CONFIG_FOLDER}/config/postgresql-logs:/logs:rw \  
	amigahub/cadc-postgresql:latest


docker run -d \
	--name minoc \
	-p 8083:8080 \
	--user tomcat:tomcat  \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/minoc:/config:ro \
	--volume=${CONFIG_FOLDER}/config/client-cert/cadcproxy.pem:/usr/share/tomcat/.ssl/cadcproxy.pem \
	minoc:latest

docker run -d \
	--name reg \
	-p 8085:8080 \
	--user tomcat:tomcat  \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/reg:/usr/share/tomcat/config:ro \
	 reg:latest

docker run -d \
	--name haproxy \
	-p 8443:443 \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/haproxy/logs:/logs:rw \
        --volume=${CONFIG_FOLDER}/config/certs/:/config:ro \
        --volume=${CONFIG_FOLDER}/config/haproxy/config:/usr/local/etc/haproxy/:rw \
        amigahub/cadc-haproxy:latest

docker run -d \
	--name echo \
	-p 8000:8000 \
	--net=si \
	echo:latest


cd /Users/abhishekghosh/Desktop/E4R-final/cadc-si-test
alias curl-auth='curl -v --cacert ca-cert.pem --cert cadcproxy.pem'
curl-auth -T test-file.fits https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits

curl-auth --head https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits

curl-auth -s --location -o output-file.fits -X GET --header 'Accept: text/html' 'https://ws.cadc-ccda.hia-iha.nrc-cnrc.gc.ca/raven/files/cadc:IRIS/I340B4H0.fits'