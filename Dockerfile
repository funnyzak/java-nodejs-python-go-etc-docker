FROM python:3.9.0a5-alpine3.10

LABEL maintainer="potato<silenceace@gmail.com>" \
        description="general environment"

ENV LANG=C.UTF-8

# Install modules
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh go rsync npm yarn nodejs curl nginx zip unzip tar wget

# Go config
RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

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
