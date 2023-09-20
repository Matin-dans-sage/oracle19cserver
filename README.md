<img src="https://img.shields.io/badge/ORACLE%20SERVER-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/DOCKER-2496ED?style=for-the-badge&logo=Python&logoColor=white">

## Download
https://www.oracle.com/kr/database/technologies/oracle19c-linux-downloads.html

Oracle Database 19c (19.3) for Linux x86-64
> LINUX.X64_193000_db_home.zip File Download


## Installation
```bash
git clone https://github.com/Matin-dans-sage/oracle19cserver.git

cd ./oracle19cserver

!!! 💡 Move the LINUX.X64_193000_db_home.zip file into the ./oracle19cserver folder.

vi ./oracle19c_make.sh
(line 3) Change for ORACLE_DOCKER_VOLUME_DIR. This is VOLUME Directory.
(line 4) Change for SYS_PASS.

sh ./oracle19c_make.sh
(y : install / n : cancel)

```

## Notice !
1. The volume path is set to the default: ~/oracle_volume.
2. After launching the Docker container, it takes approximately an additional 10 minutes for the instance to be fully up and running.
3. You can check the progress by using 'docker logs,' and you will see progress indicators such as 8%, 15%, 32%, etc. Once you see 'XDB initialized,' it means that all configurations have been completed.
4. To test access, you can connect to the Oracle container using Docker and access it with 'sqlplus / as sysdba.'

