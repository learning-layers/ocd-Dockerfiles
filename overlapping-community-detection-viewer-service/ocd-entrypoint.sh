#!/bin/bash

set -e
rm -rf archive archive.zip
wget -q http://layers.dbis.rwth-aachen.de/jenkins/job/OCDA-Viewer-Service/lastSuccessfulBuild/artifact/*zip*/archive.zip
unzip archive.zip
cd archive/Viewer-Service/service
wget -q http://layers.dbis.rwth-aachen.de/jenkins/job/REST-OCD-Services/lastSuccessfulBuild/artifact/service/i5.las2peer.services.ocd-1.0.jar
cd ..
cd ocd/bin
chmod +x start_derby_server_root.sh
cd ..
cd ..
cd bin
chmod +x start_network_both_services.sh
cd ..
./ocd/bin/start_derby_server_root.sh &
./bin/start_network_both_services.sh