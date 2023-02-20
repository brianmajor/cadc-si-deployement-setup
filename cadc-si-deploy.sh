
docker network create si

docker run -d \
	--name pg10db \
	-p 5432:5432 -p 5433:5432 \
	--net=si \
	--volume=${CONFIG_FOLDER}/postgres/config:/config:ro \
	--volume=${CONFIG_FOLDER}/postgres/logs:/logs:rw \
	amigahub/cadc-postgresql:latest

docker run -d \
	--name minoc \
	-p 8083:8080 \
	--net=si \
	--volume=${CONFIG_FOLDER}/minoc:/config:ro \
	--volume=${DATA_FOLDER}/minoc:/data:rw \
	images.opencadc.org/storage-inventory/minoc:0.9.0

docker run -d \
	--name minoc \
	-p 8083:8080 \
	--net=si \
	--volume=${CONFIG_FOLDER}/minoc:/config:ro \
	images.opencadc.org/storage-inventory/minoc:0.9.0

docker run -d \
	--name baldur \
	-p 8084:8080 \
	--net=si \
	--volume=${CONFIG_FOLDER}/baldur:/config:ro \
	baldur:latest

docker run -d \
	--name reg \
	-p 8085:8080 \
	--net=si \
	--volume=${CONFIG_FOLDER}/reg:/config:ro \
	reg:latest

docker run -d \
	--name haproxy \
	-p 8443:443 \
	-p 80:80 \
	--net=si \
	--volume=${CONFIG_FOLDER}/haproxy/logs:/logs:rw \
    --volume=${CONFIG_FOLDER}/haproxy/certs/:/config:ro \
    --volume=${CONFIG_FOLDER}/haproxy/config:/usr/local/etc/haproxy/:rw \
    amigahub/cadc-haproxy:latest
