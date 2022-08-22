FROM ubuntu:focal

# Update Ubuntu
RUN apt-get update --fix-missing && apt-get -y upgrade

#  Install supervisor & java jdk 
RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-get install -y openjdk-11-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME
RUN apt-get -y update

RUN apt-get -y install  wget

RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add -
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN  apt install -y mongodb
RUN mkdir -p /data/db
RUN chown -R `id -un` /data/db

# Expose ports.
EXPOSE 27017
