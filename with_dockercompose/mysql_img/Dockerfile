FROM ubuntu:focal
# Update Ubuntu
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-get install -y openjdk-11-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN apt-get -y install software-properties-common supervisor
RUN export JAVA_HOME
RUN apt install -y mysql-server
RUN apt-get -y update
RUN mkdir -p /myApp
VOLUME /var/lib/mysql
COPY . /myApp
RUN usermod -d /var/lib/mysql/ mysql
RUN chmod +x ./myApp/dbcreation.sh

# Expose ports.
EXPOSE 3306 
ENTRYPOINT ["/usr/bin/supervisord", "-n"]
