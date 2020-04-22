# go-java-python-node-etc docker

[![Docker Stars](https://img.shields.io/docker/stars/funnyzak/go-java-python-node-etc.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/go-java-python-node-etc/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/hexo-webhook.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/hexo-webhook/)

This is a generic runtime environment Docker.

#### [Docker hub image: funnyzak/go-java-python-node-etc](https://hub.docker.com/r/funnyzak/go-java-python-node-etc)

#### Pull Command: `docker pull funnyzak/go-java-python-node-etc`

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
* tar 1.32
* wget 1.20.3
* rsync 3.13
* git 2.22
* bash
* webhook [Help](https://github.com/adnanh/webhook)

---

## Docker Run

### Nginx

```Docker
docker run -d -t -i --name nginx --restart always --privileged=true \
-p 81:80 funnyzak/go-java-python-node-etc nginx -g 'daemon off;'
```
