Create root si folder :

    mkdir si
    cd si


Clone the images or build the image :

    clone :
        docker pull amigahub/cadc-postgresql
        docker pull amigahub/cadc-haproxy
        docker pull amigahub/minoc

    build :
        git clone https://github.com/opencadc/docker-base
        cd docker-base/cadc-postgresql-dev
        docker build -t cadc-postgresql -f Dockerfile.pg10 .
        cd ../../docker-base/cadc-haproxy-dev
        docker build -t cadc-haproxy -f Dockerfile .
        cd ../../docker-base/cadc-tomcat
        docker build -t cadc-tomcat -f Dockerfile .
        cd ../../
        git clone https://github.com/opencadc/storage-inventory.git
        cd storage-inventory/minoc
        gradle clean build -x test
        docker build -t minoc -f Dockerfile .
        cd ../../


setup the config : 

    git clone https://github.com/abhishekghoshhh/cadc-si-deploy
    get absoulte path of cadc-si-deploy
    set CONFIG_FOLDER to absolute path of cadc-si-deploy/config
    example : CONFIG_FOLDER=/Users/abhishekghosh/Desktop/E4R-final/cadc-si-deploy/config
    set DATA_FOLDER to absolute path of cadc-si-deploy/config
    example : DATA_FOLDER=/Users/abhishekghosh/Desktop/E4R-final/cadc-si-deploy/data

chmod -R 777 folder_name


Refference links:

    https://gitlab.com/jsancheziaa/cadc-storage-inventory

Github links:

    https://github.com/opencadc/docker-base
    https://github.com/opencadc/storage-inventory

Confluence links:

    https://confluence.skatelescope.org/display/SRCSC/2023-01-26++SRC+ART+System+Demo+17.3




https://repo.maven.apache.org/maven2/org/opencadc
https://www.ivoa.net/xml/VODataService/VODataService-v1.2.xsd#ParamHTTP