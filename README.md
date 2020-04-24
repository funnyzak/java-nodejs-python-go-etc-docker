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

* java 1.8
* go 1.12.12
* python 3.9
* node 10.19.0
* npm 10.19.0
* yarn 1.16.0
* mvn 3.39
* nginx 1.16.1
* openssh 8.1
* zip 3.0
* unzip
* tar 1.32
* wget 1.20.3
* curl
* rsync 3.13
* git 2.22
* bash
* webhook [Help](https://github.com/adnanh/webhook)

## Other Modules

* tzdata
* fc-config
* msttcorefonts

---

## Docker Run

### Nginx Run

```Docker
docker run -d -t -i --name nginx --restart always --privileged=true \
-p 81:80 funnyzak/java8-nodejs-python-go-etc nginx -g 'daemon off;'
```
