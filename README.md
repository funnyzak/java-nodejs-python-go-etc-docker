# java8-nodejs-python-go-etc docker

[![Docker Stars](https://img.shields.io/docker/stars/funnyzak/java8-nodejs-python-go-etc.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/java8-nodejs-python-go-etc/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/java8-nodejs-python-go-etc.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/java8-nodejs-python-go-etc/)

This image is based on Alpine Linux image, which is a 432MB image.

Download size of this image is:

[![](https://images.microbadger.com/badges/image/funnyzak/java8-nodejs-python-go-etc.svg)](http://microbadger.com/images/funnyzak/java8-nodejs-python-go-etc)

[Docker hub image: funnyzak/java8-nodejs-python-go-etc](https://hub.docker.com/r/funnyzak/java8-nodejs-python-go-etc)

Docker Pull Command: `docker pull funnyzak/java8-nodejs-python-go-etc`

---

## Environment

### Main Modules

* java 1.8
* go 1.12.12
* python 3.9
* nodejs 10.19.0
* npm 10.19.0
* yarn 1.16.0
* mvn 3.39
* nginx 1.16.1
* openssh 8.1
* zip 3.0
* unzip 6.0
* tar 1.32
* wget 1.20.3
* curl 7.66
* rsync 3.1.3
* git 2.22
* bash 5.0.0
* gzip
* bzip2
* webhook [Help](https://github.com/adnanh/webhook)

### Other Modules

* tzdata
* fc-config
* msttcorefonts
* gcc
* g++
* make

---

## Docker Run

### Nginx Run

```Docker
docker run -d -t -i --name nginx --restart always --privileged=true \
-p 81:80 funnyzak/java8-nodejs-python-go-etc nginx -g 'daemon off;'
```
