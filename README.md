# java-nodejs-python-go-etc

[![Docker Image Publish](https://github.com/funnyzak/java-nodejs-python-go-etc-docker/actions/workflows/image-publish.yml/badge.svg)](https://github.com/funnyzak/java-nodejs-python-go-etc-docker/actions/workflows/image-publish.yml)
[![Docker Stars][docker-star-image]][repository-url]
[![Docker Pulls][docker-pull-image]][repository-url]
[![GitHub release (latest by date)][latest-release]][repository-url]
[![GitHub][license-image]][repository-url]

The image is based on the official `debian:stable-date-slim` image, and the main modules are installed.

The image is used for building and deploying projects.

Download size of this image is:

[![Image Size][docker-image-size]][docker-hub-url]

[Docker hub image: funnyzak/java-nodejs-python-go-etc][docker-hub-url]

**Docker Pull Command**: `docker pull funnyzak/java-nodejs-python-go-etc:latest`

## Installed Modules

The following modules are installed in the image.

### Base Module

- **nginx** 1.22.1
- **git** 2.39.2
- **curl** 7.88.1
- **wget** 1.21.1
- **nrm** 1.2.6
- **ossutil** 1.7.17
- **ttf-mscorefonts**
- **go** 1.20
- **java** 1.8.0_392 (Temurin)(build 1.8.0_392-b08)
- **mvn** 3.3.9
- **python** 3.11.2
- **pip3**
- **venv**
- **node** 18.13.0
- **pnpm** 9.1.0
- **npm** 9.2.0
- **yarn** 1.22.19
- **certbot** 2.1.0
- **n** 9.2.0
- **tar** 1.34
- **zip** 10.2.1
- **bash** 5.1.4
- **rsync** 3.2.3
- **gzip** 1.10
- **bzip2** 1.0.8
- **openssl** 1.1.1n
- **tree** 1.8.0
- **crontab** 1.5.2
- **rclone** 1.60.1
- **apprise** 
- **mysqldump** 10.19
- **mc(Minio Client)** RELEASE.2023-11-10T21-37-17Z
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

[build-status-image]: https://github.com/funnyzak/java-nodejs-python-go-etc-docker/actions/workflows/build.yml/badge.svg
[build-status]: https://github.com/funnyzak/java-nodejs-python-go-etc-docker/actions
[repository-url]: https://github.com/funnyzak/java-nodejs-python-go-etc-docker
[license-image]: https://img.shields.io/github/license/funnyzak/java-nodejs-python-go-etc-docker?style=flat-square&logo=github&logoColor=white&label=license
[latest-release]: https://img.shields.io/github/v/release/funnyzak/java-nodejs-python-go-etc-docker
[docker-star-image]: https://img.shields.io/docker/stars/funnyzak/java-nodejs-python-go-etc.svg?style=flat-square
[docker-pull-image]: https://img.shields.io/docker/pulls/funnyzak/java-nodejs-python-go-etc.svg?style=flat-square
[docker-image-size]: https://img.shields.io/docker/image-size/funnyzak/java-nodejs-python-go-etc
[docker-hub-url]: https://hub.docker.com/r/funnyzak/java-nodejs-python-go-etc
