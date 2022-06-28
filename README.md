# java-nodejs-python-go-etc docker

[![Docker Stars](https://img.shields.io/docker/stars/funnyzak/java-nodejs-python-go-etc.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/java-nodejs-python-go-etc/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/java-nodejs-python-go-etc.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/java-nodejs-python-go-etc/)

This image is based on Debian Linux image, which is a 932MB image.

[Docker hub image: funnyzak/java-nodejs-python-go-etc](https://hub.docker.com/r/funnyzak/java-nodejs-python-go-etc)

Docker Pull Command: `docker pull funnyzak/java-nodejs-python-go-etc`

---

## Environment

## Main Modules

* nginx 1.18.0
* git 2.30.2
* curl 7.74.0
* wget 1.21
* nrm 1.2.5
* ossutil64 1.7.7
* go 1.18.3
* java 1.8.0_282
* mvn 3.3.9
* python 3.9.2
* node 12.22.12
* npm 7.5.2
* yarn 1.22.19
* n 8.2.0
* tar 1.34
* zip 10.2.1
* bash 5.1.4
* rsync 3.2.3
* gzip 1.10
* bzip2 1.0.8
* openssl 1.1.1n
* tree 1.8.0
* crontab 1.5.2
* mariadb-client-10.5
* [webhook 2.8.0](https://github.com/adnanh/webhook)

## Other Modules

* tzdata
* gcc
* g++
* ttf-mscorefonts-installer

## Run

### Nginx

```Docker
docker run -d -t -i --name nginx --restart always --privileged=true \
-p 81:80 funnyzak/java-nodejs-python-go-etc nginx -g 'daemon off;'
```

## Other

### OSSUTil

```bash
# ossutil64 set
ossutil config -e ${ALIYUN_OSS_ENDPOINT} -i ${ALIYUN_OSS_AK_ID} -k ${ALIYUN_OSS_AK_SID} -L CH

# osutils64 sync
ossutil sync -f /app/package/  oss://bucket-name/app/package/
```

### NRM

```bash
nrm ls
nrm use <registry>
```

### N

```
n --version
n [options/env] [COMMAND] [args]
```