# java-nodejs-python-go-etc docker

[![Build Status][build-status-image]][build-status]
[![Docker Stars](https://img.shields.io/docker/stars/funnyzak/alpine-glibc.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/alpine-glibc/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/alpine-glibc.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/alpine-glibc/)
![GitHub release (latest by date)][latest-release]


[build-status-image]:  https://github.com/funnyzak/java-nodejs-python-go-etc/actions/workflows/build.yml/badge.svg
[build-status]: https://github.com/funnyzak/java-nodejs-python-go-etc/actions
[repo-size-image]: https://img.shields.io/github/repo-size/funnyzak/java-nodejs-python-go-etc?style=flat-square&logo=github&logoColor=white&label=size
[repository-url]: https://github.com/funnyzak/java-nodejs-python-go-etc
[license-image]: https://img.shields.io/github/license/funnyzak/java-nodejs-python-go-etc?style=flat-square&logo=github&logoColor=white&label=license
[latest-commit]: https://img.shields.io/github/last-commit/funnyzak/java-nodejs-python-go-etc
[latest-release]: https://img.shields.io/github/v/release/funnyzak/java-nodejs-python-go-etc

The image is based on the official `debian:stable-date-slim` image, and the main modules are installed.

The image is used for building and deploying projects.

Download size of this image is:

[![Image Size](https://img.shields.io/docker/image-size/funnyzak/alpine-cron)](https://hub.docker.com/r/funnyzak/java-nodejs-python-go-etc/)

[Docker hub image: funnyzak/java-nodejs-python-go-etc](https://hub.docker.com/r/funnyzak/java-nodejs-python-go-etc)

**Docker Pull Command**: `docker pull funnyzak/java-nodejs-python-go-etc:latest`

## Installed

The following modules are installed in the image.

### Base Module

- **nginx** 1.22
- **git** 2.30.2
- **curl** 7.74.0
- **wget** 1.21
- **nrm** 1.2.5
- **ossutil64** 1.7.14
- **ttf-mscorefonts**
- **go** 1.20
- **java** 1.8.0_292
- **mvn** 3.3.9
- **python** 3.9.2
- **node** 16.19.0
- **npm** 8.19.3
- **yarn** 1.22.19
- **certbot**
- **n** 8.2.0
- **tar** 1.34
- **zip** 10.2.1
- **bash** 5.1.4
- **rsync** 3.2.3
- **gzip** 1.10
- **bzip2** 1.0.8
- **openssl** 1.1.1n
- **tree** 1.8.0
- **crontab** 1.5.2
- **rclone** 1.53.3
- **mysql-client** 10.19
- **[webhook 2.8.0](https://github.com/adnanh/webhook)**

### Other

- **tzdata**
- **gcc**
- **g++**
- **[pushoo-cli](https://github.com/funnyzak/pushoo-cli)**

## Usage

### Nginx

Run nginx in the container.

```bash
docker run -d -t -i --name nginx --restart always --privileged=true \
-p 81:80 funnyzak/java-nodejs-python-go-etc nginx -g 'daemon off;'
```

## Package

Some summary of the package in the image.

### OSSUtil

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

```bash
n --version
n [options/env] [COMMAND] [args]
```

## Docker build

```bash
docker build \
--build-arg VCS_REF=`git rev-parse --short HEAD` \
--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
--build-arg VERSION="0.1.0" \
-t funnyzak/java-nodejs-python-go-etc:latest .
```

## Contribution

If you have any questions or suggestions, please feel free to submit an issue or pull request.

<a href="https://github.com/funnyzak/java-nodejs-python-go-etc-docker/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=funnyzak/java-nodejs-python-go-etc-docker" />
</a>

## License

MIT License © 2022 [funnyzak](https://github.com/funnyzak)
