FROM golang:1.14.2
MAINTAINER <Potato> <silenceace@gmail.com>

ENV LANG=C.UTF-8


RUN apt-get update
RUN apt-get install -y git python curl nginx unzip zip wget


RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN npm install yarn -g



# get maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

# verify checksum
RUN echo "516923b3955b6035ba6b0a5b031fbd8b /tmp/apache-maven-3.3.9.tar.gz" | md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.3.9.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.9.tar.gz
ENV MAVEN_HOME /opt/maven

# remove download archive files
RUN apt-get clean

# set shell variables for java installation
ENV java_version jdk8u242-b08
ENV filename OpenJDK8U-jdk_x64_linux_hotspot_8u242b08.tar.gz
ENV downloadlink https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/$java_version/$filename

# download java, accepting the license agreement
RUN wget --no-cookies -O /tmp/$filename $downloadlink 

# unpack java
RUN mkdir /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/
ENV JAVA_HOME /opt/java-oracle/$java_version
ENV PATH $JAVA_HOME/bin:$PATH

# configure symbolic links for the java and javac executables
RUN update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000 && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000
