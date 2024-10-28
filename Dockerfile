FROM debian:stable-20241016-slim

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=1.6.2
ARG OSSUTIL_VERSION=2.0.3-beta.09261200
ARG GO_VERSION=1.23.2

ENV TZ Asia/Shanghai
ENV LC_ALL C.UTF-8
ENV LANG=C.UTF-8

# base repo
COPY repo/sources.list /etc/apt/sources.list

# Install need modules
RUN apt-get update && \
    # gyp compilation
    apt-get install -y g++ gcc make && \
    # base modules
    apt-get install -y gnupg2 openssl tree bash git vim curl wget

# nginx repo
COPY repo/nginx.list /etc/apt/sources.list.d/nginx.list
RUN curl -L https://nginx.org/keys/nginx_signing.key | apt-key add -

# Install Package
RUN apt-get update && \
    apt-get -y upgrade && \
    # Install modules
    apt-get install -y rsync rclone certbot && \
    apt-get install -y zip nginx unzip gzip bzip2 tar tzdata && \
    # ms fonts
    apt-get install -y ttf-mscorefonts-installer && \
    # cert
    apt-get install -y ca-certificates && \
    # mysql client
    apt-get install -y mariadb-client && \
    # command ps
    apt-get install -y procps && \
    # python
    apt-get install -y python3.11 python3-venv python3-pip && \
    # npm
    apt-get install -y npm && \
    apt-get -y install nodejs && \
    apt-get clean && \
    apt-get -y autoremove

RUN pip3 install apprise

# nrm yarn pnpm
RUN npm install -g nrm 
RUN npm install -g yarn
RUN npm install -g pnpm
RUN npm install -g n

# install pushoo-cli
RUN npm install -g pushoo-cli

# GO
ENV GO_BINARY_TAR_NAME go${GO_VERSION}.linux-amd64
ENV GO_BINARY_TAR_DOWNLOAD_LINK https://dl.google.com/go/${GO_BINARY_TAR_NAME}.tar.gz

RUN wget ${GO_BINARY_TAR_DOWNLOAD_LINK} -O ${GO_BINARY_TAR_NAME}.tar.gz
RUN tar -C /usr/local -xzf ${GO_BINARY_TAR_NAME}.tar.gz
RUN rm ${GO_BINARY_TAR_NAME}.tar.gz
ENV PATH $PATH:/usr/local/go/bin

RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV GOPATH /go

# go: go.mod file not found in current directory or any parent directory; see 'go help modules'"
RUN go env -w GO111MODULE=auto

# # Install Go Webhook
RUN go get github.com/adnanh/webhook

# ossutil64
RUN curl -Lo /opt/ossutil https://gosspublic.alicdn.com/ossutil/v2-beta/2.0.3-beta.09261200/ossutil-2.0.3-beta.09261200-linux-amd64.zip          
RUN chmod 755 /opt/ossutil
RUN ln -s /opt/ossutil /usr/local/bin
ENV PATH /usr/local/bin/ossutil:$PATH

# Minio Client
RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc --create-dirs -o /opt/minio-binaries/mc
RUN chmod +x /opt/minio-binaries/mc
RUN ln -s /opt/minio-binaries/mc /usr/local/bin

# ossutil env
ENV ALIYUN_OSS_ENDPOINT oss-cn-beijing-internal.aliyuncs.com
ENV ALIYUN_OSS_AK_ID hello
ENV ALIYUN_OSS_AK_SID world
RUN ossutil config -e ${ALIYUN_OSS_ENDPOINT} -i ${ALIYUN_OSS_AK_ID} -k ${ALIYUN_OSS_AK_SID} -L CH

# set shell variables for java installation
ENV JAVA_VERSION jdk8u392-b08
ENV JAVA_PACKAGE_FILENAME OpenJDK8U-jdk_x64_linux_hotspot_8u392b08.tar.gz

ENV downloadlink https://github.com/adoptium/temurin8-binaries/releases/download/$JAVA_VERSION/$JAVA_PACKAGE_FILENAME

# download java
RUN wget --no-cookies -O /tmp/$JAVA_PACKAGE_FILENAME $downloadlink 
# java setting
RUN mkdir /opt/java-oracle && tar -zxf /tmp/$JAVA_PACKAGE_FILENAME -C /opt/java-oracle/
RUN rm -f /tmp/$JAVA_PACKAGE_FILENAME
ENV JAVA_HOME /opt/java-oracle/$JAVA_VERSION
ENV JRE_HOME=${JAVA_HOME}/jre
ENV CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
ENV PATH ${JAVA_HOME}/bin:$PATH

# maven
# get maven 3.3.9
ENV maven_package_name apache-maven-3.3.9-bin.tar.gz
ENV maven_package_unzip_name=apache-maven-3.3.9
RUN wget --no-verbose -O /tmp/${maven_package_name} http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/${maven_package_name}
# java setting
RUN tar xzf /tmp/${maven_package_name} -C /opt/
RUN ln -s /opt/${maven_package_unzip_name} /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/${maven_package_name}
ENV MAVEN_HOME /opt/maven

# work dir
WORKDIR /app
COPY ./cmd.sh /
EXPOSE 80

# run start script
CMD ["/bin/bash", "/cmd.sh"]
