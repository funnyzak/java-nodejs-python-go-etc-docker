FROM debian:stable-20221024

LABEL maintainer="leon (github.com/funnyzak)"

LABEL org.label-schema.vendor="leon<silenceace@gmail.com>" \
    org.label-schema.name="java-nodejs-python-go-etc" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.description="Common Application Operating Environment" \
    org.label-schema.url="https://yycc.me" \
    org.label-schema.schema-version="1.3.0"	\
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/funnyzak/java-nodejs-python-go-etc" 

# env
ENV TZ Asia/Shanghai
ENV LC_ALL C.UTF-8
ENV LANG=C.UTF-8
ENV OSSUTIL_VERSION=1.7.14
ENV GO_VERSION=1.18.8

COPY repo/sources.list /etc/apt/sources.list

# Install modules
RUN \
    apt-get update && \
    apt-get -y upgrade && \
    # gyp compilation.
    apt-get install -y g++ gcc make && \
    # Install need modules
    apt-get install -y openssl tree bash git rsync npm nodejs vim && \
    apt-get install -y curl nginx zip unzip gzip bzip2 tar wget tzdata && \
    # ms fonts
    apt-get install -y ttf-mscorefonts-installer && \
    apt-get install -y ca-certificates && \
    apt-get install -y mariadb-client-10.5 && \
    # command ps
    apt-get install -y procps && \
    # python
    apt-get install -y python3.9 && \
    apt-get clean $$ \
    apt-get autoremove

# nrm yarn n
RUN npm install -g nrm yarn n

# GO
ENV GO_BINARY_TAR_NAME go${GO_VERSION}.linux-amd64
ENV GO_BINARY_TAR_DOWNLOAD_LINK https://dl.google.com/go/${GO_BINARY_TAR_NAME}.linux-amd64.tar.gz

RUN wget ${GO_BINARY_TAR_DOWNLOAD_LINK} -O ${GO_BINARY_TAR_NAME}.tar.gz
RUN tar -C /usr/local -xzf ${GO_BINARY_TAR_NAME}.tar.gz
ENV PATH $PATH:/usr/local/go/bin

RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV GOPATH /go

# go: go.mod file not found in current directory or any parent directory; see 'go help modules'"
RUN go env -w GO111MODULE=auto

# # Install Go Webhook
RUN go get github.com/adnanh/webhook

# ossutil64
RUN curl -Lo /opt/ossutil http://gosspublic.alicdn.com/ossutil/$OSSUTIL_VERSION/ossutil64          
RUN chmod 755 /opt/ossutil
RUN ln -s /opt/ossutil /usr/local/bin
ENV PATH /usr/local/bin/ossutil:$PATH

# ossutil env ?
ENV ALIYUN_OSS_ENDPOINT oss-cn-beijing-internal.aliyuncs.com
ENV ALIYUN_OSS_AK_ID hello
ENV ALIYUN_OSS_AK_SID world
RUN ossutil config -e ${ALIYUN_OSS_ENDPOINT} -i ${ALIYUN_OSS_AK_ID} -k ${ALIYUN_OSS_AK_SID} -L CH

# set shell variables for java installation
ENV java_version jdk8u282-b08
ENV java_package_filename OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
ENV downloadlink https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/$java_version/$java_package_filename

# download java
RUN wget --no-cookies -O /tmp/$java_package_filename $downloadlink 
# java setting
RUN mkdir /opt/java-oracle && tar -zxf /tmp/$java_package_filename -C /opt/java-oracle/
RUN rm -f /tmp/$java_package_filename
ENV JAVA_HOME /opt/java-oracle/$java_version
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
