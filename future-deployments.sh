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