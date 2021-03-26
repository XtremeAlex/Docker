docker pull oracleinanutshell/oracle-xe-11g

For latest APEX(18.1) user, please pull oracleinanutshell/oracle-xe-11g:18.04-apex first:
# Login http://localhost:8080/apex/apex_admin with following credential:
username: ADMIN
password: Oracle_11g

By default, the password verification is disable(password never expired)
Connect database with following setting:

hostname: localhost
port: 49161
sid: xe
username: system
password: oracle

Password for SYS & SYSTEM
oracle
