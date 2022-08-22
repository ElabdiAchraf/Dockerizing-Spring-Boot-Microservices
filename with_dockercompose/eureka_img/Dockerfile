FROM ubuntu:focal
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-get install -y openjdk-11-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME
RUN apt-get -y update
COPY . /myApp

VOLUME /tmp
ARG JAR_FILE
COPY . /myApp
EXPOSE 8761
ENTRYPOINT exec java $JAVA_OPTS -jar /myApp/eurekaServer.jar $ARGS