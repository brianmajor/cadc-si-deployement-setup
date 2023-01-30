docker run -d \
	--name reg \
	-p 8085:8080 \
	--user tomcat:tomcat  \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/reg:/usr/share/tomcat/config:ro \
	 reg:latest


docker run -d \
	--name echo \
	-p 8000:8000 \
	--net=si \
	echo:latest

docker run -d \
	--name minoc \
	-p 8083:8080 \
	--user tomcat:tomcat  \
	--net=si \
	--volume=${CONFIG_FOLDER}/config/minoc:/config:ro \
	--volume=${CONFIG_FOLDER}/images:/images:rw \
	--volume=${CONFIG_FOLDER}/config/certs/cadcproxy.pem:/usr/share/tomcat/.ssl/cadcproxy.pem \
	amigahub/minoc:latest