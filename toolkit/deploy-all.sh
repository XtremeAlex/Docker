#!/bin/sh

#BY ALEXANDRU ANDREI DABIJA

echo
echo "#######################################"
echo
docker-compose -f docker-compose.yml up -d

sh deploy-app-logs.sh
echo
echo "#######################################"
echo
