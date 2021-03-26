
docker login

#JAVA 8 ORACLE
docker login container-registry.oracle.com
docker pull container-registry.oracle.com/java/serverjre:8
docker image tag container-registry.oracle.com/java/serverjre oracle/serverjre:8

#ALTRIMENTI INSTALLARNE UN ALTRA E POI DARGLI IL NOME CHE VUOLE L'INSTALLER DI WEBLOGIC

sh buildDockerImage.sh -v 12.2.1.3 -d -s
