#!/bin/bash

ORACLE_DOCKER_VOLUME_DIR=oracle_volume
SYS_PASS=ws114

read -p "Do you wish to install this oracle19c docker? (y/n)" yn
if [ $yn = "y" ] 
then

    echo ""
    echo "Step 1. github clone docker-images start!"
    git clone https://github.com/oracle/docker-images.git
    echo "step 1 complete!"

    echo "Step 2. oracle19c binary copy oracle dockerfiles!"
    cp LINUX.X64_193000_db_home.zip ./docker-images/OracleDatabase/SingleInstance/dockerfiles/19.3.0
    echo "step 2 complete!"

    echo "Step 3. oracle docker image build with buildContainerImage! (This job can be very time consuming.. wait plz)"
    ./docker-images/OracleDatabase/SingleInstance/dockerfiles/buildContainerImage.sh -e -v 19.3.0
    sleep 1
    rm -rf ./docker-images
    sleep 1
    echo "step 3 complete!"

    echo "Step 4. make oracle docker volume!"
    cd ~
    mkdir $ORACLE_DOCKER_VOLUME_DIR
    chmod 777 $ORACLE_DOCKER_VOLUME_DIR
    docker volume create $ORACLE_DOCKER_VOLUME_DIR
    echo "step 4 complete!"

    echo "Step 5. oracle docker run and init! (This job can be very time consuming.. wait plz)"
    docker run -d --name oracle_server -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=${SYS_PASS} -e ORACLE_SID=ORCLCDB -v ~/${ORACLE_DOCKER_VOLUME_DIR}:/opt/oracle/oradata oracle/database:19.3.0-ee
    echo "step 5 complete!"

    echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------"
    docker ps |grep oracle
    echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "oracle instance loading... takes about 10 minutes."

else
    echo "this job has been stopped..."
fi