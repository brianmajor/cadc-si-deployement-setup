
docker network create si

docker run -d \
	--name pg10db1 \
	-p 5432:5432 -p 5433:5432 \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/postgres/config:/config:ro \
	--volume=${CONFIG_FOLDER}/config/postgres/logs:/logs:rw \
	amigahub/cadc-postgresql:latest

docker run -d \
	--name minoc \
	-p 8083:8080 \
	--user tomcat:tomcat  \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/minoc:/config:ro \
	amigahub/minoc:latest

docker run -d \
	--name haproxy \
	-p 8443:443 \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/haproxy/logs:/logs:rw \
    --volume=${CONFIG_FOLDER}/config/haproxy/certs/:/config:ro \
    --volume=${CONFIG_FOLDER}/config/haproxy/config:/usr/local/etc/haproxy/:rw \
    amigahub/cadc-haproxy:latest
