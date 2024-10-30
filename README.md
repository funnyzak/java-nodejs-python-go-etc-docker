# java-nodejs-python-go-etc

[![Docker Image Publish](https://github.com/funnyzak/java-nodejs-python-go-etc-docker/actions/workflows/image-publish.yml/badge.svg)](https://github.com/funnyzak/java-nodejs-python-go-etc-docker/actions/workflows/image-publish.yml)
[![Docker Stars][docker-star-image]][repository-url]
[![Docker Pulls][docker-pull-image]][repository-url]
[![GitHub release (latest by date)][latest-release]][repository-url]
[![GitHub][license-image]][repository-url]

The image is based on the official `debian:stable-date-slim` image and includes essential modules for building and deploying projects.

### Available Images

- **[funnyzak/java-nodejs-python-go-etc](https://hub.docker.com/r/funnyzak/java-nodejs-python-go-etc)**

#### Docker Pull Commands

```bash
# Pull the latest image
docker pull funnyzak/java-nodejs-python-go-etc:latest

# Pull the Java 11 version
docker pull funnyzak/java-nodejs-python-go-etc:java11

# Pull the Java 17 version
docker pull funnyzak/java-nodejs-python-go-etc:java17
```

## Installed Modules

The image includes the following modules:

### Base Modules

- **Java** 1.8.0_432
- **Nginx** 1.22.1
- **Git** 2.39.5
- **Curl** 7.88.1
- **Wget** 1.21.1
- **NRM** 1.2.6
- **OSSUtil** 1.7.17
- **TTF-MScoreFonts**
- **Go** 1.23.2
- **Maven** 3.3.9
- **Python** 3.11.2
- **Pip3**
- **Venv**
- **Node.js** 18.19.0
- **PNPM** 9.12.0
- **NPM** 9.2.0
- **Yarn** 1.22.22
- **Certbot** 2.1.0
- **N** 9.2.0
- **Tar** 1.34
- **Zip** 10.2.1
- **Bash** 5.1.4
- **Rsync** 3.2.3
- **Gzip** 1.10
- **Bzip2** 1.0.8
- **OpenSSL** 1.1.1n
- **Tree** 1.8.0
- **Crontab** 1.5.2
- **Rclone** 1.60.1
- **Apprise** 1.2.0
- **Mysqldump** 10.19
- **Minio Client (mc)** RELEASE.2024-10-08T09-37-26Z
- **[Webhook 2.8.2](https://github.com/adnanh/webhook)**

### Additional Tools

- **Tzdata**
- **GCC**
- **G++**
- **[Pushoo-CLI](https://github.com/funnyzak/pushoo-cli)**

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
[java11-docker-image-size]: https://img.shields.io/docker/image-size/funnyzak/java11-nodejs-python-go-etc
[java11-docker-hub-url]: https://hub.docker.com/r/funnyzak/java11-nodejs-python-go-etc