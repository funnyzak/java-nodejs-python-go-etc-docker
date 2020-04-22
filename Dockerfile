FROM python:3.9.0a5-alpine3.10

LABEL org.label-schema.vendor="potato<silenceace@gmail.com>" \
    org.label-schema.name="java8-nodejs-python-go-etc" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.description="Java8 mvn3.39 Go1.12 python3.9 node10 npm10 yarn1.16 nginx1.16 openssh zip tar wget rsync git bash webhook" \
    org.label-schema.url="https://yycc.me" \
    org.label-schema.schema-version="1.0"	\
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/funnyzak/java8-nodejs-python-go-etc" 

ENV LANG=C.UTF-8

# Install modules
RUN apk update && apk upgrade && \
    # Install python/make/gcc for gyp compilation.
    apk add --no-cache g++ make && \
    # Install need modules
    apk add --no-cache bash git openssh go rsync npm yarn nodejs curl nginx zip unzip tar wget tzdata && \
    rm  -rf /tmp/* /var/cache/apk/*
    
# fixed nginx: [emerg] open() "/run/nginx/nginx.pid" 
# https://github.com/gliderlabs/docker-alpine/issues/185
RUN mkdir -p /run/nginx

# Go config
RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

# Install Go Webhook
RUN go get github.com/adnanh/webhook

# get maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

# install maven
RUN tar xzf /tmp/apache-maven-3.3.9.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.9.tar.gz
ENV MAVEN_HOME /opt/maven

# set shell variables for java installation
ENV java_version jdk8u242-b08
ENV filename OpenJDK8U-jdk_x64_linux_hotspot_8u242b08.tar.gz
ENV downloadlink https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/$java_version/$filename

# download java
RUN wget --no-cookies -O /tmp/$filename $downloadlink 

# java env
RUN mkdir /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/
RUN rm -f /tmp/$filename
ENV JAVA_HOME /opt/java-oracle/$java_version
ENV JRE_HOME=${JAVA_HOME}/jre
ENV CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
ENV PATH ${JAVA_HOME}/bin:$PATH


RUN mkdir /app && chmod -R 777 /app

WORKDIR /app
