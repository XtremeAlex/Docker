#!/bin/sh

#BY ALEXANDRU ANDREI DABIJA

declare -a arr=("be-app1-log" "be-app2-log" "nginx-access-log" "nginx-error-log")

for i in "${arr[@]}"
do
  container_name="$i"
  if sudo docker ps -a --format '{{.Names}}' | grep -Eq "^${container_name}\$"; then
    tput setaf 1
    echo -e "\t[${container_name}] ESISTE"
    echo
    tput sgr0

    tput setaf 3
    echo -e  "\t- DOCKER STOP"
    tput sgr0

    tput setaf 0
    docker stop ${container_name}
    tput sgr0

    tput setaf 4
    echo -e "\t- DOCKER REMOVE"
    tput sgr0

    tput setaf 0
    docker  rm ${container_name}
    tput sgr0

  else
    tput setaf 2
    echo  'NON ESISTE IL CONTAINER ' ${container_name}
    tput sgr0
  fi
done

tput setaf 2
echo
echo  "CARICAMENTO CONTAINER =====>"
echo
tput sgr0

#LOG BE-APP1 172.20.0.10 (per comodita ho tolto la porta) -p 8010:9001
  docker run --net xtremealex_local --ip 172.20.0.10 -d --name be-app1-log      -P -v /opt/docker/toolkit/volumes/application_logs/app1services:/app1services mthenw/frontail /app1services/logger.log --url-path /farmaci-mgmt-log   --disable-usage-stats

#LOG BE-APP1 172.20.0.11
  docker run --net xtremealex_local --ip 172.20.0.11 -d --name be-app2-log      -P -v /opt/docker/toolkit/volumes/application_logs/app2services:/app2services mthenw/frontail /app2services/logger.log --url-path /farmaci-conf-log   --disable-usage-stats

#LOG NGINX-ACCESS 172.20.0.12
  docker run --net xtremealex_local --ip 172.20.0.12 -d --name nginx-access-log -P -v /opt/docker/toolkit/volumes/nginx/logs:/logs mthenw/frontail /nginx-access-log/access.log                        --url-path /nginx-access-log   --disable-usage-stats

#LOG NGINX-ERROR 172.20.0.13
  docker run --net xtremealex_local --ip 172.20.0.13 -d --name nginx-error-log  -P -v /opt/docker/toolkit/volumes/nginx/logs:/logs mthenw/frontail /nginx-error-log/error.log                          --url-path /nginx-error-log    --disable-usage-stats

echo
tput setaf 6
docker ps
tput sgr0
